/**
 * Created by aimozg on 27.01.14.
 */
package classes.Perks
{
import classes.PerkClass;
import classes.PerkType;
import classes.PerkLib;

public class AscensionUnlockPotentialX extends PerkType
{

    override public function desc(params:PerkClass = null):String {
        if (!player || !params) return _desc;
        var pVal:Number = player.perkv1(PerkLib.AscensionAdditionalOrganMutationX);
        return "Your body has adapted to having unnatural organs to the point of being able to sustain up to " + pVal.toString() + " extra mutation" + (pVal > 1 ? "s":"") +" in each organ.";
    }

    override public function name(params:PerkClass=null):String {
        if (!player || !params) return _name;
        var sufval:String = player.perkv1(PerkLib.AscensionAdditionalOrganMutationX).toString();
        return "Ascension: Additional Organ Mutation " + sufval;
    }

    public function AscensionUnlockPotentialX() {
        super("Ascension Additional Organ Mutation", "Ascension Additional Organ Mutation",
                ".");
    }

    public function pBuff():Object{

    }

    override public function keepOnAscension(respec:Boolean = false):Boolean {
        return true;
    }
}
}
