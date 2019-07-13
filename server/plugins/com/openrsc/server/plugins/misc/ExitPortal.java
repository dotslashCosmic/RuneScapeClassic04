package com.openrsc.server.plugins.misc;


import com.openrsc.server.model.entity.GameObject;
import com.openrsc.server.model.entity.player.Player;
import com.openrsc.server.plugins.listeners.action.ObjectActionListener;
import com.openrsc.server.plugins.listeners.executive.ObjectActionExecutiveListener;

public class ExitPortal implements ObjectActionListener, ObjectActionExecutiveListener {
	@Override
	public boolean blockObjectAction(GameObject obj, String command, Player player){
		return obj.getGameObjectDef().getObjectModel().equalsIgnoreCase("portal");
	}

	@Override
	public void onObjectAction(GameObject obj, String command, Player player) {

		if (command.equalsIgnoreCase("exit")) {
			switch (obj.getID()) {//air altar 1214
				case 1214: //air altar
					player.teleport(305,594,false);
					break;
				case 1215: //mind altar
					player.teleport(298,441,false);
					break;
				case 1216://water altar
					player.teleport(148,683,false);
					break;
				case 1217://earth altar
					player.teleport(63,467,false);
					break;
				case 1218://fire altar
					player.teleport(53,634,false);
					break;
				case 1219://body altar
					player.teleport(260,502,false);
					break;
				case 1220://cosmic altar
					player.teleport(0,0,false);
					break;
				case 1221://chaos altar
					player.teleport(0,0,false);
					break;
				case 1222://nature altar
					player.teleport(393,803,false);
					break;
				case 1223://law altar
					player.teleport(410,537,false);
					break;
				case 1224://death altar
					player.teleport(0,0,false);
					break;
				case 1225://blood altar
					player.teleport(0,0,false);
					break;
			}
		}
	}

}
