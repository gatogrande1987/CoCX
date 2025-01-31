/**
 * ...
 * @author Liadri
 */
package classes.Scenes.Areas.GlacialRift
{
import classes.*;
import classes.GlobalFlags.kFLAGS;
import classes.internals.Utils;
import classes.Scenes.API.MultiBuy;

public class YuWinterGearShop extends BaseContent
	{
		
		public function YuWinterGearShop()
		{}
		
		public function YuIntro():void {
			clearOutput();
			if (flags[kFLAGS.YU_SHOP] == 2) {
				outputText("You decide to visit Yu’s shop. When you enter the cave shop, you are not surprised to see Yu snoring on the counter. You ring a bell, and she jolts up. She sees it’s you and smiles right away.\n\n");
				outputText("\"<i>Welcome welcome! Yu happy that you come visit. Is outlander here to purchase gear?</i>\"");
				YuMenuMain();
			}
			else if (flags[kFLAGS.YU_SHOP] == 1) {
				outputText("As you explore the rift, you find a cave with the entrance decorated with a sign. It reads <i>‘Yu winter gears and sportswear’</i>.\n\n");
				outputText("You go in and find that the yeti indeed has a large inventory of weird winter equipment. Next to her stall is a more conventional housing area with a table made of snow, with food at the ready and a bed carved in solid ice. Now that you think, of it all the furnitures here are carved in solid ice. ");
				outputText("You can only think that her natural body heat allows her to live normally even in this cold climate. Yu notice you’re here and head toward you to hug you warmly.\n\n");
				outputText("\"<i>Welcome welcome! Yu was not sure outlander would find way here. Is outlander here to purchase gear?</i>\"");
				flags[kFLAGS.YU_SHOP] = 2;
				YuMenuMain();
			}
			else {
				outputText("You see a white blurry shape moving at high speed down a nearby mountain towards you. At first, you think it's an avalanche then you realise it’s a woman with a blue scarf and a pair of goggles, surfing on a wooden board.\n\n");
				outputText("\"<i>WOOOOOOO! YU BEST SNOWSURFER IN DA WORLD!!!!!!!!</i>\"\n\n");
				outputText("Yeah, it’s definitely a woman. At first, you mistook her for a human but what you thought was a pair of fur gloves and boots turns out to be her hands and feet. She surfs right by you then stops, making a U-turn in your direction.\n\n");
				outputText("\"<i>Hey, Yu not seen outsider in long time! What outsider’s doing in rift? Is outsider tourist trying to catch cold?</i>\"\n\n");
				outputText("She points at your apparent lack of equipment for the season.\n\n");
				outputText("\"<i>Tourist lucky! Yu owner to small shop of winter gear. Outsider go to Yu cave if wants gear to properly wander around in snow.</i>\"\n\n");
				outputText("Yu laughs, grabs her board and walks away. You guess gearing up for the area wouldn't be a dumb idea.");
				flags[kFLAGS.YU_SHOP] = 1;
				endEncounter();
			}
		}
		
		public function YuMenuMain():void {
			menu();
			addButton(0, "Shop", YuShopMain);
			addButton(1, "Talk", YuShopTalkMain);
			if (flags[kFLAGS.YU_TALKS] == 1) {
				if (player.gender == 0) addButtonDisabled(2, "Sex", "You need to have any gender other than genderless.");
				else addButton(2, "Sex", YuShopSex);
			}
			else addButtonDisabled(2, "Sex", "You need to talk with her first.");
			addButton(14, "Leave", explorer.done);
		}
		public function YuMenuMain2():void {
			clearOutput();
			outputText("You decide to change the subject and thus Yu simply asks back.\n\n");
			outputText("\"<i>Anything else [name] wants of Yu?</i>\"\n\n");
			YuMenuMain();
		}
		
		public function YuShopMain():void {
			clearOutput();
			outputText("You begin to browse Yu’s shop inventory.");
			menu();
			addButton(0, "W.Scarfs", YuShopMainSecond);
			addButton(1, undergarments.F_B_TOP.shortName, confirmBuy, undergarments.F_B_TOP, YuShopMain).hint(undergarments.F_B_TOP.description, "Fur bikini top");
			addButton(2, undergarments.F_PANTY.shortName, confirmBuy, undergarments.F_PANTY, YuShopMain).hint(undergarments.F_PANTY.description, "Fur panty");
			addButton(3, undergarments.F_LOIN_.shortName, confirmBuy, undergarments.F_LOIN_, YuShopMain).hint(undergarments.F_LOIN_.description, "Fur loincloth");
			addButton(4, weapons.NORTHIP.shortName, confirmBuy, weapons.NORTHIP, YuShopMain).hint(weapons.NORTHIP.description, "Northerner ice picks");
			addButton(5, headjewelries.SKIGOGG.shortName, confirmBuy, headjewelries.SKIGOGG, YuShopMain).hint(headjewelries.SKIGOGG.description, "Ski goggles");
			addButton(6, headjewelries.SNOWFH.shortName, confirmBuy, headjewelries.SNOWFH, YuShopMain).hint(headjewelries.SNOWFH.description, "Snowflake hairpin");
			addButton(7, armors.BLIZZ_K.shortName, confirmBuy, armors.BLIZZ_K, YuShopMain).hint(armors.BLIZZ_K.description, "Blizzard Kimono");
			addButton(8, weapons.BCLAWS.shortName, confirmBuy, weapons.BCLAWS, YuShopMain).hint(weapons.BCLAWS.description, "Blizzard Claws");
			addButton(10, miscjewelries.SNOWBOA.shortName, confirmBuy, miscjewelries.SNOWBOA, YuShopMain).hint(miscjewelries.SNOWBOA.description, "Snowboard");
			addButton(12, consumables.SKELP__.shortName, confirmBuy, consumables.SKELP__, YuShopMain).hint(consumables.SKELP__.description, "Skelp");
			addButton(13, consumables.F_TEAR.shortName, confirmBuy, consumables.F_TEAR, YuShopMain).hint(consumables.F_TEAR.description, "Fafnir Tear");
			addButton(14, "Back", YuMenuMain2);
		}

		public function YuShopMainSecond():void {
			menu();
			addButton(0, necklaces.BWSCARF.shortName, confirmBuy, necklaces.BWSCARF, YuShopMainSecond).hint(necklaces.BWSCARF.description, "Blue Winter scarf");
			addButton(1, necklaces.GWSCARF.shortName, confirmBuy, necklaces.GWSCARF, YuShopMainSecond).hint(necklaces.GWSCARF.description, "Green Winter scarf");
			addButton(2, necklaces.PWSCARF.shortName, confirmBuy, necklaces.PWSCARF, YuShopMainSecond).hint(necklaces.PWSCARF.description, "Purple Winter scarf");
			addButton(3, necklaces.RWSCARF.shortName, confirmBuy, necklaces.RWSCARF, YuShopMainSecond).hint(necklaces.RWSCARF.description, "Red Winter scarf");
			addButton(4, necklaces.YWSCARF.shortName, confirmBuy, necklaces.YWSCARF, YuShopMainSecond).hint(necklaces.YWSCARF.description, "Yellow Winter scarf");
			addButton(14, "Back", YuShopMain);
		}

		private function confirmBuy(itype:ItemType, returnFunc:Function):void {
			var descString:String = "You point out the " + itype.longName + " on the shelf.\n\n\"<i>Oh this one? Yu forgot how much it’s worth so Yu offers it to you at discount.</i>\"\n";
			var onBuyString:String = "You bring your purchase to an icy counter and Yu checks up her prices list before exchanging it for your gems.\n\n<i>Thanks for patronage.</i>\"\n\n";

			MultiBuy.confirmBuyMulti(returnFunc, "Yu", 1, itype, descString, onBuyString, false);
		}
		
		public function YuShopTalkMain():void {
			clearOutput();
			outputText("You tell Yu you feel like talking to her, which she responds.\n\n");
			outputText("\"<i>Wanna ask something of Yu? Yu not know much but Yu will try to answer.</i>\"\n\n");
			menu();
			addButton(0, "WhoIsShe", YuShopTalkHerself);
			if (flags[kFLAGS.YU_TALKS] == 1) {
				addButton(1, "Woodplank", YuShopTalkWoodplank);
				addButton(2, "G.Rift", YuShopTalkGlacialRift);
			}
			else {
				addButtonDisabled(1, "Woodplank", "You need to ask who is she first.");
				addButtonDisabled(2, "G.Rift", "You need to ask who is she first.");
			}
			addButton(14, "Back", YuMenuMain2);
		}
		
		public function YuShopTalkHerself():void {
			clearOutput();
			outputText("\"<i>");
			if (flags[kFLAGS.YU_TALKS] == 1) outputText("Yu though you knew but Yu doesn’t mind repeating. ");
			outputText("Yu is Yu! Yu is yeti. Yu born from yeti father and yeti mother. Mother eaten by wolves and father went avenge mother now Yu live alone.</i>\"\n\n");
			outputText("Yu suddenly strikes a thoughtful pose and hugs you warmly as if trying to give some of her warmth to you. You ask her why she does those hugs.\n\n");
			outputText("\"<i>Father told Yu to hug friends when meet them. If friends returns hug Yu can have snu-snu but if friends look bad Yu must strangle till head pop or make snow statue with them so no snu snu.</i>\"\n\n");
			outputText("Yeah, that's a very… simplistic form of courtship. Speaking of which, what happens to demons?\n\n");
			outputText("\"<i>Yu make furniture.</i>\"\n\n");
			outputText("She points at the bed, and you discover there's indeed an imp frozen in a silent scream under the thick layer of ice.");
			if (flags[kFLAGS.YU_TALKS] < 1) flags[kFLAGS.YU_TALKS] = 1;
			doNext(YuShopTalkMain);
		}
		
		public function YuShopTalkWoodplank():void {
			clearOutput();
			outputText("So what exactly is that thing she’s been riding on outside?\n\n");
			outputText("\"<i>Yu call it a snowboard. It’s flat, and it moves downhill superfast if you can hold to it. Yu think this should be a sport activity in Mareth but no one thinks about exercise and good health, it's always demon this demon that.</i>\"\n\n");
			outputText("You could have a snowboard too?\n\n");
			outputText("\"<i>Yea sure! Yu got plenty in shop if [name] need one.</i>\"");
			doNext(YuShopTalkMain);
		}
		
		public function YuShopTalkGlacialRift():void {
			clearOutput();
			outputText("What can she tell you about the rift really?\n\n");
			outputText("\"<i>Rift no place for the weak, or the shivery that's for sure. Yu regularly find frozen travelers around. When that happen, Yu bring home. Some warms up, others... don’t. Cold bad enough but local wildlife bad too.  [name] make sure " + player.mf("he","she") + " is correctly equipped to wander in the snow so Yu don't dig [name]'s hole next okay?</i>\"");
			doNext(YuShopTalkMain);
		}
		
		public function YuShopSex():void {
			clearOutput();
			outputText("You give Yu your name and spontaneously hug Yu. She blushes, surprised by both, but replies to your advances nonetheless.\n\n");
			outputText("\"<i>Yu didn’t think [name] was interested. Yu kind of dumb but Yu sure would like snu snu with [name].</i>\"\n\n");
			outputText("She pulls you to the snowy bed with a dopey smile as she begins to undress. Funnily, undressing for her is as simple as removing her scarf because truthfully she is already pretty much stark naked.\n\n");
			outputText("You depose your gear on the ground as you ready for a hot smoking time with Yu. Truth be told, even if it wasn’t for the cold you would have a hard time resisting the sensation of her wonderful fur on your skin.\n\n");
			sceneHunter.selectGender(dickF, vagF);


			//==========================================================================================================
			function dickF():void {
				outputText("You move your hand across her lovely fur as Yu takes your mouth for a lengthy kiss, dancing with your tongue like the snowflakes outside dance in the wind. Mmmm... it's like being embraced by a warm fluffy blanket." +
						" You slowly get increasingly aroused by the caress of her fur on your skin, [legs] and particularly on your [cock] as her furry crotch slides against yours. You moan in delight and grind yourself against her body in earnest, seeking both her warmth and affection." +
						" Yu seems to enjoy it as well as her body grows increasingly hot against yours. Seeking to magnify this comforting warmth you begin to slide your penis against her leg, moaning as Yu’s fur teases your man flesh." +
						" Yu does not seem, for all lack of proper word, cold to your advances and guides your warmth seeking cock toward her vaginal lips where your tip finally parts the entrance of her most treasured place.");
				if (flags[kFLAGS.YU_SEX] == 1) outputText("\"<i>[name], Yu just can’t wait anymore, so please go in Yu.</i>\"\n\n");
				else outputText("\"<i>[name] be Yu first so please  be gentle with Yu.</i>\"\n\n");
				outputText("Well if she insists, you proceed to slowly insert your shaft inside, taking the time to test every square inch of her warm, wet pussy. Yu hugs you with clear yet restrained strength, which, considering her strong frame and size, you are thankful off. Now that you are fully embedded in her, you can actually feel for yourself how hot she is on the inside. " + (flags[kFLAGS.MET_YETI_FIRST_TIME] == 1 ? "Unsurprisingly, like for all Yeti" : "Surprisingly") + "");
				outputText(" her fluids actually create a tingling warmth in the partner’s body meant to facilitate intercourse even at the lowest ambient temperature. If Yu had wanted to fuck with you in the middle of a blizzard, she could just have. Her cool breath contrasts highly with the warmth of her pussy, and you are pretty sure that " + (flags[kFLAGS.MET_YETI_FIRST_TIME] == 1 ? "just as with all yeti " : "") + "she could freeze you solid by blowing on you if she wanted. ");
				outputText("Yet right now her breath only gives you the right amount of fresh air you need. Snapping from your introspection you resume slowly working Yu’s holes with your pole, enjoying it as the warm yeti’s cunt tightens around you. " +
						"Yu makes small, cute, moaning noises as you proceed to ram yourself in and out, going so far as to use her generous boobs for handles. Finally reaching your limit, you paint her walls white like the snow outside, Yu reaching her own orgasm at the same time.\n\n");
				outputText("\"<i>Yu be... happy. Please stay with Yu a while longer.</i>\"\n\n");
				outputText("Yu looks exhausted but so are you and thus you both doze off, Yu shielding you from the cold with her own body.\n\n");
				if (flags[kFLAGS.YU_SEX] < 1) flags[kFLAGS.YU_SEX] = 1;
				player.sexReward("vaginalFluids","Dick");
				outputText("You wake up in Yu’s cave house a few hours later. Yu is still there sleeping next to you, but you have adventuring to do. You give Yu a parting kiss before grabbing back your gear and traveling back to your camp.\n\n");
				endEncounter();
			}

			function vagF():void {
				outputText("You move your hand across her lovely fur as Yu takes your mouth for a lengthy kiss dancing with your tongue like the snowflakes outside dance in the wind. Mmmm... it's like being embraced by a warm fluffy blanket. You slowly get increasingly aroused by the caress of her fur on your breasts, [legs] and particularly on your [pussy] as her furry crotch slide against yours. ");
				outputText("You moan in delight and grind yourself against her body in earnest, seeking both her warmth and affection. Yu seems to enjoy it as well as her body grows increasingly hot against yours. Seeking to magnify this comforting warmth you begin to slide your cunt against hers, moaning as Yu’s fur covered breast press against your [breasts].\n\n");
				outputText("\"<i>Yu likes to snu-snu close and warm like this. Truthfully [name] should just stay and live with Yu like mom did with dad but Yu thinks it wouldn't be fair to force [name].</i>\"\n\n");
				outputText("You aren’t in any state to protest about this however as your pussy starts to gush from the constant teasing of Yu’s fur all over your body. Yu’s own pussy is soon covered with your girlcum, and she looks somewhat disappointed in you having came way ahead of her but suddenly has an idea as she freezes some snow into a lovely double ended dildo.\n\n");
				outputText("\"<i>It might be a little cold at first so take in some of Yu saliva. It will help make it better.</i>\"\n\n");
				outputText("She kisses you again, exchanging some of her Saliva with yours and to your surprise the ambient cold starts to diminish as your body becomes increasingly hot or increasingly numb perhaps? " + (flags[kFLAGS.MET_YETI_FIRST_TIME] == 1 ? "Unsurprisingly, like for all Yeti" : "Surprisingly") + " her fluids actually create a tingling warmth in the partner’s body meant to facilitate intercourse even at the lowest ambient temperature. ");
				outputText("If Yu had wanted to fuck with you in the middle of a blizzard, she could just have. Her cool breath contrasts highly with the warmth of her pussy, and you are pretty sure that " + (flags[kFLAGS.MET_YETI_FIRST_TIME] == 1 ? "just as with all yeti " : "") + "she could freeze you solid by blowing on you if she wanted. Yet right now her breath only gives you the right amount of fresh air you need. ");
				outputText("While you are lost in thought, Yu uses the opportunity to insert the glacial dildo into your cunt, making you gasp as the homemade toy gives your burning body some seriously needed cool. You need to calm that heat, and the only way you have is this icy dildo! You barely register it as Yu mounts the dildo herself and begins sliding against it, causing it to slide in and out of your own pussy. ");
				outputText("You need it deeper and faster and to make it clear you slide up to the middle of the length causing Yu to yelp in surprise at the swift insertion. Both of you keep fucking until you both cum, your pussy juices freezing on the dildo yet your cunt burning brightly with the need for a good working. Eventually both of you fall off, asleep. Yu making sure to protect you from the cold.\n\n");
				player.sexReward("no", "Vaginal");
				outputText("You wake up in Yu’s cave house a few hours later. Yu is still there sleeping next to you, but you have adventuring to do. You give Yu a parting kiss before grabbing back your gear and traveling back to your camp.\n\n");
				endEncounter();
			}
		}
	}
}
