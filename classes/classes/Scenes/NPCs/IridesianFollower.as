/**
 * Multicolored angelic unicorn-gazer hybrid ^^
 * @author Ormael (for now)
 */
package classes.Scenes.NPCs 
{
	public class IridesianFollower 
	{
		
		public function IridesianFollower() 
		{
			
		}
		
	}/*
public function IridesianMainCampMenu():void {
	
}

public function itemImproveMenuPure():void {
	var improvableItems:Array = [
		[weapons.BFSWORD, weapons.NPHBLDE, weapons.EBNYBLD],
		[weapons.DBFSWO, weapons.T_HEART, weapons.DORSOUL],
		[weapons.MASTGLO, weapons.KARMTOU, weapons.YAMARG],
		[weapons.KATANA, weapons.MASAMUN, weapons.BLETTER],
		[weapons.W_STAFF, weapons.U_STAFF, weapons.N_STAFF],
		[weapons.DEMSCYT, weapons.LHSCYTH, null],
		[weapons.UGATANA, weapons.MOONLIT, weapons.C_BLADE],
		[weapons.L__AXE, weapons.WG_GAXE, weapons.DE_GAXE],
		[weapons.SPEAR, weapons.SESPEAR, weapons.DSSPEAR],
		[weapons.JRAPIER, weapons.Q_GUARD, weapons.B_WIDOW],
		[weapons.OTETSU, weapons.POCDEST, weapons.DOCDEST],
		[weapons.BFTHSWORD, weapons.ARMAGED, weapons.CHAOSEA],
		[weaponsrange.BOWLONG, weaponsrange.ARTEMIS, weaponsrange.WILDHUN],
		[weaponsrange.SHUNHAR, weaponsrange.KSLHARP, weaponsrange.LEVHARP],
		[shields.SANCTYN, shields.SANCTYL, shields.SANCTYD],
		[armors.LMARMOR, armors.BMARMOR, armors.S_ARMOR]
	];
	clearOutput();
	outputText("\"<i></i>\"\n\n");
	outputText("\n\n<b>You currently have " + player.keyItemv1("Radiant shard") + " radiant shards.</b>");
	var selectfrom:int = 1;
	var selectMenu:ButtonDataList = new ButtonDataList();
	for (var i:int = 0; i < improvableItems.length; i++) {
		if (improvableItems[i][selectfrom] == null) {/*do nothing*/
		/*}
		else {
			var item:ItemType = improvableItems[i][selectfrom];
			var from:ItemType = improvableItems[i][0];
			selectMenu.add(item.id, curry(improveItem, item, from)).disableIf(!player.hasItem(from),"You need a "+from+" as a base to create this item")
			.disableIf(player.keyItemv1("Radiant shard") < 3,"You need at least three radiant shards in order to create this item.")
			.disableIf(player.gems < 20000,"You need at least 10 000 gems in order to create this item");
		}
	}
	submenu(selectMenu, IridesianMainCampMenu);
	
	function improveItem(item:ItemType, from:ItemType):void {
		clearOutput();
		outputText("\"<i></i>\"\n\n");
		if(player.keyItemv1("Radiant shard") == 3) player.removeKeyItem("Radiant shard");
		else player.addKeyValue("Radiant shard",1,-3);
		player.gems -= 20000;
		player.destroyItems(from, 1);
		inventory.takeItem(item, camp.returnToCampUseOneHour);
	}
}*/
}