package classes.GeneticMemories {
  import classes.BaseContent;
  import classes.StatusEffects;
  import classes.BodyParts.*;
  import classes.BodyParts.LowerBody;
	import classes.internals.EnumValue;
	import classes.Transformations.Transformation;
	import classes.CoC;

  public class LowerBodyMem extends BaseContent {
	/**
	 * Entry properties:
	 * - id: the identificator of the Metamorph inside GeneticStorage
	 * - cost: how much SF it costs to metamorph this part (is discounted automatically in Metamorph.as, do not alter the player's SF in metamorphFunc)
	 * - title: name displayed on the metamorph button
	 * - transformation: TF object that refers to what the metamorph does
	 *
	 * Optional properties:
	 * - info: additional text to be shown underneath the Metamorph cost in the menu when hovering over a button
	 * - lockedInfo: additional text to be shown on *locked* Metamorphs when hovering over a button
	 * - isTaur: the Metamorph is a Taur variant of another and should only be displayed after the player became Taur at least once

	 * Template:

		public static const [NAME HERE]:int = [ID HERE];
		EnumValue.add(Memories, [NAME HERE], "[NAME HERE]", {
			id: [Name Saved in GeneticStorage],
			cost: [Cost Here],
			title: "[Race Here]",
			transformation: function(): Transformation {
				return CoC.instance.transformations.[TF Object from TransformationLib];
			}
		});

	 */

    public static var Memories:/*EnumValue*/ Array = [];

		public static const HUMAN: int = 0;
		EnumValue.add(Memories, HUMAN, "HUMAN", {
		  id: "Human Lower Body",
		  cost: 500,
		  title: "Human",
		  transformation: function(): Transformation {
		    return CoC.instance.transformations.LowerBodyHuman
		  }
		});

		public static const HOOFED: int = 1;
		EnumValue.add(Memories, HOOFED, "HOOFED", {
		  id: "Hoofed Lower Body",
		  cost: 100,
		  title: "Hoofed",
		  transformation: function(): Transformation {
		    return CoC.instance.transformations.LowerBodyHoofed(2)
		  }
		});

		public static const HOOFED_TAUR: int = 2;
		EnumValue.add(Memories, HOOFED_TAUR, "HOOFED_TAUR", {
		  id: "Hoofed Lower Body",
		  cost: 200,
		  title: "Hoofed (4)",
		  transformation: function(): Transformation {
		    return CoC.instance.transformations.LowerBodyHoofed(4)
		  },
			isTaur: true
		});

		public static const NAGA: int = 3;
		EnumValue.add(Memories, NAGA, "NAGA", {
		  id: "Snake Lower Body",
		  cost: 100,
		  title: "Naga",
		  transformation: function(): Transformation {
		    return CoC.instance.transformations.LowerBodySnake
		  }
		});

		public static const DEMONIC_HIGH_HEELS: int = 4;
		EnumValue.add(Memories, DEMONIC_HIGH_HEELS, "DEMONIC_HIGH_HEELS", {
		  id: "Demon High Heels Lower Body",
		  cost: 100,
		  title: "Dem. H. Heels",
		  transformation: function(): Transformation {
		    return CoC.instance.transformations.LowerBodyDemonHighHeels
		  }
		});

		public static const DEMONIC_CLAWS: int = 5;
		EnumValue.add(Memories, DEMONIC_CLAWS, "DEMONIC_CLAWS", {
		  id: "Demon Clawed Lower Body",
		  cost: 100,
		  title: "Dem. Claws",
		  transformation: function(): Transformation {
		    return CoC.instance.transformations.LowerBodyDemonClawed
		  }
		});

		public static const BEE: int = 6;
		EnumValue.add(Memories, BEE, "BEE", {
		  id: "Bee Lower Body",
		  cost: 100,
		  title: "Bee",
		  transformation: function(): Transformation {
		    return CoC.instance.transformations.LowerBodyBee
		  }
		});

		public static const CAT: int = 7;
		EnumValue.add(Memories, CAT, "CAT", {
		  id: "Cat Lower Body",
		  cost: 100,
		  title: "Cat",
		  transformation: function(): Transformation {
		    return CoC.instance.transformations.LowerBodyCat(2)
		  }
		});

		public static const CAT_TAUR: int = 8;
		EnumValue.add(Memories, CAT_TAUR, "CAT_TAUR", {
		  id: "Cat Lower Body",
		  cost: 200,
		  title: "Cat (4)",
		  transformation: function(): Transformation {
		    return CoC.instance.transformations.LowerBodyCat(4)
		  }
		});

		public static const LIZARD: int = 9;
		EnumValue.add(Memories, LIZARD, "LIZARD", {
		  id: "Lizard Lower Body",
		  cost: 100,
		  title: "Lizard",
		  transformation: function(): Transformation {
		    return CoC.instance.transformations.LowerBodyLizard(2)
		  }
		});

		public static const LIZARD_TAUR: int = 10;
		EnumValue.add(Memories, LIZARD_TAUR, "LIZARD_TAUR", {
		  id: "Lizard Lower Body",
		  cost: 200,
		  title: "Lizard (4)",
		  transformation: function(): Transformation {
		    return CoC.instance.transformations.LowerBodyLizard(4)
		  },
			isTaur: true
		});

		public static const HARPY: int = 11;
		EnumValue.add(Memories, HARPY, "HARPY", {
		  id: "Harpy Lower Body",
		  cost: 100,
		  title: "Harpy",
		  transformation: function(): Transformation {
		    return CoC.instance.transformations.LowerBodyHarpy
		  }
		});

		public static const CHITINOUS_SPIDER_LEGS: int = 12;
		EnumValue.add(Memories, CHITINOUS_SPIDER_LEGS, "CHITINOUS_SPIDER_LEGS", {
		  id: "Spider Lower Body",
		  cost: 100,
		  title: "Spider",
		  transformation: function(): Transformation {
		    return CoC.instance.transformations.LowerBodySpider
		  }
		});

		public static const DRIDER: int = 13;
		EnumValue.add(Memories, DRIDER, "DRIDER", {
		  id: "Drider Lower Body",
		  cost: 300,
		  title: "Drider",
		  transformation: function(): Transformation {
		    return CoC.instance.transformations.LowerBodyDrider
		  },
			info: "Includes Spider tail and lower body parts."
		});

		public static const FOX: int = 14;
		EnumValue.add(Memories, FOX, "FOX", {
		  id: "Fox Lower Body",
		  cost: 100,
		  title: "Fox",
		  transformation: function(): Transformation {
		    return CoC.instance.transformations.LowerBodyFox(2)
		  }
		});

		public static const FOX_TAUR: int = 15;
		EnumValue.add(Memories, FOX_TAUR, "FOX_TAUR", {
		  id: "Fox Lower Body",
		  cost: 200,
		  title: "Fox (4)",
		  transformation: function(): Transformation {
		    return CoC.instance.transformations.LowerBodyFox(4)
		  },
			isTaur: true
		});

		public static const DRAGON: int = 16;
		EnumValue.add(Memories, DRAGON, "DRAGON", {
		  id: "Draconic Lower Body",
		  cost: 100,
		  title: "Dragon",
		  transformation: function(): Transformation {
		    return CoC.instance.transformations.LowerBodyDraconic(2)
		  }
		});

		public static const DRAGON_TAUR: int = 17;
		EnumValue.add(Memories, DRAGON_TAUR, "DRAGON_TAUR", {
		  id: "Draconic Lower Body",
		  cost: 200,
		  title: "Dragon (4)",
		  transformation: function(): Transformation {
		    return CoC.instance.transformations.LowerBodyDraconic(4)
		  },
			isTaur: true
		});

		public static const CLOVEN_HOOFED: int = 18;
		EnumValue.add(Memories, CLOVEN_HOOFED, "CLOVEN_HOOFED", {
		  id: "Cloven Hoofed Lower Body",
		  cost: 100,
		  title: "Cl. Hoofed",
		  transformation: function(): Transformation {
		    return CoC.instance.transformations.LowerBodyClovenHoofed(2)
		  }
		});

		public static const CLOVEN_HOOFED_TAUR: int = 19;
		EnumValue.add(Memories, CLOVEN_HOOFED_TAUR, "CLOVEN_HOOFED_TAUR", {
		  id: "Cloven Hoofed Lower Body",
		  cost: 200,
		  title: "Cl. Hoofed (4)",
		  transformation: function(): Transformation {
		    return CoC.instance.transformations.LowerBodyClovenHoofed(4)
		  },
			isTaur: true
		});

		public static const SALAMANDER: int = 20;
		EnumValue.add(Memories, SALAMANDER, "SALAMANDER", {
		  id: "Salamander Lower Body",
		  cost: 100,
		  title: "Salamander",
		  transformation: function(): Transformation {
		    return CoC.instance.transformations.LowerBodySalamander(2)
		  }
		});

		public static const SALAMANDER_TAUR: int = 21;
		EnumValue.add(Memories, SALAMANDER_TAUR, "SALAMANDER_TAUR", {
		  id: "Salamander Lower Body",
		  cost: 200,
		  title: "Salam. (4)",
		  transformation: function(): Transformation {
		    return CoC.instance.transformations.LowerBodySalamander(4)
		  },
			isTaur: true
		});

		public static const MANTIS: int = 22;
		EnumValue.add(Memories, MANTIS, "MANTIS", {
		  id: "Mantis Lower Body",
		  cost: 100,
		  title: "Mantis",
		  transformation: function(): Transformation {
		    return CoC.instance.transformations.LowerBodyMantis(2)
		  }
		});

		public static const MANTIS_TAUR: int = 23;
		EnumValue.add(Memories, MANTIS_TAUR, "MANTIS_TAUR", {
		  id: "Mantis Lower Body",
		  cost: 200,
		  title: "Mantis (4)",
		  transformation: function(): Transformation {
		    return CoC.instance.transformations.LowerBodyMantis(4)
		  },
			isTaur: true
		});

		public static const SHARK: int = 24;
		EnumValue.add(Memories, SHARK, "SHARK", {
		  id: "Shark Lower Body",
		  cost: 100,
		  title: "Shark",
		  transformation: function(): Transformation {
		    return CoC.instance.transformations.LowerBodyShark(2)
		  }
		});

		public static const SHARK_TAUR: int = 25;
		EnumValue.add(Memories, SHARK_TAUR, "SHARK_TAUR", {
		  id: "Shark Lower Body",
		  cost: 200,
		  title: "Shark",
		  transformation: function(): Transformation {
		    return CoC.instance.transformations.LowerBodyShark(4)
		  },
			isTaur: true
		});

		public static const LION: int = 26;
		EnumValue.add(Memories, LION, "LION", {
		  id: "Lion Lower Body",
		  cost: 100,
		  title: "Lion",
		  transformation: function(): Transformation {
		    return CoC.instance.transformations.LowerBodyLion(2)
		  }
		});

		public static const LION_TAUR: int = 27;
		EnumValue.add(Memories, LION_TAUR, "LION_TAUR", {
		  id: "Lion Lower Body",
		  cost: 200,
		  title: "Lion (4)",
		  transformation: function(): Transformation {
		    return CoC.instance.transformations.LowerBodyLion(4)
		  },
			isTaur: true
		});

		public static const ORCA: int = 28;
		EnumValue.add(Memories, ORCA, "ORCA", {
		  id: "Orca Lower Body",
		  cost: 100,
		  title: "Orca",
		  transformation: function(): Transformation {
		    return CoC.instance.transformations.LowerBodyOrca(2)
		  }
		});

		public static const ORCA_TAUR: int = 29;
		EnumValue.add(Memories, ORCA_TAUR, "ORCA_TAUR", {
		  id: "Orca Lower Body",
		  cost: 200,
		  title: "Orca (4)",
		  transformation: function(): Transformation {
		    return CoC.instance.transformations.LowerBodyOrca(4)
		  },
			isTaur: true
		});

		public static const ONI: int = 30;
		EnumValue.add(Memories, ONI, "ONI", {
		  id: "Oni Lower Body",
		  cost: 100,
		  title: "Oni",
		  transformation: function(): Transformation {
		    return CoC.instance.transformations.LowerBodyOni
		  }
		});

		public static const ELF: int = 31;
		EnumValue.add(Memories, ELF, "ELF", {
		  id: "Elf Lower Body",
		  cost: 100,
		  title: "Elf",
		  transformation: function(): Transformation {
		    return CoC.instance.transformations.LowerBodyElf
		  }
		});

		public static const RAIJU: int = 32;
		EnumValue.add(Memories, RAIJU, "RAIJU", {
		  id: "Raiju Lower Body",
		  cost: 100,
		  title: "Raiju",
		  transformation: function(): Transformation {
		    return CoC.instance.transformations.LowerBodyRaiju(2)
		  }
		});

		public static const RAIJU_TAUR: int = 33;
		EnumValue.add(Memories, RAIJU_TAUR, "RAIJU_TAUR", {
		  id: "Raiju Lower Body",
		  cost: 100,
		  title: "Raiju (4)",
		  transformation: function(): Transformation {
		    return CoC.instance.transformations.LowerBodyRaiju(4)
		  },
			isTaur: true
		});

		public static const RED_PANDA: int = 34;
		EnumValue.add(Memories, RED_PANDA, "RED_PANDA", {
		  id: "RedPanda Lower Body",
		  cost: 100,
		  title: "Red Panda",
		  transformation: function(): Transformation {
		    return CoC.instance.transformations.LowerBodyRedPanda
		  }
		});

		public static const ORC: int = 35;
		EnumValue.add(Memories, ORC, "ORC", {
		  id: "Orc Lower Body",
		  cost: 100,
		  title: "Orc",
		  transformation: function(): Transformation {
		    return CoC.instance.transformations.LowerBodyOrc
		  }
		});


  }
}
