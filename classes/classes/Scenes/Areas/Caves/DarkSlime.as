/**
 * ...
 * @author Liadri
 */
package classes.Scenes.Areas.Caves
{
import classes.*;
import classes.BodyParts.Butt;
import classes.BodyParts.Hips;
import classes.BodyParts.LowerBody;
import classes.BodyParts.Skin;
import classes.GlobalFlags.kFLAGS;
import classes.Scenes.SceneLib;
import classes.internals.*;

use namespace CoC;

	public class DarkSlime extends Monster
	{
		override public function playerBoundStruggle():Boolean{
			clearOutput();
			//[Struggle](successful) :
			if (rand(3) == 0 || rand(80) < player.str) {
				outputText("You claw your fingers wildly within the slime and manage to brush against her heart-shaped nucleus. The girl silently gasps and loses cohesion, allowing you to pull yourself free while she attempts to solidify.");
				player.removeStatusEffect(StatusEffects.PlayerBoundPhysical);
			}
			//Failed struggle
			else {
				outputText("You writhe uselessly, trapped inside the goo girl's warm, seething body. Darkness creeps at the edge of your vision as you slow, lulled into surrendering by the rippling vibrations of the girl's pulsing body around yours. ");
				player.takePhysDamage(.15 * player.maxHP(), true);
			}
			return true;
		}

		override public function playerBoundWait():Boolean{
			clearOutput();
			outputText("You writhe uselessly, trapped inside the goo girl's warm, seething body. Darkness creeps at the edge of your vision as you are lulled into surrendering by the rippling vibrations of the girl's pulsing body around yours.");
			player.takePhysDamage(.35 * player.maxHP(), true);
			return true;
		}

		private function gooGalAttack():void
		{
			var damage:Number = 0;
			//return to combat menu when finished
			doNext(EventParser.playerMenu);
			if (hasPerk(PerkLib.Acid)) outputText("Her body quivering from your flames, the dark slime ");
			else outputText("The dark slime holds its hands up and they morph into a replica of your [weapon].  Happily, she swings at you");
			//Determine if dodged!
			if (player.getEvasionRoll()) {
				if (hasPerk(PerkLib.Acid)) outputText("tries to slap you, but you dodge her attack.");
				else outputText(", missing as you dodge aside.");
				return;
			}
			//Determine damage - str modified by enemy toughness!
			if (hasPerk(PerkLib.Acid)) damage = int(((str + 10 + weaponAttack) * 1.5) - rand(player.tou) - player.armorDef);
			else damage = int(((str + weaponAttack) * 1.5) - rand(player.tou) - player.armorDef);

			if (damage <= 0) {
				damage = 0;
				if (hasPerk(PerkLib.Acid)) {
					if (rand(player.armorDef + player.tou) < player.armorDef) outputText("tries to slap you, but the acid-bearing slap spatters weakly off your [armor]. ");
					else outputText("tries to slap you with an acid-loaded hand, but it splatters off you ineffectually. ");
				}
				else {
					//Due to toughness or amor...
					if (rand(player.armorDef + player.tou) < player.armorDef) outputText(", her attack slapping fruitlessly against your [armor]. ");
					else outputText(", her attack splattering ineffectually against you. ");
				}
			}
			//everyone else
			else {
				if (hasPerk(PerkLib.Acid)) {
					outputText("delivers a painful slap across your cheek.  You gasp when the light stinging becomes a searing burn that seems to get worse as time goes on! ");
					if (!player.hasStatusEffect(StatusEffects.AcidSlap)) player.createStatusEffect(StatusEffects.AcidSlap, 0, 0, 0, 0);
				}
				else outputText(", painfully smacking her gooey limbs against your head.  You shake your [hair], clearing your head of the dazing slap. ");
			}
			if (damage > 0) {
				if (lustVuln > 0 && player.armorName == "barely-decent bondage straps") {
					if (!plural) outputText("\n" + capitalA + short + " brushes against your exposed skin and jerks back in surprise, coloring slightly from seeing so much of you revealed. ");
					else outputText("\n" + capitalA + short + " brush against your exposed skin and jerk back in surprise, coloring slightly from seeing so much of you revealed. ");
					lust += 6 * lustVuln;
				}
			}
			if (damage > 0) player.takePhysDamage(damage, true);
			statScreenRefresh();
			outputText("\n");
		}
		private function gooPlay():void
		{
			outputText("The dark slime lunges, wrapping her slimy arms around your waist in a happy hug, hot muck quivering excitedly against you. She looks up, empty eyes confused by your lack of enthusiasm and forms her mouth into a petulant pout before letting go.  You shiver in the cold air, regretting the loss of her embrace.");
			player.takeLustDamage(4 + rand(4) + player.effectiveSensitivity() / 9, true);
		}
		private function gooThrow():void
		{
			outputText("The girl reaches into her torso, pulls a large clump of goo out, and chucks it at you like a child throwing mud. The slime splatters on your chest and creeps under your [armor], tickling your skin like fingers dancing across your body. ");
			var damage:Number = weaponAttack;
			player.takePhysDamage(damage, true);
			player.takeLustDamage(7 + rand(4) + player.effectiveSensitivity() / 9, true);
		}
		private function gooEngulph():void
		{
			outputText("The dark slime gleefully throws her entire body at you and, before you can get out of the way, she has engulfed you in her oozing form! Tendrils of purple slime slide up your nostrils and through your lips, filling your lungs with the girl's muck. You begin suffocating!");
			if (!player.hasStatusEffect(StatusEffects.PlayerBoundPhysical)) player.createStatusEffect(StatusEffects.PlayerBoundPhysical, 0, 0, 0, 0);
		}
		private function darkslimeMagic():void
		{
			outputText("The slime’s hand waves a pattern in the air, creating a weird portal from which a huge glob of slime launches towards you, splashing your entire body. You feel your arousal spike up as the gooey matter soaks into your skin.");
			var damage:int = (inte/3 + rand(inte/2));
			if (inte >= 21 && inte < 41) damage += (inte / 2 + rand((inte * 3) / 4));
			if (inte >= 41 && inte < 61) damage += ((inte * 2) / 3 + rand(inte));
			if (inte >= 61 && inte < 81) damage += ((inte * 5) / 6 + rand(inte * 1.25));
			if (inte >= 81 && inte < 101) damage += (inte + rand(inte * 1.5));
			if (inte >= 101 && inte < 151) damage += ((inte * 1.25) + rand(inte * 1.75));
			if (inte >= 151 && inte < 201) damage += ((inte * 1.5) + rand(inte * 2));
			if (inte >= 201) damage += ((inte * 1.75) + rand(inte * 2.25));
			player.takeMagicDamage(damage, true);
			player.takeLustDamage(20 + rand(8) + player.effectiveSensitivity() / 7, true);
		}
		private function darkslimePoison():void
		{
			outputText("The slime suddenly throws some of its jelly at you. As it sticks to your skin, you start to feel horribly aroused. You have been poisoned with an aphrodisiac!");
			var damage:int = (inte/3 + rand(inte/2));
			if (inte >= 21 && inte < 41) damage += (inte / 2 + rand((inte * 3) / 4));
			if (inte >= 41 && inte < 61) damage += ((inte * 2) / 3 + rand(inte));
			if (inte >= 61 && inte < 81) damage += ((inte * 5) / 6 + rand(inte * 1.25));
			if (inte >= 81 && inte < 101) damage += (inte + rand(inte * 1.5));
			if (inte >= 101 && inte < 151) damage += ((inte * 1.25) + rand(inte * 1.75));
			if (inte >= 151 && inte < 201) damage += ((inte * 1.5) + rand(inte * 2));
			if (inte >= 201) damage += ((inte * 1.75) + rand(inte * 2.25));
			player.takePoisonDamage(damage, true);
			player.takeLustDamage(20 + rand(8) + player.effectiveSensitivity() / 7, true);
		}

		override public function defeated(hpVictory:Boolean):void
		{
			SceneLib.caves.darkslimeScene.beatingDarkSlime();
		}

		override public function won(hpVictory:Boolean, pcCameWorms:Boolean):void
		{
			SceneLib.caves.darkslimeScene.defeatedByDarkSlime();
		}

		public function DarkSlime()
		{
			if (inDungeon) { //EL check
                var mod:int = SceneLib.dungeons.ebonlabyrinth.enemyLevelMod;
                initStrTouSpeInte(160 + 7*mod, 200 + 18*mod, 100 + 10*mod, 150 + 5*mod);
                initWisLibSensCor(150 + 5*mod, 250 + 24*mod, 200 + 20*mod, 20);
                this.weaponAttack = 35 + 2*mod;
                this.armorDef = 20 + 5*mod;
                this.armorMDef = 60 + 15*mod;
                this.bonusHP = 400 + 200*mod;
                this.bonusMana = 100 + 50*mod;
                this.bonusLust = 510 + 48*mod;
                this.level = 60 + 5*mod;
				this.gems = mod > 20 ? 0 : Math.floor((90 + rand(45)) * Math.exp(0.3*mod));
				this.additionalXP = mod > 20 ? 0 : Math.floor(750 * Math.exp(0.3*mod));
			}
			else {
				initStrTouSpeInte(154, 187, 92, 145);
				initWisLibSensCor(145, 226, 182, 20);
				this.weaponAttack = 35;
				this.armorDef = 20;
				this.armorMDef = 60;
				this.bonusHP = 400;
				this.bonusMana = 100;
				this.bonusLust = 463;
				this.level = 55;
			    this.gems = rand(15) + 60; //they're high level, made it more!
			}
			this.a = "";
			this.short = "dark slime";
			this.imageName = "googirl";
			this.long = "This slime looks similar to the goo girls from the lake. However, it’s nucleus is the size of an apple and spherical, not to mention it's purple gel coloration. Surprisingly, it seems intelligent enough to even speak so you better watch out for other oddities.";
			// this.long = false;
			this.createVagina(false, VaginaClass.WETNESS_SLAVERING, VaginaClass.LOOSENESS_NORMAL);
			this.createStatusEffect(StatusEffects.BonusVCapacity, 9001, 0, 0, 0);
			this.createBreastRow(3);
			this.ass.analLooseness = AssClass.LOOSENESS_TIGHT;
			this.ass.analWetness = AssClass.WETNESS_SLIME_DROOLING;
			this.createStatusEffect(StatusEffects.BonusACapacity,9001,0,0,0);
			this.tallness = rand(8) + 70;
			this.hips.type = Hips.RATING_AMPLE;
			this.butt.type = Butt.RATING_LARGE;
			this.lowerBody = LowerBody.GOO;
			this.skin.setBaseOnly({color:"purple",type:Skin.GOO});
			this.hairColor = "purple";
			this.hairLength = 12 + rand(10);
			this.weaponName = "hands";
			this.weaponVerb="slap";
			this.armorName = "gelatinous skin";
			this.lust = 45;
			this.lustVuln = .75;
			this.drop = new ChainedDrop().add(weapons.PIPE,1/10)
					.add(consumables.DSLIMEJ,1/2)
					.elseDrop(useables.GREENGL);
			this.createPerk(PerkLib.FireVulnerability, 0, 0, 0, 0);
			this.createPerk(PerkLib.LightningVulnerability, 0, 0, 0, 0);
			this.createPerk(PerkLib.EnemyGooType, 0, 0, 0, 0);
			this.abilities = [
				{ call: gooGalAttack, type: ABILITY_PHYSICAL, range: RANGE_MELEE, tags:[TAG_FLUID,TAG_ACID]},
				{ call: gooEngulph, type: ABILITY_PHYSICAL, range: RANGE_MELEE, tags:[]},
				{ call: gooPlay, type: ABILITY_TEASE, range: RANGE_MELEE, tags:[TAG_FLUID]},
				{ call: gooThrow, type: ABILITY_PHYSICAL, range: RANGE_RANGED, tags:[TAG_FLUID,TAG_ACID]},
				{ call: darkslimeMagic, type: ABILITY_MAGIC, range: RANGE_RANGED, tags:[TAG_FLUID,TAG_ACID]},
				{ call: darkslimePoison, type: ABILITY_MAGIC, range: RANGE_RANGED, tags:[TAG_FLUID]}
			];
			checkMonster();
		}
	}
}
