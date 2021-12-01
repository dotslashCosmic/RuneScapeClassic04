package com.openrsc.server;

import com.google.common.collect.ArrayListMultimap;
import com.google.common.collect.LinkedHashMultimap;
import com.google.common.collect.Multimap;
import com.google.inject.Key;
import com.openrsc.server.event.rsc.GameTickEvent;
import com.openrsc.server.event.rsc.PluginTickEvent;
import com.openrsc.server.model.entity.Mob;
import com.openrsc.server.model.entity.player.Player;
import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Optional;
import java.util.UUID;

class GameTickEventStore {
    private static final Logger LOGGER = LogManager.getLogger(GameTickEventStore.class);

    private final Object LOCK = new Object();

    /**
     * Tracks whether the event should be added using the criteria determined by the key
     */
    private final Map<GameTickKey, GameTickEvent> events = new LinkedHashMap<>();

    /**
     * Indexes events by username for fast-lookup during individual player tick processing
     */
    private final Multimap<String, GameTickEvent> byUsername = ArrayListMultimap.create();

    /**
     * Keep the non player events ready
     */
    private final Map<GameTickKey, GameTickEvent> nonPlayerEvents = new LinkedHashMap<>();

    /**
     * Index by event type to quickly know if a certain event type exists (i.e. instanceof)
     */
    private final Multimap<Key<? extends GameTickEvent>, GameTickEvent> byType = LinkedHashMultimap.create();

    public boolean add(GameTickEvent event) {
        synchronized (LOCK) {
            final GameTickKey eventKey = getKey(event);

            if (events.containsKey(eventKey)) {
                // We already have an instance of this event
                LOGGER.warn("Tried to add duplicate event: {}", eventKey);
                return false;
            }

            events.put(eventKey, event);
            byType.put(Key.get(event.getClass()), event);
            if (isPlayerOwner(event)) {
                byUsername.put(((Player) event.getOwner()).getUsername(), event);
            } else {
                nonPlayerEvents.put(eventKey, event);
            }
            return true;
        }
    }

    public void remove(GameTickEvent event) {
        synchronized (LOCK) {
            final GameTickKey eventKey = getKey(event);

            if(!events.containsKey(eventKey)) {
                // Event does not exist
                LOGGER.warn("Failed to remove event: {}", eventKey);
                return;
            }

            events.remove(eventKey);
            byType.remove(Key.get(event.getClass()), event);
            if(isPlayerOwner(event)) {
                byUsername.remove(((Player) event.getOwner()).getUsername(), event);
            } else {
                nonPlayerEvents.remove(eventKey);
            }
        }
    }

    public Collection<GameTickEvent> getPlayerEvents(String username) {
        synchronized (LOCK) {
            return new ArrayList<>(byUsername.get(username));
        }
    }

    public Collection<GameTickEvent> getNonPlayerEvents() {
        synchronized (LOCK) {
            return new ArrayList<>(nonPlayerEvents.values());
        }
    }

    public Collection<GameTickEvent> getEvents(Class<? extends GameTickEvent> type) {
        synchronized (LOCK) {
            return byType.get(Key.get(type));
        }
    }

    public boolean hasEvent(Class<? extends GameTickEvent> eventType) {
        synchronized (LOCK) {
            return byType.containsKey(Key.get(eventType));
        }
    }

    public Collection<GameTickEvent> getTrackedEvents() {
        synchronized (LOCK) {
            return new ArrayList<>(events.values());
        }
    }

    private boolean isPlayerOwner(GameTickEvent event) {
        return event.hasOwner() && event.getOwner() instanceof Player;
    }

    private GameTickKey getKey(GameTickEvent event) {
        if(event instanceof PluginTickEvent) {
            return new GameTickKey((PluginTickEvent) event);
        }
        return new GameTickKey(event);
    }

    class GameTickKey {
        private final String name;
        private final Boolean isPlayerEvent;
        private final UUID uuid;

        private GameTickKey(PluginTickEvent event) {
            this.name = event.getPluginName();
            this.isPlayerEvent = isPlayerOwner(event);
            this.uuid = resolveUUID(event);
        }

        private GameTickKey(GameTickEvent event) {
            this.name = String.valueOf(event.getClass());
            this.isPlayerEvent = isPlayerOwner(event);
            this.uuid = resolveUUID(event);
        }

        private UUID resolveUUID(GameTickEvent event) {
            if(event.isNotUniqueEvent()) {
                return event.getUUID();
            } else {
                return Optional.ofNullable(event.getOwner())
                        .map(Mob::getUUID)
                        .orElse(event.getUUID());
            }
        }

        @Override
        public boolean equals(Object o) {
            if (this == o) return true;
            if (o == null || getClass() != o.getClass()) return false;
            GameTickKey that = (GameTickKey) o;
            return new EqualsBuilder()
                    .append(name, that.name)
                    .append(isPlayerEvent, that.isPlayerEvent)
                    .append(uuid, that.uuid).isEquals();
        }

        @Override
        public int hashCode() {
            return new HashCodeBuilder(17, 37)
                    .append(name)
                    .append(isPlayerEvent)
                    .append(uuid)
                    .toHashCode();
        }

        @Override
        public String toString() {
            return "GameTickKey{" +
                    "name='" + name + '\'' +
                    ", isPlayerEvent=" + isPlayerEvent +
                    ", uuid=" + uuid +
                    '}';
        }
    }
}
