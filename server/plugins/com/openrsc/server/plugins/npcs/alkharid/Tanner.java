package com.openrsc.server.plugins.npcs.alkharid;

import com.openrsc.server.external.ItemId;
import com.openrsc.server.model.container.Item;
import com.openrsc.server.model.entity.npc.Npc;
import com.openrsc.server.model.entity.player.Player;
import com.openrsc.server.plugins.listeners.action.TalkToNpcListener;
import com.openrsc.server.plugins.listeners.executive.TalkToNpcExecutiveListener;

import static com.openrsc.server.plugins.Functions.*;

public class Tanner implements TalkToNpcListener, TalkToNpcExecutiveListener {
	@Override
	public void onTalkToNpc(Player p, final Npc n) {
		npcTalk(p, n, "Greeting friend i'm a manufacturer of leather");
		int option = showMenu(p, n, "Can I buy some leather then?",
			"Here's some cow hides, can I buy some leather now?",
			"Leather is rather weak stuff");

		switch (option) {
			case 0:
				npcTalk(p, n, "I make leather from cow hides", "Bring me some of them and a gold coin per hide");
				break;
			case 1:
				npcTalk(p, n, "Ok");
				while (true) {
					sleep(500);
					if (p.getInventory().countId(ItemId.COW_HIDE.id()) < 1) {
						p.message("You have run out of cow hides");
						break;
					} else if (p.getInventory().countId(ItemId.COINS.id()) < 1) {
						p.message("You have run out of coins");
						break;
					} else if (p.getInventory().remove(new Item(ItemId.COW_HIDE.id())) > -1 && p.getInventory().remove(ItemId.COINS.id(), 1) > -1) {
						addItem(p, ItemId.LEATHER.id(), 1);
					} else {
						break;
					}
				}
				break;
			case 2:
				npcTalk(p, n, "Well yes if all you're concerned with is how much it will protect you in a fight");
				break;
		}
	}

	@Override
	public boolean blockTalkToNpc(Player p, Npc n) {
		return n.getID() == 172;
	}

}
