# Equipment Balance Analysis

**Source:** `asset/demonax-test.sqlite` → `items` table
**Analysis Date:** 2026-02-17
**Rendering Reference:** `qmd/library/equipment.qmd`

> **Note:** Skills 6 (Shielding) and 7 (Distance) were previously not decoded in `equipment.qmd` and rendered blank — this has been fixed. Items that were affected are marked **(\*bug)** in the catalog below for traceability. Skills 14 (regeneration), 16 (invisibility), 20 (anti-drunkenness), and 21 (mana shield) have since been decoded.

---

## 1. Full Equipment Catalog

### Damage Type Bitfield Reference

| Bit | Type |
|-----|------|
| 1 | Physical |
| 2 | Poison |
| 4 | Fire |
| 8 | Energy |
| 32 | Poison (periodic) |
| 64 | Fire (periodic) |
| 128 | Energy (periodic) |
| 256 | Lifedrain |
| 512 | Manadrain |
| 15 | Physical + Poison + Fire + Energy (elemental) |

### Profession Bitfield Reference

| Value | Vocations |
|-------|-----------|
| null / 1 | All vocations |
| 2 | Knight |
| 4 | Paladin |
| 6 | Knight, Paladin |
| 8 | Sorcerer |
| 16 | Druid |
| 24 | Sorcerer, Druid (Mage) |

---

### 1.1 Helmets (BodyPosition = 1)

| Name | Lvl | Vocation | Armor | Protection | Weakness | Skill Boost |
|------|-----|----------|------:|------------|----------|-------------|
| Leather Helmet | — | All | 1 | — | — | — |
| Mystic Turban | — | All | 1 | — | — | — |
| Post Officers Hat | — | All | 1 | — | — | — |
| Chain Helmet | — | All | 2 | — | — | — |
| Charmer's Tiara | — | Mage | 2 | — | — | Magic Level +2 |
| Studded Helmet | — | All | 2 | — | — | — |
| Tribal Mask | — | All | 2 | — | — | — |
| Brass Helmet | — | All | 3 | — | — | — |
| Legion Helmet | — | All | 4 | — | — | — |
| Viking Helmet | — | All | 4 | — | — | — |
| Damaged Helmet | — | All | 5 | — | — | — |
| Iron Helmet | — | All | 5 | — | — | — |
| Soldier Helmet | — | All | 5 | — | — | — |
| Dark Helmet | — | All | 6 | Lifedrain -10% | Manadrain +9% | — |
| Dwarven Helmet | — | Knight | 6 | Physical -2% | Energy +1% | — |
| Steel Helmet | — | All | 6 | — | — | — |
| Strange Helmet | — | All | 6 | Manadrain -5% | Lifedrain +4% | — |
| Crown Helmet | — | All | 7 | — | — | — |
| Devil Helmet | — | All | 7 | — | — | — |
| Feather Headdress | — | Paladin | 2 | — | — | Distance +5 **(\*bug)** |
| Wood Cape | — | Paladin | 2 | — | — | Distance +6 **(\*bug)** |
| Hat of the Mad | — | Mage | 3 | — | — | Magic Level +1 |
| Crusader Helmet | — | All | 8 | — | — | — |
| Warrior Helmet | — | All | 8 | — | — | — |
| Helmet of the Ancients | — | All | 8 | — | — | — |
| Helmet of the Ancients (var.) | — | All | 11 | — | — | — |
| Demon Helmet | — | All | 10 | — | — | — |
| Zaoan Helmet | 50 | Knight, Paladin | 8 | Physical -3% | Energy +2% | Speed +5 |
| Glacier Mask | 60 | Mage | 6 | Energy -4% | — | — |
| Magma Monocle | 60 | Mage | 6 | Fire -4% | Physical +3% | — |
| Terra Hood | 60 | Mage | 6 | Physical -4% | Energy +3% | — |
| Batwing Hat | 75 | Mage | 4 | — | — | Magic Level +6 |
| Lightning Headband | 75 | Knight, Paladin | 8 | Energy -5% | Physical +4% | Shielding +1 **(\*bug)** |
| Dragon Scale Helmet | 80 | Knight | 9 | Fire -6% | Physical +5% | Shielding +1 **(\*bug)** |
| Royal Helmet | 85 | Paladin | 9 | — | Physical +9% | Distance +4 **(\*bug)** |
| Maliceforged Helmet | 100 | Mage | 8 | Lifedrain -12% | Manadrain +11% | — |
| Prismatic Helmet | 100 | Knight, Paladin | 9 | Physical/Fire/Energy -6% | Poison +5% | Shielding +1 **(\*bug)** |
| Terra Helmet | 100 | Mage | 7 | Physical -6% | Energy +5% | Magic Level +6 |
| Tiara of Power | 100 | Mage | 7 | — | — | Slightly faster regeneration +3 |
| Yalahari Mask | 100 | All | 7 | Manadrain -10% | Lifedrain +9% | Magic Level +1 |
| Demonfang Mask | 120 | Mage | 6 | Fire -5% | Physical +4% | — |
| Hellstalker Visor | 120 | Knight | 10 | Fire -8% | Physical +7% | — |
| Horseman Helmet | 120 | Paladin | 9 | Physical -2% | — | Distance +6 **(\*bug)** |
| Amazon Helmet | 150 | Paladin | 10 | — | Physical +7% | Distance +6 **(\*bug)** |
| Ceremonial Mask | 150 | Mage | 8 | — | — | Magic Level +6 |
| Cobra Hood | 150 | Knight | 11 | Fire -8% | Physical +7% | Shielding +2 **(\*bug)** |
| Elite Draken Helmet | 150 | Paladin | 10 | — | Physical +7% | Distance +6 **(\*bug)** |
| Galea Mortis | 150 | Mage | 8 | Manadrain -15% | Lifedrain +14% | Magic Level +6 |
| Gill Gugel | 150 | Mage | 8 | Physical -5% | Energy +4% | Magic Level +4 |
| Jade Hat | 150 | Mage | 8 | Poison -6% | Fire +5% | Magic Level +6 |
| Shroud of Despair | 150 | Mage | 8 | Energy -4% | — | Magic Level +6 |
| Skull Helmet | 150 | Mage | 8 | Lifedrain -15% | Manadrain +13% | Magic Level +6 |
| Visage of the End Days | 150 | Knight | 11 | Energy -8% | Poison +7% | Shielding +4 **(\*bug)** |
| Winged Helmet | 150 | Paladin | 10 | — | Physical +5% | Speed +20 |
| Demon Mengu | 200 | Paladin | 8 | Fire -10% | Physical +9% | — |
| Dreadfire Headpiece | 200 | Knight | 11 | Fire -12% | Physical +11% | — |
| Falcon Circlet | 200 | Mage | 9 | Physical/Fire -4% | Energy +3% | Magic Level +6 |
| Falcon Coif | 200 | Knight | 12 | Physical/Fire -6% | Energy +5% | Shielding +4 **(\*bug)** |
| Ferumbras' Hat | 200 | Mage | 1 | — | — | Magic Level +12 |
| Golden Helmet | 200 | Knight | 12 | Physical -4% | Energy +3% | Shielding +4 **(\*bug)** |
| Horned Helmet | 220 | Knight | 13 | Energy -10% | Poison +9% | Shielding +6 **(\*bug)** |
| Lion Spangenhelm | 220 | Knight | 13 | Physical -8% | Energy +7% | Shielding +6 **(\*bug)** |
| Eldritch Hood | 250 | Knight | 14 | Physical -10% | Energy +9% | Shielding +7 **(\*bug)** |
| Alicorn Headguard | 300 | Paladin | 11 | Elemental -5% | Physical +4% | Distance +3 **(\*bug)** |
| Arcanomancer Regalia | 350 | Mage | 10 | Elemental -5% | Physical +4% | Magic Level +8 |
| Spirithorn Helmet | 350 | Knight | 15 | Physical/Fire -10% | Energy +9% | Shielding +8 **(\*bug)** |

---

### 1.2 Necklaces (BodyPosition = 2)

| Name | Lvl | Vocation | Armor | Protection | Weakness | Skill Boost |
|------|-----|----------|------:|------------|----------|-------------|
| Bronze Necklace | — | All | — | — | — | — |
| Crystal Necklace | — | All | — | — | — | Magic Level +1 |
| Bronze Amulet | — | All | — | Manadrain -20% | — | — |
| Dragon Necklace | — | All | — | Fire -10% | — | — |
| Elven Amulet | — | All | — | Elemental -10% | — | — |
| Garlic Necklace | — | All | — | Lifedrain -20% | — | — |
| Platinum Amulet | — | All | 2 | — | — | — |
| Protection Amulet | — | Knight | — | Physical -15% | — | — |
| Scarf | — | All | 1 | — | — | — |
| Silver Amulet | — | All | — | Poison -10% | — | — |
| Silver Necklace | — | All | — | Lifedrain -10% | Manadrain +9% | — |
| Stone Skin Amulet | — | Knight | — | Physical -80% | — | — |
| Strange Talisman | — | All | — | Energy -10% | — | — |
| Star Amulet | 45 | All | — | — | — | Slightly faster regeneration +3 |
| Gill Necklace | 60 | Mage | — | Physical -20% | — | — |
| Glacier Amulet | 60 | Mage | — | Energy -20% | — | — |
| Spider Amulet | 60 | Mage | — | Poison -20% | — | — |
| Lightning Pendant | 75 | Knight, Paladin | — | Energy -15% | Physical +12% | — |
| Ruby Necklace | 80 | All | — | — | — | Magic Level +2 |
| Ancient Amulet | 100 | Mage | — | Poison -10% | Fire +9% | — |
| Demonbone Amulet | 100 | Mage | — | Manadrain -10% | Lifedrain +9% | — |
| Enchanted Diamond Necklace | 100 | Mage | — | — | — | Magic Level +4 |
| Magma Amulet | 100 | Mage | — | Fire -10% | Physical +8% | — |
| Prismatic Necklace | 100 | Knight, Paladin | — | Physical/Fire/Energy -15% | Poison +12% | — |
| Terra Amulet | 100 | Mage | — | Physical -20% | Energy +16% | — |
| Lion Amulet | 150 | Knight | 3 | Physical -5% | Energy +4% | Shielding +3 **(\*bug)** |
| Onyx Pendant | 150 | Knight, Paladin | 3 | Physical -3% | — | Shielding +1 **(\*bug)** |
| Pendulum of Hope | 150 | Mage | — | Energy -5% | Poison +4% | Magic Level +5 |
| The Cobra Amulet | 200 | Knight | 4 | Fire -5% | Physical +4% | Shielding +3 **(\*bug)** |
| Golden Hyaena Necklace | 250 | Mage | — | Physical -5% | Energy +4% | Magic Level +8 |
| Ferumbras' Necklace | 300 | Mage | — | Elemental -5% | Physical +4% | Magic Level +10 |
| The Covenant of Death | 350 | Knight | 5 | Physical/Fire -5% | Energy +4% | Shielding +4 **(\*bug)** |

---

### 1.3 Armors (BodyPosition = 4)

| Name | Lvl | Vocation | Armor | Protection | Weakness | Skill Boost |
|------|-----|----------|------:|------------|----------|-------------|
| Cape | — | All | 1 | — | — | — |
| Coat | — | All | 1 | — | — | — |
| Jacket | — | All | 1 | — | — | — |
| Red Robe | — | All | 1 | — | — | — |
| Doublet | — | All | 2 | — | — | — |
| Studded Armor | — | All | 5 | — | — | — |
| Leather Armor | — | All | 4 | — | — | — |
| Chain Armor | — | All | 6 | — | — | — |
| Green Tunic | — | Paladin | 4 | — | Physical +9% | Distance +2 **(\*bug)** |
| Leaf Robe | — | Mage | 10 | Poison -2% | — | — |
| Magician's Robe | — | Mage | 6 | — | — | Magic Level +2 |
| Magma Robe | — | Mage | 10 | Fire +2% | Physical +1% | — |
| Red Tunic | — | Paladin | 9 | — | Physical +7% | Distance +4 **(\*bug)** |
| Scale Armor | — | All | 9 | — | — | — |
| Sparkling Robe | — | Mage | 10 | Energy +2% | — | — |
| Plate Armor | — | All | 10 | — | — | — |
| Blue Robe | — | All | 11 | — | — | — |
| Kaftan | — | All | 11 | — | — | — |
| Noble Armor | — | All | 11 | — | — | — |
| Decorated Plate Armor | — | All | 10 | — | — | — |
| Light Plate Armor | — | All | 10 | — | — | — |
| Dark Armor | — | All | 10 | Lifedrain -5% | Manadrain +4% | — |
| Dwarven Armor | — | Knight | 10 | Physical -5% | Energy +4% | — |
| Leopard Armor | — | Knight | 13 | Poison -10% | Fire +9% | Shielding +2 **(\*bug)** |
| Ethno Coat | 20 | Mage | 7 | — | — | Magic Level +4 |
| Knight Armor | 40 | Knight | 12 | Physical -5% | Energy +4% | Shielding +2 **(\*bug)** |
| Native Armor | 45 | Knight | 14 | Energy -5% | Poison +4% | Shielding +2 **(\*bug)** |
| Spirit Cloak | 45 | Mage | 8 | — | — | Magic Level +6 |
| Zaoan Armor | 50 | Knight, Paladin | 13 | Physical -5% | Energy +4% | Speed +10 |
| Glacier Robe | 60 | Mage | 10 | Energy -4% | — | — |
| Magma Coat | 60 | Mage | 10 | Fire -4% | Physical +3% | — |
| Terra Mantle | 60 | Mage | 10 | Physical -4% | Energy +3% | — |
| Death Oyoroi | 65 | Mage | 11 | Manadrain -10% | Lifedrain +9% | — |
| Elven Mail | 65 | Paladin | 12 | Physical -2% | — | Distance +6 **(\*bug)** |
| Belted Cape | 75 | Paladin | 14 | Physical -5% | Energy +4% | Distance +1 **(\*bug)** |
| Crown Armor | 75 | Knight, Paladin | 14 | Physical -5% | Energy +4% | Shielding +2 **(\*bug)** |
| Focus Cape | 75 | Mage | 9 | — | — | Magic Level +8 |
| Lightning Robe | 75 | Knight, Paladin | 14 | Energy -10% | Physical +9% | Shielding +2 **(\*bug)** |
| Skullcracker Armor | 75 | Knight, Paladin | 15 | Lifedrain -30% | Manadrain +30% | — |
| Cloak of Deception | 80 | Paladin | 13 | — | Physical +10% | Distance +8 **(\*bug)** |
| Dragon Scale Mail | 80 | Knight | 15 | Fire -15% | Physical +14% | Shielding +4 **(\*bug)** |
| Calopteryx Cape | 85 | Mage | 11 | Fire -4% | — | Magic Level +4 |
| Dark Lord's Cape | 85 | Mage | 11 | Lifedrain -25% | Manadrain +24% | Magic Level +2 |
| Ranger's Cloak | 85 | Paladin | 1 | — | Physical +9% | Distance +14 **(\*bug)** |
| Robe of the Underworld | 85 | Mage | 11 | Manadrain -25% | Lifedrain +23% | Magic Level +2 |
| Velvet Mantle | 85 | Mage | 11 | Energy -4% | — | Magic Level +4 |
| Earthborn Titan Armor | 100 | Knight | 15 | Poison -12% | Fire +11% | Axe +4 |
| Elite Draken Mail | 100 | Paladin | 15 | — | Physical +9% | Distance +10 **(\*bug)** |
| Fireborn Giant Armor | 100 | Knight | 15 | Fire -12% | Physical +11% | Club +4 |
| Golden Armor | 100 | Knight | 15 | Physical -10% | Energy +9% | Shielding +4 **(\*bug)** |
| Magic Plate Armor | 100 | Knight, Paladin | 17 | — | — | — |
| Paladin Armor | 100 | Paladin | 14 | — | Physical +8% | Distance +10 **(\*bug)** |
| Prismatic Armor | 100 | Knight, Paladin | 15 | Physical/Fire/Energy -10% | Poison +9% | Shielding +2 **(\*bug)** |
| Spellweaver's Robe | 100 | Mage | 10 | — | — | Magic Level +10 |
| Warrior Oyoroi | 100 | Knight | 17 | Physical -10% | Energy +9% | Shielding +5 **(\*bug)** |
| Windborn Colossus Armor | 100 | Knight | 15 | Energy -12% | Poison +11% | Club +4 |
| Yalahari Armor | 100 | All | 13 | Manadrain -25% | Lifedrain +24% | Magic Level +1 |
| Demon Armor | 100 | All | 16 | — | — | — |
| Swampland Chestplate | 120 | Knight | 15 | Poison -15% | Fire +13% | Shielding +4 **(\*bug)** |
| Voltage Armor | 120 | Knight | 15 | Energy -15% | Poison +14% | Shielding +4 **(\*bug)** |
| Dauntless Dragon Scale Mail | 150 | Knight | 18 | Fire -10% | Physical +9% | Club +8 |
| Dragon Robe | 150 | Mage | 12 | Fire -6% | Physical +5% | Magic Level +6 |
| Frost Armor | 150 | Knight | 15 | Energy -20% | Poison +19% | — |
| Furious Frock | 150 | Mage | 12 | Energy -6% | Poison +5% | Magic Level +6 |
| Gill Coat | 150 | Mage | 12 | Physical -6% | Energy +5% | Magic Level +6 |
| Greenwood Coat | 150 | Mage | 12 | Poison -6% | Fire +5% | Magic Level +6 |
| Ornate Chestplate | 150 | Knight | 19 | Physical -10% | Energy +9% | Shielding +4 **(\*bug)** |
| Spellbinder's Robe | 150 | Mage | 10 | — | — | Magic Level +12 |
| Arcane Dragon Robe | 200 | Mage | 14 | Fire -8% | Physical +7% | Magic Level +8 |
| Bear Skin | 200 | Mage | 14 | Poison -8% | Fire +7% | Magic Level +8 |
| Divine Armor | 200 | Knight | 22 | Physical/Energy -15% | Fire +14% | Shielding +6 **(\*bug)** |
| Earthheart Cuirass | 200 | Knight | 20 | Poison -20% | Fire +19% | Axe +10 |
| Earthheart Hauberk | 200 | Knight | 20 | Poison -20% | Fire +18% | Axe +10 |
| Earthheart Platemail | 200 | Knight | 20 | Poison -20% | Fire +18% | Club +10 |
| Earthsoul Tabard | 200 | Paladin | 18 | Poison -8% | Physical/Fire +7% | Distance +4 **(\*bug)** |
| Falcon Plate | 200 | Knight | 22 | Physical/Fire -15% | Energy +14% | Shielding +6 **(\*bug)** |
| Fireheart Cuirass | 200 | Knight | 20 | Fire -20% | Physical +18% | Club +10 |
| Fireheart Hauberk | 200 | Knight | 20 | Fire -20% | Physical +19% | Club +10 |
| Fireheart Platemail | 200 | Knight | 20 | Fire -20% | Physical +18% | Club +10 |
| Firesoul Tabard | 200 | Paladin | 18 | Fire -8% | Physical +7% | Distance +4 **(\*bug)** |
| Master Archer's Armor | 200 | Paladin | 8 | — | Physical +5% | Distance +20 **(\*bug)** |
| Pathfinder Chestplate | 200 | Mage | 12 | — | — | Magic Level +14 |
| Robe of the Ice Queen | 200 | Mage | 14 | Energy -8% | Poison +7% | Shielding +8 **(\*bug)** |
| Thunderheart Cuirass | 200 | Knight | 20 | Energy -20% | Poison +19% | Club +10 |
| Thunderheart Hauberk | 200 | Knight | 20 | Energy -20% | Poison +19% | Club +10 |
| Thunderheart Platemail | 200 | Knight | 20 | Energy -20% | Poison +18% | Club +10 |
| Thundersoul Tabard | 200 | Paladin | 18 | Energy -8% | Physical/Poison +7% | Distance +4 **(\*bug)** |
| Lion Chestplate | 220 | Knight | 23 | Physical -20% | Energy +18% | Shielding +8 **(\*bug)** |
| Earthmind Raiment | 250 | Mage | 15 | Poison -8% | Fire +7% | Magic Level +10 |
| Eldritch Cuirass | 250 | Knight | 24 | Physical -20% | Energy +18% | Shielding +8 **(\*bug)** |
| Firemind Raiment | 250 | Mage | 15 | Fire -8% | Physical +7% | Magic Level +10 |
| Shroud of Wisdom | 250 | Mage | 16 | Energy -13% | Poison +11% | — |
| Thundermind Raiment | 250 | Mage | 15 | Energy -8% | Poison +7% | Magic Level +10 |
| Amazon Armor | 300 | Paladin | 16 | — | Physical +5% | Distance +20 **(\*bug)** |
| Crystalline Armor | 300 | Knight | 25 | Energy -25% | Poison +23% | Shielding +10 **(\*bug)** |
| Lavos Armor | 300 | Knight | 25 | Fire -25% | Physical +24% | Shielding +10 **(\*bug)** |
| Dawnfire Sherwani | 350 | Mage | 16 | Fire -13% | Physical +12% | Magic Level +12 |
| Dream Shroud | 350 | Mage | 16 | Energy -13% | Poison +11% | Magic Level +12 |
| Spirithorn Armor | 350 | Knight | 25 | Physical/Fire -25% | Energy +23% | Shielding +10 **(\*bug)** |

---

### 1.4 Legs (BodyPosition = 7)

| Name | Lvl | Vocation | Armor | Protection | Weakness | Skill Boost |
|------|-----|----------|------:|------------|----------|-------------|
| Leather Legs | — | All | 1 | — | — | — |
| Chain Legs | — | All | 3 | — | — | — |
| Studded Legs | — | All | 2 | — | — | — |
| Brass Legs | — | All | 5 | — | — | — |
| Dwarven Legs | — | Knight | 7 | Physical -5% | Energy +4% | — |
| Leaf Legs | — | All | 7 | — | — | — |
| Plate Legs | — | All | 7 | — | — | — |
| Vermin Legs | — | Mage | 7 | Poison -2% | — | — |
| Bast Legs | — | All | 8 | — | — | — |
| Blue Legs | — | All | 8 | — | — | — |
| Crown Legs | — | All | 8 | — | — | — |
| Jungle Legs | — | All | 8 | — | — | — |
| Knight Legs | 40 | Knight | 8 | Physical -5% | — | Shielding +2 **(\*bug)** |
| Zaoan Legs | 50 | Knight, Paladin | 7 | Physical -2% | Energy +1% | Speed +10 |
| Glacier Kilt | 60 | Mage | 7 | Energy -4% | — | — |
| Magma Legs | 60 | Mage | 7 | Fire -4% | Physical +3% | — |
| Terra Legs | 60 | Mage | 7 | Physical -4% | Energy +3% | — |
| Elven Legs | 65 | Paladin | 7 | Physical -2% | — | Distance +2 **(\*bug)** |
| Grasshopper Legs | 75 | All | 6 | — | Physical +8% | Speed +25 |
| Lightning Legs | 75 | Knight, Paladin | 8 | Energy -10% | Physical +9% | Shielding +2 **(\*bug)** |
| Dragon Scale Legs | 80 | Knight | 8 | Fire -12% | Physical +11% | Shielding +2 **(\*bug)** |
| Bone Skirt | 100 | Mage | 8 | Manadrain -6% | Lifedrain +5% | — |
| Demon Legs | 100 | All | 9 | — | — | — |
| Golden Legs | 100 | Knight | 9 | Physical -10% | Energy +9% | Shielding +2 **(\*bug)** |
| Jade Legs | 100 | Mage | 7 | Poison -6% | Fire +5% | Magic Level +2 |
| Prismatic Legs | 100 | Knight, Paladin | 9 | Physical/Fire/Energy -10% | Poison +9% | Shielding +2 **(\*bug)** |
| Yalahari Legpiece | 100 | All | 7 | Manadrain -15% | Lifedrain +14% | Magic Level +1 |
| Gill Legs | 150 | Mage | 7 | Physical -5% | Energy +4% | Magic Level +4 |
| Ornate Legs | 150 | Knight | 10 | Physical -12% | Energy +11% | Shielding +3 **(\*bug)** |
| Pathfinder Fleshguards | 150 | Mage | 8 | Fire -4% | — | — |
| Pathfinder Legs | 150 | Knight | 7 | Energy -18% | Poison +17% | — |
| Pirate Legs | 150 | Mage | 7 | Poison -7% | Fire +6% | Magic Level +4 |
| Soulful Legs | 150 | Knight | 10 | Energy -15% | Poison +14% | Shielding +3 **(\*bug)** |
| Cast Iron Legs | 200 | Knight | 11 | Physical -15% | Energy +13% | Shielding +4 **(\*bug)** |
| Falcon Greaves | 200 | Knight | 11 | Physical/Fire -10% | Energy +9% | Shielding +4 **(\*bug)** |
| Eldritch Breeches | 250 | Knight | 12 | Physical -15% | Energy +14% | Shielding +6 **(\*bug)** |

---

### 1.5 Boots (BodyPosition = 8)

| Name | Lvl | Vocation | Armor | Protection | Weakness | Skill Boost |
|------|-----|----------|------:|------------|----------|-------------|
| Sandals | — | All | — | — | — | — |
| Leather Boots | — | All | 1 | — | — | — |
| Patched Boots | — | All | 2 | — | — | — |
| Desert Footwraps | — | All | 1 | Poison +2% | — | — |
| Coconut Shoes | — | All | 1 | — | Physical +10% | Speed +10 |
| Crocodile Boots | — | All | 1 | — | Physical +8% | Speed +10 |
| Soft Boots | — | All | — | — | — | Slightly faster regeneration +1 |
| Firewalker Boots | — | All | — | Fire -20% | Physical +19% | — |
| Badger Boots | 40 | All | 2 | — | Physical +6% | Speed +15 |
| Desert Sandals | 40 | All | 1 | Poison -4% | — | — |
| Zaoan Shoes | 50 | Knight, Paladin | 1 | Physical -2% | Energy +1% | Speed +5 |
| Glacier Shoes | 60 | Mage | 2 | Energy -2% | — | — |
| Magma Boots | 60 | Mage | 2 | Fire -2% | Physical +1% | — |
| Terra Boots | 60 | Mage | 2 | Physical -2% | Energy +1% | — |
| Steel Boots | 65 | Knight | 3 | — | — | — |
| Boots of Haste | 75 | All | — | — | Physical +7% | Speed +20 |
| Lightning Boots | 75 | Knight, Paladin | 2 | Energy -5% | Physical +4% | — |
| Desert Boots | 80 | Knight | 2 | Poison -6% | Fire +5% | — |
| Dragon Scale Boots | 80 | Knight | 3 | Fire -5% | Physical +4% | Shielding +1 **(\*bug)** |
| Enchanted Sandals | 80 | Mage | 2 | Energy -4% | — | — |
| Yalahari Boots | 80 | All | 1 | Manadrain -4% | Lifedrain +3% | — |
| Bone Boots | 100 | Mage | 2 | Manadrain -6% | Lifedrain +5% | — |
| Guardian Boots | 100 | Knight, Paladin | 3 | Energy -5% | Poison +4% | Shielding +1 **(\*bug)** |
| Makeshift Boots | 100 | Mage | 2 | Fire -4% | — | Magic Level +4 |
| Oriental Shoes | 100 | Mage | 2 | Poison -4% | — | Magic Level +4 |
| Pair of Nightmare Boots | 100 | Mage | 2 | Energy -4% | — | Magic Level +4 |
| Prismatic Boots | 100 | Knight, Paladin | 3 | Physical/Fire/Energy -5% | Poison +4% | Shielding +1 **(\*bug)** |
| Vampire Silk Slippers | 100 | All | — | — | Physical +7% | Speed +25 |
| Winged Boots | 100 | Paladin | 2 | — | Physical +6% | Speed +20 |
| Alchemist's Boots | 150 | Mage | 2 | Physical -4% | — | Magic Level +4 |
| Cobra Boots | 150 | Knight | 4 | Fire -5% | Physical +4% | Shielding +2 **(\*bug)** |
| Draken Boots | 150 | Paladin | 3 | — | Physical +8% | Speed +20 |
| Golden Boots | 150 | Knight | 4 | Physical -5% | Energy +4% | Shielding +2 **(\*bug)** |
| Heavy Swampland Boots | 150 | Knight | 4 | Poison -10% | Fire +9% | — |
| Void Boots | 150 | Knight | 4 | Energy -15% | Poison +14% | Shielding +2 **(\*bug)** |
| Cast Iron Boots | 200 | Knight | 5 | Physical -10% | Energy +9% | Shielding +4 **(\*bug)** |
| Pathfinder Stompers | 200 | Mage | 2 | Fire -6% | Physical +5% | — |
| Frostflower Boots | 250 | Knight | 5 | Physical/Energy -8% | Fire +7% | Shielding +4 **(\*bug)** |
| Pair of Dreamwalkers | 250 | Mage | 2 | — | — | Magic Level +8 |
| Pair of Soulwalkers | 250 | Knight | 5 | Physical/Fire/Energy -8% | Energy +7% | Shielding +4 **(\*bug)** |
| Treader of Torment | 300 | Knight | 6 | Physical -10% | Energy +9% | Shielding +4 **(\*bug)** |

---

### 1.6 Rings (BodyPosition = 9)

| Name | Lvl | Vocation | Armor | Protection | Weakness | Skill Boost |
|------|-----|----------|------:|------------|----------|-------------|
| Axe Ring | — | All | — | — | — | Axe +8 |
| Club Ring | — | All | — | — | — | Club +8 |
| Sword Ring | — | All | — | — | — | Sword +8 |
| Crystal Ring | — | All | — | — | — | Magic Level +1 |
| Magic Ring | — | Mage | — | — | — | Magic Level +10 |
| Might Ring | — | All | — | Elemental -25% | — | — |
| Time Ring | — | All | — | — | Physical +6% | Speed +30 |
| Life Ring | — | All | — | — | — | Slightly faster regeneration +1 |
| Ring of Healing | — | All | — | — | — | Slightly faster regeneration +1 |
| Energy Ring | — | All | — | — | — | Mana shield +1 |
| Dwarven Ring | — | All | — | — | — | Protection vs drunkenness +1 |
| Stealth Ring | — | All | — | — | — | Invisibility +1 |
| Star Ring | 45 | All | — | — | — | Slightly faster regeneration +3 |
| Elven Brooch | 45 | Paladin | — | — | Physical +5% | Distance +5 **(\*bug)** |
| Butterfly Ring | 85 | All | — | Energy -4% | — | — |
| Ring of Fire | 85 | All | — | Fire -99% | Physical +99% | — |
| Prismatic Ring | 100 | Knight, Paladin | — | Physical/Fire/Energy -10% | Poison +9% | Shielding +10 **(\*bug)** |
| Ring of the Sky | 100 | Mage | — | — | — | Magic Level +8 |
| Vampire's Signet Ring | 100 | Mage | — | Lifedrain -15% | Manadrain +13% | — |
| Gold Ring | 150 | All | — | — | — | Magic Level +2 |
| The Ring of the Igniter | 150 | Knight | — | — | — | Sword +10 |
| Ring of Secret Thoughts | 200 | Mage | — | Energy -10% | Poison +9% | Magic Level +10 |
| Skull Ring | 200 | Mage | — | Physical/Fire -10% | Energy +9% | Magic Level +10 |
| Lion Ring | 220 | Knight | — | Physical -5% | Energy +4% | Shielding +2 **(\*bug)** |
| Alicorn Ring | 350 | Paladin | — | Elemental -4% | — | Distance +4 **(\*bug)** |
| Arcanomancer Sigill | 350 | Mage | — | Elemental -4% | — | Magic Level +6 |
| Spirithorn Ring | 350 | Knight | 2 | Physical/Fire -5% | Energy +4% | Shielding +4 **(\*bug)** |

---

## 2. Best-in-Slot Summary

### 2.1 Maximum Armor Per Slot (at level 350)

| Slot | Knight | Paladin | Mage |
|------|--------|---------|------|
| Helmet | Spirithorn Helmet **15** | Alicorn Headguard **11** | Arcanomancer Regalia **10** |
| Necklace | The Covenant of Death **5** | — **0** | — **0** |
| Armor | Spirithorn Armor **25** | Amazon Armor **16** | Dawnfire Sherwani / Dream Shroud **16** |
| Legs | Eldritch Breeches **12** | Elven Legs **7** (lvl 65!) | Pathfinder Fleshguards **8** |
| Boots | Treader of Torment **6** | Draken Boots **3** | Pair of Dreamwalkers **2** |
| Ring | Spirithorn Ring **2** | — **0** | — **0** |
| **Total** | **65** | **37** | **36** |

> **Note:** Paladin and Mage legs above are far below the highest available level — the best leveled items are from 65 and 150 respectively, compared to 250 for Knight.

### 2.2 Maximum Skill Boost Per Vocation (Best-in-Slot stacking)

| Vocation | Skill | Helm | Armor | Legs | Boots | Neck | Ring | **Total** |
|----------|-------|------|-------|------|-------|------|------|-----------|
| Knight | Shielding **(\*bug)** | +8 (Spirithorn) | +10 (Spirithorn) | +6 (Eldritch) | +4 (Treader) | +4 (Covenant) | +4 (Spirithorn Ring) | **+36** |
| Knight | Sword | — | — | — | — | — | +10 (Ring of Igniter) | **+10** |
| Knight | Club | — | +10 (Earthheart/Fireheart/Thunder) | — | — | — | — | **+10** |
| Knight | Axe | — | +10 (Earthheart) | — | — | — | — | **+10** |
| Paladin | Distance **(\*bug)** | +3 (Alicorn HG) | +20 (Amazon Armor) | — | — | — | +4 (Alicorn Ring) | **+27** |
| Paladin | Speed | +20 (Winged) | +10 (Zaoan) | +25 (Grasshopper) | +20 (Draken) | — | — | **+75** |
| Mage | Magic Level | +12 (Ferumbras') | +12 (Spellbinder/Dawnfire/Dream) | +4 (Gill/Pirate) | +8 (Dreamwalkers) | +10 (Ferumbras' Neck) | +10 (Ring of Secret/Skull) | **+56** |

> **Paladin Speed note:** Ferumbras' Hat (lvl 200) gives ML+12 vs Arcanomancer Regalia (lvl 350) at ML+8 — the lower-level item wins on the skill boost, trading armor (1 vs 10). The total of **+56** uses Ferumbras' Hat; using Arcanomancer Regalia gives **+52**.

> **Mage ML note:** Ring of Secret Thoughts and Skull Ring are both Mage, level 200, and both give ML+10. Arcanomancer Sigill (level 350) only gives ML+6, making it strictly worse for stacking.

### 2.3 Maximum Protection Per Vocation (single element, best-in-slot)

| Element | Knight | Paladin | Mage |
|---------|--------|---------|------|
| Physical | ~47% (helm+armor+legs+boots+neck+ring) | ~9% (Alicorn HG) | ~9% (Arcanomancer + Neck) |
| Fire | ~40% (Lavos set) | — | — |
| Energy | ~45% (Crystalline set) | ~4% (Alicorn HG elemental) | — |
| Poison | ~40% (Earthheart set) | ~4% (Alicorn HG elemental) | ~8% (various) |
| Lifedrain | — | — | ~35% (Skull Helmet + Galea Mortis stack) |
| Elemental (Phys/Poison/Fire/Energy) | ~15% | ~9% (Alicorn HG+Ring combined) | ~9% (Arcanomancer Regalia + Sigill) |

---

## 3. Level-Gated Progression Per Vocation

### 3.1 Tier Comparison Table

| Level Tier | Knight | Paladin | Mage |
|------------|--------|---------|------|
| 0 (starter) | ✗ (generic gear only) | ✓ Feather Headdress, Green Tunic, Red Tunic | ✓ Hat of Mad, Magician's Robe, Charmer's Tiara |
| 20 | ✗ | ✗ | ✓ Ethno Coat (ML+4) |
| 40 | ✓ Knight Armor, Knight Legs, Knight Legs | ✗ | ✗ |
| 45 | ✓ Native Armor | ✓ Spirit Cloak (+ML6), Star Amulet, Elven Brooch | ✓ Spirit Cloak, Star Amulet |
| 50 | ✓ Zaoan set (Speed+10) | ✓ Zaoan set (Speed+10) | ✗ |
| 60 | ✗ | ✗ | ✓ Glacier/Magma/Terra sets, Gill/Glacier/Spider Amulets |
| 65 | ✗ | ✓ Elven Mail (Dist+6), Elven Legs (Dist+2) | ✓ Death Oyoroi |
| 75 | ✓ Crown/Lightning Armor, Skullcracker | ✓ Belted Cape (Dist+1), Grasshopper Legs | ✓ Focus Cape (ML+8), Batwing Hat (ML+6) |
| 80 | ✓ Dragon Scale Mail (Shield+4), Helmet | ✓ Cloak of Deception (Dist+8) | ✓ Enchanted Sandals, Calopteryx/Velvet Mantles |
| 85 | ✗ | ✓ Ranger's Cloak (Dist+14), Royal Helmet (Dist+4) | ✓ Dark Lord's Cape (ML+2), Robe of Underworld |
| 100 | ✓ Golden/Warrior Oyoroi/Titan Armors | ✓ Paladin Armor (Dist+10), Elite Draken Mail | ✓ Spellweaver's Robe (ML+10), Jade Legs |
| 120 | ✓ Swampland, Voltage Armors | ✓ Horseman Helmet (Dist+6) | ✓ Demonfang Mask |
| 150 | ✓ Ornate/Dauntless/Cobra set | ✓ Amazon Helmet, Winged Helmet (Spd+20) | ✓ Spellbinder's Robe (ML+12), Galea Mortis, various |
| 200 | ✓ Falcon Plate, Divine, Earthheart/Fireheart/Thunder | ✓ Earthsoul/Firesoul/Thundersoul Tabards, Master Archer's | ✓ Pathfinder (ML+14), Arcane Dragon, Bear Skin |
| 220 | ✓ Lion set (helm+armor+ring) | ✗ | ✗ |
| 250 | ✓ Eldritch set (helm+armor+legs) | ✗ | ✓ Earthmind/Firemind/Thundermind Raiments |
| 300 | ✓ Crystalline/Lavos Armor | ✓ Alicorn Headguard, Amazon Armor | ✓ Ferumbras' Necklace (ML+10) |
| 350 | ✓ Spirithorn set (full) | ✓ Alicorn Ring | ✓ Arcanomancer Regalia, Dawnfire Sherwani, Dream Shroud |

### 3.2 Skill-Boosting Gear Progression

| Level | Knight (Shielding\*) | Paladin (Distance\*) | Mage (Magic Level) |
|-------|---------------------|---------------------|--------------------|
| 0 | — | Feather Headdress +5, Wood Cape +6 | Magician's Robe +2, Charmer's Tiara +2, Hat of Mad +1 |
| 20 | — | — | Ethno Coat +4 |
| 40 | Knight Armor +2, Knight Legs +2 | — | — |
| 45 | Native Armor +2 | — | Spirit Cloak +6 |
| 65 | — | Elven Mail +6, Elven Legs +2 | — |
| 75 | Crown/Lightning Armor +2 | Belted Cape +1 | Focus Cape +8, Batwing Hat +6 |
| 80 | Dragon Scale Mail +4, Helm +1 | Cloak of Deception +8 | — |
| 85 | — | Ranger's Cloak +14, Royal Helmet +4 | Velvet/Calopteryx +4 |
| 100 | Golden Armor +4, Warrior Oyoroi +5 | Paladin/Elite Draken Armor +10 | Spellweaver's Robe +10 |
| 120 | Swampland/Voltage +4 | Horseman Helmet +6 | — |
| 150 | Ornate Chestplate +4, Cobra Hood +2 | — (**gap**) | Spellbinder's Robe +12, ML+6 helms |
| 200 | Falcon Plate/Divine +6 | Earthsoul/Firesoul/Thundersoul +4 | Pathfinder Chestplate +14 |
| 220 | Lion set +8 (armor), +6 (helm) | — (**gap**) | — |
| 250 | Eldritch Cuirass +8, Hood +7, Breeches +6 | — (**gap**) | Earthmind/Firemind/Thundermind +10 |
| 300 | — | — (**gap**) | Ferumbras' Necklace +10 |
| 350 | Spirithorn set +10/+8/+6 | Alicorn Headguard +3, Amazon Armor +20, Alicorn Ring +4 | Dawnfire/Dream Shroud +12, Arcanomancer +8, Sigill +6 |

> **\*** Items marked **(\*bug)** had their Shielding/Distance skill boost previously hidden due to a missing `case_when` branch in `equipment.qmd` — now fixed.

---

## 4. Balance Verdict

### 4.1 Armor Totals by Vocation (BIS at level 350)

| Slot | Knight | Paladin | Mage |
|------|-------:|--------:|-----:|
| Helmet | 15 | 11 | 10 |
| Necklace | 5 | 0 | 0 |
| Armor | 25 | 16 | 16 |
| Legs | 12 | 7\* | 8† |
| Boots | 6 | 3 | 2 |
| Ring | 2 | 0 | 0 |
| **Total** | **65** | **37** | **36** |

\* Paladin's best legs are Elven Legs (level 65) — there is no Paladin leg slot upgrade past level 65 for any meaningful stat.
† Mage's best legs with skill boost are Gill/Pirate Legs (level 150).

Knights have **75% more total armor** than Paladins and Mages at endgame. This is expected by design (tank vs. ranged/caster), but the gap in legs progression is a notable issue — Paladin has nothing at 200, 250, 300, or 350 level tiers.

### 4.2 Max Skill Boost by Vocation

| Vocation | Primary Skill | Boost |
|----------|--------------|-------|
| Knight | Shielding | +36 |
| Knight | Sword / Club / Axe | +10 each |
| Paladin | Distance | +27 |
| Paladin | Speed | +75 |
| Mage | Magic Level | +56 |

### 4.3 Key Findings

#### ✅ Fixed: Shielding and Distance skills not decoded

The `skill` field in `equipment.qmd` used a `case_when` with branches for skills 1, 4, 8, 9, 10 only. Skills 6 (Shielding) and 7 (Distance) fell through to the `TRUE ~ ""` default and displayed blank.

**Impact (before fix):**
- **36 Shielding** from equipment was completely invisible to Knight players browsing the equipment library
- **27 Distance** from equipment was invisible to Paladin players
- This affected the primary skill boost for two out of three vocations

**Affected items:** Spirithorn Helmet, Spirithorn Armor, Eldritch Breeches, Treader of Torment, The Covenant of Death, Spirithorn Ring (Knight); Alicorn Headguard, Amazon Armor, Alicorn Ring (Paladin); and ~30 additional items.

**Fix applied:** Added `skill_number == 6` and `skill_number == 7` branches to the `case_when` block in `equipment.qmd`.

#### ✅ Fixed: Additional undecoded skill numbers

Skills 14, 16, 20, and 21 also returned blank. Skill 2 on Ruby Necklace was a data error (typo for 1). All have been resolved:

| Skill | Meaning | Fix |
|-------|---------|-----|
| 14 | Slightly faster regeneration | Added to `case_when` in `equipment.qmd` |
| 16 | Invisibility | Added to `case_when` in `equipment.qmd` |
| 20 | Protection vs drunkenness | Added to `case_when` in `equipment.qmd` |
| 21 | Mana shield | Added to `case_when` in `equipment.qmd` |
| 2 (Ruby Necklace) | Typo — should be 1 (Magic Level) | `SkillNumber` corrected to 1 in `objects.srv` + DB |

#### Imbalance: Missing endgame legs for Paladin

Paladins have no leg slot upgrade past level 65 (Elven Legs, armor 7). The best available legs by vocation at each high-level tier:

| Level | Knight Legs | Paladin Legs | Mage Legs |
|-------|------------|--------------|-----------|
| 150 | Ornate Legs (10), Soulful Legs (10) | **nothing new** | Gill/Pirate Legs (7) |
| 200 | Cast Iron / Falcon Greaves (11) | **nothing new** | **nothing new** |
| 250 | Eldritch Breeches (12) | **nothing new** | **nothing new** |
| 300 | **nothing new** | **nothing new** | **nothing new** |
| 350 | — (no new legs) | **nothing new** | **nothing new** |

Paladins go from Elven Legs at level 65 to wearing Grasshopper Legs (all-vocation, level 75) for Speed build, or Prismatic Legs (level 100, Knight+Paladin shared) for protection. There is no dedicated Paladin leg upgrade from level 100 onward.

**Recommendation:** Add a Paladin-specific legs item at level 150–200 and 300–350 tiers to match the progression cadence of Knights and provide Distance skill boost (currently 0 from leg slot for Paladins at endgame).

#### Imbalance: Missing endgame legs for Mage

Mages have no leg slot upgrade past level 150 (Gill/Pirate Legs, armor 7, ML+4). Pathfinder Fleshguards (level 150, armor 8) offer no skill boost. No Mage legs exist at the 200, 250, 300, or 350 level tiers.

**Recommendation:** Add a Mage-specific legs item at level 200 and 350 with meaningful ML boost to complete the endgame set.

#### Imbalance: Speed items are unrestricted (design concern)

The following Speed-boosting items have **no profession restriction**:

| Item | Lvl | Speed Boost | Weakness |
|------|-----|------------|---------|
| Coconut Shoes | — | +10 | Physical +10% |
| Crocodile Boots | — | +10 | Physical +8% |
| Badger Boots | 40 | +15 | Physical +6% |
| Boots of Haste | 75 | +20 | Physical +7% |
| Grasshopper Legs | 75 | +25 | Physical +8% |
| Vampire Silk Slippers | 100 | +25 | Physical +7% |
| Time Ring | — | +30 | Physical +6% |

Knights can stack Speed from these unrestricted items alongside their dedicated armor sets. A Knight in Spirithorn armor can simultaneously equip Grasshopper Legs (+25 speed) and Vampire Silk Slippers (+25 speed) for +50 Speed, which likely outclasses Paladins in burst-movement scenarios.

If Speed is intended as a Paladin-distinctive stat, most of these items — especially Boots of Haste, Grasshopper Legs, and Vampire Silk Slippers — should be restricted to Paladin or be universal as a deliberate design choice.

#### Imbalance: Level 220 tier is Knight-only

The Lion set (Lion Spangenhelm, Lion Chestplate, Lion Amulet, Lion Ring) exists exclusively at level 220 and is restricted to Knights. No equivalent 220-tier items exist for Paladin or Mage. Players of those vocations jump directly from 200 to 250+ for endgame gear.

**Recommendation:** Either add level 220 items for Paladin and Mage, or move Lion set items to nearby tiers (200 or 250) where they fit existing progressions.

#### Imbalance: Level 250 tier is Knight and Mage only

The Eldritch set (250, Knight) and Earthmind/Firemind/Thundermind Raiments (250, Mage) exist. Paladins have nothing at level 250.

**Recommendation:** Add a Paladin item set at level 250, ideally with Distance skill boost to address the persistent Distance visibility and progression gap.

#### Note: No Sorcerer-only or Druid-only items

All Mage items use `Professions = 24` (Sorcerer+Druid). There is no gear that rewards specializing as one or the other. This is a design choice — the codebase supports individual prof=8 (Sorcerer) or prof=16 (Druid) items but none exist. This may be intentional for simplicity but limits build differentiation.

#### Offensive build note: Glass cannon tradeoffs

Several high-skill-boost items accept large weaknesses in exchange for no protection:

| Item | Armor | Skill | Weakness |
|------|------:|-------|---------|
| Master Archer's Armor (200, Pal) | 8 | Distance +20 | Physical +5% |
| Amazon Armor (300, Pal) | 16 | Distance +20 | Physical +5% |
| Ranger's Cloak (85, Pal) | 1 | Distance +14 | Physical +9% |
| Cloak of Deception (80, Pal) | 13 | Distance +8 | Physical +10% |
| Ring of Fire (85, All) | — | — | Physical +99%, Fire -99% |

Paladin's offensive build path (stacking Distance through Ranger's Cloak + Amazon Armor + Alicorn Ring) provides substantial skill boost but near-zero armor at endgame. Ring of Fire in particular is a single-purpose situational item with extreme tradeoff. These are workable design choices but should be verified in gameplay testing.

### 4.4 Summary of Recommendations

| Priority | Issue | Action |
|----------|-------|--------|
| ~~**HIGH**~~ ✅ | Shielding (skill 6) not decoded in UI | Fixed in `equipment.qmd` |
| ~~**HIGH**~~ ✅ | Distance (skill 7) not decoded in UI | Fixed in `equipment.qmd` |
| ~~**HIGH**~~ ✅ | `ProtectionDamageTypes=271` includes Lifedrain erroneously | Fixed to 15 in `objects.srv` + DB (8 items) |
| ~~**HIGH**~~ ✅ | `ProtectionDamageTypes=17` on Knight Legs (spurious bit 16) | Fixed to 1 in `objects.srv` + DB |
| **MEDIUM** | No Paladin legs past level 65 | Add Paladin legs at ~150, ~250, and ~350 |
| **MEDIUM** | No Mage legs past level 150 | Add Mage legs at ~250 and ~350 |
| **MEDIUM** | Level 220 gap for Paladin and Mage | Add tier items or rebalance Lion set placement |
| **MEDIUM** | Level 250 gap for Paladin | Add Paladin endgame set at level 250 |
| **LOW** | Speed boots have no profession restriction | Decide if speed is Paladin-exclusive stat |
| ~~**LOW**~~ ✅ | Skill 14, 16, 20, 21 not decoded in UI | Fixed in `equipment.qmd`; Ruby Necklace skill 2 corrected to 1 in data |
| **LOW** | No Sorcerer/Druid split items | Design consideration only |
