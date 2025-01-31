/**
 * ...
 * @author Ormael
 */
package classes.Scenes.Areas.Beach 
{
import classes.*;
import classes.BodyParts.Butt;
import classes.BodyParts.Hips;
import classes.BodyParts.LowerBody;
import classes.BodyParts.Skin;
import classes.Scenes.Areas.Lake.GooGirl;
import classes.Scenes.SceneLib;
import classes.internals.*;

	public class GooGirlBeach extends GooGirl
	{
		public function GooGirlBeach() 
		{
			var playerHasBigBoobs:Boolean = player.biggestTitSize() >= 3;
			this.a = "the ";
			this.short = "goo-girl";
			this.imageName = "googirl";
			this.long = "The goo-girl has a curious expression on her youthful, shimmering face. Her slender body drips globs of slime from her limbs, which splatter into the goo puddle forming beneath her hips. In her chest, a small, heart-shaped nucleus pulses with a red glow." + (playerHasBigBoobs ? ("  She seems to have made herself more like you, as her chest now mirrors your own [chest].") : "");
			// this.long = false;
			this.createVagina(false, VaginaClass.WETNESS_SLAVERING, VaginaClass.LOOSENESS_NORMAL);
			this.createStatusEffect(StatusEffects.BonusVCapacity, 9001, 0, 0, 0);
			this.createBreastRow(playerHasBigBoobs ? player.biggestTitSize() : 3);
			this.ass.analLooseness = AssClass.LOOSENESS_TIGHT;
			this.ass.analWetness = AssClass.WETNESS_SLIME_DROOLING;
			this.createStatusEffect(StatusEffects.BonusACapacity,9001,0,0,0);
			this.tallness = rand(6) + 72;
			this.hips.type = Hips.RATING_AMPLE;
			this.butt.type = Butt.RATING_LARGE;
			this.lowerBody = LowerBody.GOO;
			var tone:String = randomChoice("navy blue", "dark purple", "emerald");
			this.skin.setBaseOnly({color:tone,type:Skin.GOO});
			this.hairColor = tone;
			this.hairLength = 12 + rand(10);
			initStrTouSpeInte(123, 194, 105, 90);
			initWisLibSensCor(90, 139, 126, -20);
			this.weaponName = "hands";
			this.weaponVerb="slap";
			this.weaponAttack = 23;
			this.armorName = "gelatinous skin";
			this.armorDef = 16;
			this.armorMDef = 48;
			this.bonusHP = 2250;
			this.bonusLust = 96;
			this.lust = 45;
			this.lustVuln = .75;
			this.level = 34;
			this.gems = rand(7) + 24;
			this.drop = new ChainedDrop().add(weapons.PIPE,1/10)
					.add(consumables.WETCLTH,1/2)
					.elseDrop(useables.GREENGL);
			this.createPerk(PerkLib.FireVulnerability, 0, 0, 0, 0);
			this.createPerk(PerkLib.EnemyGooType, 0, 0, 0, 0);
			checkMonster();
		}
		
	}

}