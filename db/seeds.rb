Faction.destroy_all
GreatOldOne.destroy_all
Spellbook.destroy_all

# Yellow Sign
ys = Faction.create!({
  name: 'Yellow Sign',
  color: 'Yellow',
  display_color: 'yellow',
  description: 'Gains Elder Signs through desecrating areas of the map. Utilizes its zombies to protect its relatively week Great Old Ones.',
  unique_ability: 'Feast (Gather Power Phase): Gain +1 Power for each Area containing both a Desecration token and one or more of your Units.'
})
# Crawling Chaos
cc = Faction.create!({
  name: 'Crawling Chaos',
  color: 'Dark Blue',
  display_color: 'blue',
  description: 'High pre-combat abilites. Relies on Great Old One being on the board.',
  unique_ability: 'Flight (Ongoing): All of your Units can fly (even Cultists). When Moved, they can travel 2 Areas. They can fly over Areas containing enemy units.'
})
# Sleeper
sl = Faction.create!({
  name: 'Sleeper',
  color: 'Orange',
  display_color: 'orange',
  description: 'Excels at delaying enemy factions. Has sludge-like monsters.',
  unique_ability: 'Death from Below (Doom Phase): Place the lowest-cost Monster from your Pool into any Area containing at least 1 of your Units.'
})
# Windwalker
ww = Faction.create!({
  name: 'Windwalker',
  color: 'Light Blue',
  display_color: 'blue',
  description: 'Starts at the poles and slow rolls across the map like an iceberg.',
  unique_ability: 'Hibernate (Action: Cost 0): Gain 1 Power for each enemy Great Old One in play; in doing so you may not gain more Power than the amount of your current total Power. You may no longer perform Actions during this Action Phase (as though you were at 0 Power). Add your current Power to your total during the next Gather Power Phase.'
})
# Opener of the Way
otw = Faction.create!({
  name: 'Opener of the Way',
  color: 'Purple',
  display_color: 'purple',
  description: 'Focuses on manipulating gates to hinder enemy factions.',
  unique_ability: 'The Beyond One (Action: Cost 1): Select one of your Units with a cost of 3+ in an Area that contains a Gate and no enemy Great Old Ones. Move that Unit, the Gate, and any Controlling Unit to any Area on the Map that does not already have a Gate.'
})
# Tcho Tcho
tt = Faction.create!({
  name: 'Tcho Tcho',
  color: 'Pink',
  display_color: 'pink',
  description: 'Focuses on turtling up and delaying enemy factions and slowly increasing its power. Can delay taking its turn until all others are out of power.',
  unique_ability: 'Sycophancy (Doom Phase): When an enemy player does a Ritual of Annihilation, either you gain 1 Doom or he earns 1 fewer Doom, his choice.'
})
# Ancients
anc = Faction.create!({
  name: 'Ancients',
  color: 'Electric Blue',
  display_color: 'cyan',
  description: 'Builds cathedrals to gain Elder Signs and doom. Has the strongest monsters in the game. No Great Old One.',
  unique_ability: 'Dematerialization (Doom Phase): Relocate any or all of your own Units from one Area to a single other Area, anywhere on the Map.'
})
# Black Goat
bg = Faction.create!({
  name: 'Black Goat',
  color: 'Red',
  display_color: 'red',
  description: 'Focuses on quickly creating its army. Can spawn monsters faster and more cheaply than any other faction.',
  unique_ability: 'Fertility Cult (Ongoing): You may Summon Monsters as an Unlimited Action.'
})
# Great Cthulhu
gc = Faction.create!({
  name: 'Great Cthulhu',
  color: 'Green',
  display_color: 'green',
  description: 'Focuses on aggression and controlling the ocean. Great Old One is cheaper to awaken once it has been killed.',
  unique_ability: 'Immortal (Ongoing): Once Cthulhu has Awakened, he costs only 4 Power each subsequent time he is Awakened. Whenever you Awaken any Great Old One, gain 1 Elder Sign.'
})

# Great Old Ones

# Yellow Sign (ys) GOO
GreatOldOne.create!({
  name: 'King in Yellow',
  faction_id: ys.id,
  cost: 4,
  awaken_steps: "1) You must have a Unit in an Area lacking a Gate.\n2) Pay 4 Power. The King appears in that Area.",
  combat: '0',
  ability: 'Desecrate (Action: Cost 2): If the King is in an Area with no Desecration token, roll 1 die. If the roll is equal to or less than the number of your Units in the Area (including the King), place a Desecration token in the Area. Whether you succeed or fail, place a Monster or Cultist with a cost of 2 or less in the Area.'
})
GreatOldOne.create!({
  name: 'Hastur',
  faction_id: ys.id,
  cost: 10,
  awaken_steps: "1) You must have a Controlled Gate and the King in Yellow in the same Area.\n2)Pay 10 Power. Hastur appears in the King's Area.",
  combat: 'Equals the current cost of a Ritual of Annihilation',
  ability: 'Vengeance (Post-Battle): If Hastur is involved in a Battle, choose which Combat results are applied to which enemy Units (e.g., apply a Kill to a particular Great Old One).'
})

# Crawling Chaos (cc) GOO
GreatOldOne.create!({
  name: 'Nyarlathotep',
  faction_id: cc.id,
  cost: 10,
  awaken_steps: "1) You must have a Controlled Gate.\n2) Pay 10 Power. Nyarlathotep appears at the Controlled Gate.",
  combat: 'Equal to the total number of Spellbooks on Faction Cards belonging to you and your enemy.',
  ability: 'The Harbinger (Post-Battle): If Nyarlathotep is in a Battle in which one or more enemy Great Old Ones are Pained or Killed, you receive Power equal to half of the cost of Awakening those Great Old Ones. For each enemy Great Old One Pained or Killed, you may choose to receive 2 Elder Signs instead of Power.'
})

# Sleeper (sl) GOO
GreatOldOne.create!({
  name: 'Tsathoggua',
  faction_id: sl.id,
  cost: 8,
  awaken_steps: "1) You must have a Formless Spawn on the Map.\n2) Pay 8 Power. Place Tsathoggua into the Area with the Formless Spawn.",
  combat: 'Equal to 2 or your opponents current Power, whichever is greater.',
  ability: 'Lethargy (Action: Cost 0): If Tsathoggua is in play, do nothing. This counts as an Action.'
})

# Windwalker (ww) GOO
GreatOldOne.create!({
  name: 'Rhan-Tegoth',
  faction_id: ww.id,
  cost: 6,
  awaken_steps: "1) Pay 6 Power.\n2) Rhan-Tegoth appears in an Area containing the Windwalker Glyph.",
  combat: '3',
  ability: 'Eternal (Post-Battle): If Rhan-Tegoth receives a Pain or a Kill, you may pay 1 Power to cancel its effect on him. He can only receive one combat result per Battle.'
})
GreatOldOne.create!({
  name: 'Ithaqua',
  faction_id: ww.id,
  cost: 6,
  awaken_steps: "1) Rhan-Tegoth has been Awakened (he need not be in play).\n2) A Gate must exist in an Area marked with your Glyph. You need not Control the Gate.\n3) Pay 6 Power and replace the Gate with Ithaqua.",
  combat: 'Equal to half of your opponents Doom, rounded up.',
  ability: 'Ferox (Ongoing): While Ithaqua is in play, your Cultists cannot be Captured by enemy Monsters or Terrors. They are still vulnerable to enemy Great Old Ones.'
})

# Opener of the Way (otw) GOO
GreatOldOne.create!({
  name: 'Yog-Sothoth',
  faction_id: otw.id,
  cost: 6,
  awaken_steps: "1) You must have a Spawn of Yog-Sothoth on the Map.\n2) Pay 6 Power. Replace the Spawn with Yog-Sothoth.",
  combat: 'Equal to twice the number of enemy-controlled Faction Great Old Ones in play.',
  ability: 'The Key and the Gate (Ongoing): Yog-Sothoth counts as a Gate for every purpose, except for the Beyond One ability. Yog-Sothoth is not Controlled by any Cultist, and he can exist in the same area as another Gate.'
})

# Black Goat (bg) GOO
GreatOldOne.create!({
  name: 'Shub-Niggurath',
  faction_id: bg.id,
  cost: 8,
  awaken_steps: "1) You must have a Controlled Gate and at least 2 Cultists on the Map—they can be in any Area(s).\n2) Pay 8 Power.\n3) Remove your 2 Cultists, then place Shub-Niggurath at your Controlled Gate.",
  combat: 'Equal to the sum of your Controlled Gates and in-play Cultists. If you have The Red Sign, add another +1 for each Dark Young you have in play.',
  ability: 'Avatar (Action: Cost 1): Choose an Area and a Faction. Swap the location of Shub-Niggurath with that of a Monster or Cultist in the chosen Area. The owner of the chosen Faction chooses which Unit to relocate.'
})

# Great Cthulhu (gc) GOO
GreatOldOne.create!({
  name: 'Cthulhu',
  faction_id: gc.id,
  cost: 10,
  awaken_steps: "1) There must be a gate in Great Cthulhu's starting Area (can be abandoned or enemy-controlled).\n2) If this is first Awakening, pay 10 Power. Otherwise, pay 4 Power.\n3) Cthulhu appears in its starting Area. (Remember to gain 1 Elder Sign).",
  combat: '6',
  ability: 'Devour (Pre-Battle): The enemy player chooses and Eliminates one of his Monsters or Cultists in the Battle.'
})

# SpellBooks

# Yellow Sign
Spellbook.create!({
  faction_id: ys.id,
  name: 'He Who is Not to be Named',
  use: '1',
  description: 'Move Hastur to any Area containing a Cultist of any Faction. You may then take a second, different Action. You may NOT take The Screaming Dead as your second Action.'
})
Spellbook.create!({
  faction_id: ys.id,
  name: 'Passion',
  use: 'Ongoing',
  description: 'When one or more of your Cultists are Eliminated by an enemy (Killed, Captured, etc.), gain 1 Power.'
})
Spellbook.create!({
  faction_id: ys.id,
  name: 'Shriek of the Byakhee',
  use: '1',
  description: 'Move any or all Byakhee from their current Area(s) to any one Area on the Map.'
})
Spellbook.create!({
  faction_id: ys.id,
  name: 'The Screaming Dead',
  use: '1',
  description: 'Move the King in Yellow to an adjacent Area. Any Undead in the same Area can move with him for free. You may then take a second, different Action. You may NOT take He Who is Not to be Named as your second Action.'
})
Spellbook.create!({
  faction_id: ys.id,
  name: 'The Third Eye',
  use: 'Ongoing',
  description: 'If Hastur is in play, the cost of Desecration is reduced by 1. If the Desecration succeeds, you also receive 1 Elder Sign.'
})
Spellbook.create!({
  faction_id: ys.id,
  name: 'Zingaya',
  use: '1',
  description: 'Choose an Area containing any of your Undead and at least one enemy Acolyte Cultist. Your enemy Eliminates one of his Acolyte Cultists from that Area. Place an Undead from your Pool into that Area.'
})

# Crawling Chaos
Spellbook.create!({
  faction_id: cc.id,
  name: 'Abduct',
  use: 'Pre-Battle',
  description: 'Eliminate one or more Nightgaunts from the Battle. For each one Eliminated, your enemy must Eliminate one of his own Monsters or Cultists from the Battle.'
})
Spellbook.create!({
  faction_id: cc.id,
  name: 'Emissary of the Outer Gods',
  use: 'Post-Battle',
  description: 'Unless an enemy Great Old One is involved in the Battle, a Kill applied to Nyarlathotep becomes a Pain. If Nyarlathotep cannot be Pained due to being surrounded, he is not Eliminated.'
})
Spellbook.create!({
  faction_id: cc.id,
  name: 'Invisibility',
  use: 'Pre-Battle',
  description: 'Select one Monster or Cultist (from either Faction) for each Flying Polyp present and "exempt" it. The selected Unit does not participate in the rest of the Battle.'
})
Spellbook.create!({
  faction_id: cc.id,
  name: 'Madness',
  use: 'Ongoing',
  description: 'After all Pain results have been assigned, you, rather than the Units owners, choose the Area(s) to which all Pained Units will go. You may apply these results in any order (rather than the normal attacker first, then defender), but you must still follow all other rules. Do this even for Battles in which you did not participate.'
})
Spellbook.create!({
  faction_id: cc.id,
  name: 'Seek and Destroy',
  use: 'Pre-Battle',
  description: 'Immediatley move any or all Hunting Horros from and Area(s) into the Battle Area.'
})
Spellbook.create!({
  faction_id: cc.id,
  name: 'The Thousand Forms',
  use: '0',
  description: 'If Nyarlathotep is in play, roll a die. Your foes lose that much Power between them; they have 1 minute to decide how much each loses. If they cannot agree, you receive Power equal to the number rolled. Flip this spellbook over; it cannot be used again in this Action Phase. During the Gather Power Phase, flip it face-up again.'
})

# Sleeper
Spellbook.create!({
  faction_id: sl.id,
  name: 'Ancient Sorcery',
  use: '1',
  description: 'Remove a Serpent Man from the Map and place him on an enemys Faction Card. You now have access to that Factions Unique Ability until the end of the next Doom Phase. At that point, gain 1 Power and replace the Serpent Man anywhere on the Map. If a Factions Unique Ability mentions a Great Old One, it is also considered to include Tsathoggua.'
})
Spellbook.create!({
  faction_id: sl.id,
  name: 'Burrow',
  use: 'Ongoing',
  description: 'After a Move Action in which you have spent 2 or more Power to Move Units, regain 1 Power.'
})
Spellbook.create!({
  faction_id: sl.id,
  name: 'Capture Monster',
  use: '1',
  description: 'Tsathoggua can Capture enemy Monsters in the same way in which Cultists are Captured. These Monsters are sacrificed for 1 Power each in the next Gather Power Phase.'
})
Spellbook.create!({
  faction_id: sl.id,
  name: 'Cursed Slumber',
  use: '1',
  description: 'Remove one of your Controlled Gates and its Cultist from the Map, and place them on your Faction Card. This Gate and Cultist still provide Doom and Power, but are immune to enemy abilities and Spellbooks. For 1 Power, as an Action, you may return the Gate and Cultist to any Area on the Map without a Gate. You may only have 1 Gate on your Faction Card at any time.'
})
Spellbook.create!({
  faction_id: sl.id,
  name: 'Demand Sacrifice',
  use: 'Pre-Battle',
  description: 'If Tsathoggua is in play, your enemy chooses ONE of the following options before a battle with you: 1) You gain an Elder Sign. OR 2) All of their Kill results against your Units in this Battle count as Pains, instead.'
})
Spellbook.create!({
  faction_id: sl.id,
  name: 'Energy Nexus',
  use: 'Ongoing',
  description: 'Just before a Battle in an Area containing a Wizard, you may take one Action that originates in the Area for its normal Power cost. The Battle proceeds once that Action is finished, starting with Pre-Battle Spellbooks and abilities.'
})

# Windwalker
Spellbook.create!({
  faction_id: ww.id,
  name: 'Artic Wind',
  use: 'Ongoing',
  description: 'When Ithaqua uses the Move Action, any or all your Units in the same Area can Move with him for no additional cost.'
})
Spellbook.create!({
  faction_id: ww.id,
  name: 'Berserkergang',
  use: 'Post-Battle',
  description: 'For each Gnoph-Keh assigned a Kill in Battle, the enemy must Eliminate 1 of his own Monsters or Cultists.'
})
Spellbook.create!({
  faction_id: ww.id,
  name: 'Herald of the Outer Gods',
  use: 'Ongoing',
  description: 'Pay 5 Power for Windwalkers Ritual of Annihilation, regardless of the number indicated on the Ritual track.'
})
Spellbook.create!({
  faction_id: ww.id,
  name: 'Howl',
  use: 'Pre-Battle',
  description: 'Before Battle, if any Wendigos are present, you may force the enemy to Retreat one Unit (of their choice) out of the Area and into an adjacent Area. This is not a Pain - the Unit may be moved to an Area containing your Units.'
})
Spellbook.create!({
  faction_id: ww.id,
  name: 'Ice Age',
  use: '1',
  description: 'Place your Ice Age token into any Area. When an enemy Faction takes any Action ending in the Ice Age Area, they must spend +1 Power.'
})

# Opener of the Way
Spellbook.create!({
  faction_id: otw.id,
  name: 'Chanerl Power',
  use: 'Battle',
  description: 'After rolling Battle dice, you may pay 1 Power to reroll all dice which were not Kills or Pains. You may do this more than once.'
})
Spellbook.create!({
  faction_id: otw.id,
  name: 'Dragon Ascending',
  use: 'Once Only',
  description: 'Once during the game (at any time), set your Power to be equal to the current Power of one chosen enemy Faction. Flip this Spellbook face-down after use to indicate you cannot use it again.'
})
Spellbook.create!({
  faction_id: otw.id,
  name: 'Dragon Descending',
  use: 'Once Only',
  description: 'Once during the game when you perform a Ritual of Annihilation, you receive twice the normal Doom points. Flip this Spellbook face-down after use to indicate you cannot use it again.'
})
Spellbook.create!({
  faction_id: otw.id,
  name: 'Dread Curse of Azathoth',
  use: '2',
  description: 'Select an Area and roll 1 die for each Abomination and Spawn of Yog-Sothoth in play. Apply any Kills and Pains to enemy Factions in the Area. You choose which Factions receive which results, but they choose which of their Units receives each result. No Battle-type abilities apply. You choose the Area into which each Unit is Pained, ignoring normal Pain rules.'
})
Spellbook.create!({
  faction_id: otw.id,
  name: 'The Million Favored Ones',
  use: 'Post-Battle',
  description: 'After Pains and Kills are resolved, replace any or all surviving Acolytes with Mutants, Mutants with Abominations, and Abominations with Spawns of Yog-Sothoth. You can replace a Spawn of Yog-Sothoth with as many Mutants as are in your Pool.'
})
Spellbook.create!({
  faction_id: otw.id,
  name: 'They Break Through',
  use: 'Ongoing',
  description: 'You can Summon Monsters at enemy-controlled and/or Abandoned Gates. You do not need to have any Units present in the Area.'
})

#################
### Tcho Tcho ###


# Ancients
Spellbook.create!({
  faction_id: anc.id,
  name: 'Brainless',
  use: 'Ongoing',
  description: 'Reanimated now cost 1 Power to Summon. They may only Move, Capture, or declare Battle if they share an Area with one or more of your non-Reanimated Units.'
})
Spellbook.create!({
  faction_id: anc.id,
  name: 'Consecration',
  use: 'Doom Phase',
  description: 'When you perform a Ritual of Annihilation, gain 1 Elder Sign if at least one Cathedral is in play. If all four Cathedrals are in play, gain 2 Elder Signs instead.'
})
Spellbook.create!({
  faction_id: anc.id,
  name: 'Extinction',
  use: 'Ongoing',
  description: 'Yothans now cost 3 Power to Summon. When a Yothan is Killed or Eliminated, remove it permanently from the game.'
})
Spellbook.create!({
  faction_id: anc.id,
  name: 'Festival',
  use: 'Ongoing',
  description: 'Un-Men now cost 0 Power to Summon. When you Summon an Un-Man, also select an enemy to gain 1 Power.'
})
Spellbook.create!({
  faction_id: anc.id,
  name: 'Unholy Ground',
  use: 'Post-Battle',
  description: 'If there is a Cathedral in the Battle Area, you may choose to remove a Cathedral from anywhere. If you do, an enemy Great Old One in the Battle must be Eliminated by its owner.'
})
Spellbook.create!({
  faction_id: anc.id,
  name: 'Worship Sevices',
  use: 'Gather Power Phase',
  description: 'Gain 1 Power for each Cathedral that shares an Area with an enemy Gate. Those enemies each gain 1 Power.'
})

# Black Goat
Spellbook.create!({
  faction_id: bg.id,
  name: 'Blood Sacrifice',
  use: 'Doom Phase',
  description: 'If Shub-Niggurath is in play during the Doom Phase, you can choose to eliminate one of your Cultists. If you do, gain 1 Elder Sign.'
})
Spellbook.create!({
  faction_id: bg.id,
  name: 'Frenzy',
  use: 'Ongoing',
  description: 'Your Cultist now have 1 Combat.'
})
Spellbook.create!({
  faction_id: bg.id,
  name: 'Frenzy',
  use: 'Ongoing',
  description: 'Roll a die. If the result is less than or equal to the number of Areas containing Fungi, your enemies must Eliminate a number of Cultists equal to the die roll. They have 1 minute in which to decide how to distribute these Eliminations. If time runs out, you choose for them. If the die roll is greater than the number of Areas with Fungi, place any Factions Acolyte anywhere on the map.'
})
Spellbook.create!({
  faction_id: bg.id,
  name: 'Necrophagy',
  use: 'Post-Battle',
  description: 'Move any or all Ghouls (who did not participate in the Battle) from any Area to the Battle Area, even if your Faction was not involved in the Battle. Each side involved in the Battle suffers an additional Pain result for each Ghoul moved in this way.'
})
Spellbook.create!({
  faction_id: bg.id,
  name: 'The Red Sign',
  use: 'Ongoing',
  description: 'Dark Young can Create and Control Gates. Each adds 1 to Shub-Nigguraths Combat and each provides 1 Power during the Gather Power Phase. They do not act as Cultists with respect to any other purpose.'
})
Spellbook.create!({
  faction_id: bg.id,
  name: 'The Thousand Young',
  use: 'Ongoing',
  description: 'If Shub-Niggurath is in play, Ghouls, Fungi, and Dark Young each cost 1 less Power to Summon.'
})

# Great Cthulhu
Spellbook.create!({
  faction_id: gc.id,
  name: 'Absorb',
  use: 'Pre-Battle',
  description: 'If a Shoggoth is present, Eliminate one or more of your Monsters or Cultists in the Battle. For each Unit so removed, add 3 dice to the Shoggoths Combat for that Battle.'
})
Spellbook.create!({
  faction_id: gc.id,
  name: 'Devolve',
  use: 'Ongoing',
  description: 'After any players Action, you may replace any number of your Acolyte Cultists on the Map with the same number of Deep Ones from your Pool.'
})
Spellbook.create!({
  faction_id: gc.id,
  name: 'Dreams',
  use: '2',
  description: 'Choose an Area containing an enemys Acolyte Cultist. Your enemy must Eliminate one of his Acolyte Cultists from that Area and replace it with one from your Pool.'
})
Spellbook.create!({
  faction_id: gc.id,
  name: 'Regenerate',
  use: 'Post-Battle',
  description: 'Assign up to 2 Kill or Pain Battle results to the same Starspawn. If 2 Kills are applied, the Starpspawn is Killed. On any other combination of Kill or Pain results, the Starspawn is only Pained.'
})
Spellbook.create!({
  faction_id: gc.id,
  name: 'Submerge',
  use: '1',
  description: 'If Cthulhu is in an ocean or sea Area, remove him from the Map and place him on your Faction Card, along with any or all of your Units in the Area. Later, as a 0-cost Action, you may place Cthulhu, plus all accompanying Units, into any Area.'
})
Spellbook.create!({
  faction_id: gc.id,
  name: "Y'ha Nthlei",
  use: 'Ongoing',
  description: 'During the Gather Power Phase, if Cthulhu is in play, gain 1 Power for each enemy-controlled Gate in an ocean or sea Area.'
})
