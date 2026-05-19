# Equipment Balance Changes Plan

**Date:** 2026-02-17
**Status:** PENDING REVIEW

## Overview

This document proposes 12 item modifications to address balance gaps identified in `docs/equipment-balance.md`. All changes affect items with TypeID 5000+ only (newer items), preserving nostalgic older items.

## Design Principles (Vocation Identity)

| Vocation | Primary Stats | Secondary | Trade-offs |
|----------|---------------|-----------|------------|
| **Knight** | Highest armor, elemental protection | Shielding, melee weapon skills | Lower speed, no ML |
| **Paladin** | Highest speed, distance skill | Moderate armor | Speed items must have physical weakness |
| **Mage** | Highest magic level, regeneration | — | Lowest armor, protection, speed |

All changes below respect these identity boundaries.

---

## Key Balance Issues Addressed

### 1. Paladin Legs Gap (CRITICAL)
- **Problem:** Best Paladin-specific legs are Elven Legs (lvl 65). No Paladin legs from level 65 to 350!
- **Solution:** Convert Pathfinder Legs (lvl 150) and Cast Iron Legs (lvl 200) to Paladin

### 2. Mage Legs Gap (HIGH)
- **Problem:** Best Mage legs are Gill/Pirate Legs (lvl 150, ML +4). No Mage legs at 200+
- **Solution:** Add ML boost to Pathfinder Fleshguards (lvl 150), convert Soulful Legs to Mage lvl 200

### 3. Speed Items Unrestricted (MEDIUM)
- **Problem:** High-speed items like Grasshopper Legs, Vampire Silk Slippers available to all vocations
- **Solution:** Restrict to Paladin-only (Speed is Paladin's signature stat)

### 4. Missing Skill Boosts (LOW)
- **Problem:** Several high-level items lack skill boosts
- **Solution:** Add Distance/ML boosts to Demon Mengu, Pathfinder Stompers, Shroud Of Wisdom

---

## Proposed Changes

### Change 1: Pathfinder Legs (5501) - Convert to Paladin

**Current:**
```
TypeID      = 5501
Name        = "pathfinder legs"
Flags       = {Armor,Clothes,Protection,RestrictLevel,RestrictProfession,Take,Weakness}
Attributes  = {MinimumLevel=150,Professions=2,Weight=3840,BodyPosition=7,ArmorValue=7,ProtectionDamageTypes=8,DamageReduction=18,WeaknessDamageTypes=2,DamageIncrease=17}
```

**Proposed:**
```
TypeID      = 5501
Name        = "pathfinder legs"
Flags       = {Armor,Clothes,Protection,RestrictLevel,RestrictProfession,SkillBoost,Take,Weakness}
Attributes  = {MinimumLevel=150,Professions=4,Weight=3840,BodyPosition=7,ArmorValue=8,SkillNumber=7,SkillModification=4,ProtectionDamageTypes=8,DamageReduction=10,WeaknessDamageTypes=2,DamageIncrease=9}
```

**Changes:** Knight→Paladin, add Distance +4, adjust protection/weakness

---

### Change 2: Pathfinder Fleshguards (5500) - Add ML boost

**Current:**
```
TypeID      = 5500
Name        = "pathfinder fleshguards"
Flags       = {Armor,Clothes,Protection,RestrictLevel,RestrictProfession,Take}
Attributes  = {MinimumLevel=150,Professions=24,Weight=4280,BodyPosition=7,ArmorValue=8,ProtectionDamageTypes=4,DamageReduction=4}
```

**Proposed:**
```
TypeID      = 5500
Name        = "pathfinder fleshguards"
Flags       = {Armor,Clothes,Protection,RestrictLevel,RestrictProfession,SkillBoost,Take}
Attributes  = {MinimumLevel=150,Professions=24,Weight=4280,BodyPosition=7,ArmorValue=8,SkillNumber=1,SkillModification=6,ProtectionDamageTypes=4,DamageReduction=4}
```

**Changes:** Add Magic Level +6

---

### Change 3: Demon Mengu (5541) - Add Distance boost

**Current:**
```
TypeID      = 5541
Name        = "a demon mengu"
Flags       = {Armor,Clothes,Protection,RestrictLevel,RestrictProfession,Take,Weakness}
Attributes  = {MinimumLevel=200,Professions=4,Weight=3980,BodyPosition=1,ArmorValue=8,ProtectionDamageTypes=4,DamageReduction=10,WeaknessDamageTypes=1,DamageIncrease=9}
```

**Proposed:**
```
TypeID      = 5541
Name        = "a demon mengu"
Flags       = {Armor,Clothes,Protection,RestrictLevel,RestrictProfession,SkillBoost,Take,Weakness}
Attributes  = {MinimumLevel=200,Professions=4,Weight=3980,BodyPosition=1,ArmorValue=8,SkillNumber=7,SkillModification=5,ProtectionDamageTypes=4,DamageReduction=10,WeaknessDamageTypes=1,DamageIncrease=9}
```

**Changes:** Add Distance +5

---

### Change 4: Pathfinder Stompers (5496) - Add ML boost

**Current:**
```
TypeID      = 5496
Name        = "pathfinder stompers"
Flags       = {Armor,Clothes,Protection,RestrictLevel,RestrictProfession,Take,Weakness}
Attributes  = {MinimumLevel=200,Professions=24,Weight=3100,BodyPosition=8,ArmorValue=2,ProtectionDamageTypes=4,DamageReduction=6,WeaknessDamageTypes=1,DamageIncrease=5}
```

**Proposed:**
```
TypeID      = 5496
Name        = "pathfinder stompers"
Flags       = {Armor,Clothes,Protection,RestrictLevel,RestrictProfession,SkillBoost,Take,Weakness}
Attributes  = {MinimumLevel=200,Professions=24,Weight=3100,BodyPosition=8,ArmorValue=2,SkillNumber=1,SkillModification=6,ProtectionDamageTypes=4,DamageReduction=6,WeaknessDamageTypes=1,DamageIncrease=5}
```

**Changes:** Add Magic Level +6

---

### Change 5: Shroud Of Wisdom (5505) - Add ML boost

**Current:**
```
TypeID      = 5505
Name        = "a shroud of wisdom"
Flags       = {Armor,Clothes,Protection,RestrictLevel,RestrictProfession,Take,Weakness}
Attributes  = {MinimumLevel=250,Professions=24,Weight=5500,BodyPosition=4,ArmorValue=16,ProtectionDamageTypes=8,DamageReduction=13,WeaknessDamageTypes=2,DamageIncrease=11}
```

**Proposed:**
```
TypeID      = 5505
Name        = "a shroud of wisdom"
Flags       = {Armor,Clothes,Protection,RestrictLevel,RestrictProfession,SkillBoost,Take,Weakness}
Attributes  = {MinimumLevel=250,Professions=24,Weight=5500,BodyPosition=4,ArmorValue=16,SkillNumber=1,SkillModification=8,ProtectionDamageTypes=8,DamageReduction=13,WeaknessDamageTypes=2,DamageIncrease=11}
```

**Changes:** Add Magic Level +8

---

### Change 6: Grasshopper Legs (5213) - Restrict to Paladin

**Current:**
```
TypeID      = 5213
Name        = "grasshopper legs"
Flags       = {Armor,Clothes,Protection,RestrictLevel,SkillBoost,Take,Weakness}
Attributes  = {MinimumLevel=75,Weight=3200,BodyPosition=7,ArmorValue=6,SkillNumber=4,SkillModification=25,ProtectionDamageTypes=0,DamageReduction=0,WeaknessDamageTypes=1,DamageIncrease=8}
```

**Proposed:**
```
TypeID      = 5213
Name        = "grasshopper legs"
Flags       = {Armor,Clothes,Protection,RestrictLevel,RestrictProfession,SkillBoost,Take,Weakness}
Attributes  = {MinimumLevel=75,Professions=4,Weight=3200,BodyPosition=7,ArmorValue=6,SkillNumber=4,SkillModification=25,ProtectionDamageTypes=0,DamageReduction=0,WeaknessDamageTypes=1,DamageIncrease=8}
```

**Changes:** Add RestrictProfession flag, Professions=4 (Paladin only)

---

### Change 7: Badger Boots (5220) - Restrict to Paladin

**Current:**
```
TypeID      = 5220
Name        = "badger boots"
Flags       = {Armor,Clothes,Protection,RestrictLevel,SkillBoost,Take,Weakness}
Attributes  = {MinimumLevel=40,Weight=1100,BodyPosition=8,ArmorValue=2,SkillNumber=4,SkillModification=15,ProtectionDamageTypes=0,DamageReduction=0,WeaknessDamageTypes=1,DamageIncrease=6}
```

**Proposed:**
```
TypeID      = 5220
Name        = "badger boots"
Flags       = {Armor,Clothes,Protection,RestrictLevel,RestrictProfession,SkillBoost,Take,Weakness}
Attributes  = {MinimumLevel=40,Professions=4,Weight=1100,BodyPosition=8,ArmorValue=2,SkillNumber=4,SkillModification=15,ProtectionDamageTypes=0,DamageReduction=0,WeaknessDamageTypes=1,DamageIncrease=6}
```

**Changes:** Add RestrictProfession flag, Professions=4 (Paladin only)

---

### Change 8: Vampire Silk Slippers (5226) - Restrict to Paladin

**Current:**
```
TypeID      = 5226
Name        = "vampire silk slippers"
Flags       = {Clothes,Protection,RestrictLevel,SkillBoost,Take,Weakness}
Attributes  = {MinimumLevel=100,Weight=1150,BodyPosition=8,SkillNumber=4,SkillModification=25,ProtectionDamageTypes=0,DamageReduction=0,WeaknessDamageTypes=1,DamageIncrease=7}
```

**Proposed:**
```
TypeID      = 5226
Name        = "vampire silk slippers"
Flags       = {Clothes,Protection,RestrictLevel,RestrictProfession,SkillBoost,Take,Weakness}
Attributes  = {MinimumLevel=100,Professions=4,Weight=1150,BodyPosition=8,SkillNumber=4,SkillModification=25,ProtectionDamageTypes=0,DamageReduction=0,WeaknessDamageTypes=1,DamageIncrease=7}
```

**Changes:** Add RestrictProfession flag, Professions=4 (Paladin only)

---

### Change 9: Coconut Shoes (5535) - Restrict to Paladin + Fix typo

**Current:**
```
TypeID      = 5535
Name        = "cocnut shoes"
Flags       = {Clothes,Protection,SkillBoost,Take,Weakness}
Attributes  = {Weight=750,BodyPosition=8,ArmorValue=1,SkillNumber=4,SkillModification=10,ProtectionDamageTypes=0,DamageReduction=0,WeaknessDamageTypes=1,DamageIncrease=10}
```

**Proposed:**
```
TypeID      = 5535
Name        = "coconut shoes"
Flags       = {Clothes,Protection,RestrictLevel,RestrictProfession,SkillBoost,Take,Weakness}
Attributes  = {MinimumLevel=20,Professions=4,Weight=750,BodyPosition=8,ArmorValue=1,SkillNumber=4,SkillModification=10,ProtectionDamageTypes=0,DamageReduction=0,WeaknessDamageTypes=1,DamageIncrease=10}
```

**Changes:** Fix typo "cocnut"→"coconut", add RestrictLevel/RestrictProfession, MinimumLevel=20, Professions=4

---

### Change 10: Cast Iron Legs (5458) - Convert to Paladin

Knights have both Falcon Greaves (5168) and Cast Iron Legs (5458) at level 200. Converting Cast Iron to Paladin fills the gap.

**Current:**
```
TypeID      = 5458
Name        = "cast iron legs"
Flags       = {Armor,Clothes,Protection,RestrictLevel,RestrictProfession,SkillBoost,Take,Weakness}
Attributes  = {MinimumLevel=200,Professions=2,Weight=34900,BodyPosition=7,ArmorValue=11,SkillNumber=6,SkillModification=4,ProtectionDamageTypes=1,DamageReduction=15,WeaknessDamageTypes=8,DamageIncrease=13}
```

**Proposed:**
```
TypeID      = 5458
Name        = "cast iron legs"
Flags       = {Armor,Clothes,Protection,RestrictLevel,RestrictProfession,SkillBoost,Take,Weakness}
Attributes  = {MinimumLevel=200,Professions=4,Weight=34900,BodyPosition=7,ArmorValue=9,SkillNumber=7,SkillModification=6,ProtectionDamageTypes=1,DamageReduction=10,WeaknessDamageTypes=8,DamageIncrease=8}
```

**Changes:** Knight→Paladin, Shielding→Distance +6, reduce armor 11→9

---

### Change 11: Soulful Legs (5212) - Convert to Mage lvl 200

Knights have both Ornate Legs (5127) and Soulful Legs (5212) at level 150. Converting Soulful to Mage and raising level fills the Mage lvl 200 legs gap.

**Current:**
```
TypeID      = 5212
Name        = "soulful legs"
Flags       = {Armor,Clothes,Protection,RestrictLevel,RestrictProfession,SkillBoost,Take,Weakness}
Attributes  = {MinimumLevel=150,Professions=2,Weight=3800,BodyPosition=7,ArmorValue=10,SkillNumber=6,SkillModification=3,ProtectionDamageTypes=8,DamageReduction=15,WeaknessDamageTypes=2,DamageIncrease=14}
```

**Proposed:**
```
TypeID      = 5212
Name        = "soulful legs"
Flags       = {Armor,Clothes,Protection,RestrictLevel,RestrictProfession,SkillBoost,Take,Weakness}
Attributes  = {MinimumLevel=200,Professions=24,Weight=3800,BodyPosition=7,ArmorValue=8,SkillNumber=1,SkillModification=6,ProtectionDamageTypes=8,DamageReduction=10,WeaknessDamageTypes=2,DamageIncrease=9}
```

**Changes:** lvl 150→200, Knight→Mage, Shielding→ML +6, reduce armor 10→8

---

### Change 12: Lion Ring (5470) - Fix duplicate Flags bug

**Current (BUGGY):**
```
TypeID      = 5470
Name        = "a lion ring"
Flags       = {Clothes,Protection,RestrictLevel,RestrictProfession,SkillBoost,Take,Weakness}
Flags       = {Clothes,Protection,RestrictLevel,RestrictProfession,SkillBoost,Take,Weakness}
Attributes  = {MinimumLevel=220,Professions=2,Weight=40,BodyPosition=9,SkillNumber=6,SkillModification=2,ProtectionDamageTypes=1,DamageReduction=5,WeaknessDamageTypes=8,DamageIncrease=4}
```

**Proposed:**
```
TypeID      = 5470
Name        = "a lion ring"
Flags       = {Clothes,Protection,RestrictLevel,RestrictProfession,SkillBoost,Take,Weakness}
Attributes  = {MinimumLevel=220,Professions=2,Weight=40,BodyPosition=9,SkillNumber=6,SkillModification=2,ProtectionDamageTypes=1,DamageReduction=5,WeaknessDamageTypes=8,DamageIncrease=4}
```

**Changes:** Remove duplicate Flags line (formatting bug fix only)

---

## Summary Table

| # | TypeID | Item Name | Change Type | Impact |
|---|--------|-----------|-------------|--------|
| 1 | 5501 | Pathfinder Legs | Prof 2→4, add Distance +4 | Paladin legs at lvl 150 |
| 2 | 5500 | Pathfinder Fleshguards | Add ML +6 | Better Mage legs at lvl 150 |
| 3 | 5541 | Demon Mengu | Add Distance +5 | Paladin helm skill at lvl 200 |
| 4 | 5496 | Pathfinder Stompers | Add ML +6 | Mage boots skill at lvl 200 |
| 5 | 5505 | Shroud Of Wisdom | Add ML +8 | Mage armor skill at lvl 250 |
| 6 | 5213 | Grasshopper Legs | Add Prof=4 | Speed legs Paladin-only |
| 7 | 5220 | Badger Boots | Add Prof=4 | Speed boots Paladin-only |
| 8 | 5226 | Vampire Silk Slippers | Add Prof=4 | Speed boots Paladin-only |
| 9 | 5535 | Coconut Shoes | Add Prof=4, lvl 20, fix typo | Speed boots Paladin-only |
| 10 | 5458 | Cast Iron Legs | Prof 2→4, Shielding→Distance | Paladin legs at lvl 200 |
| 11 | 5212 | Soulful Legs | Prof 2→24, lvl 150→200, Shielding→ML | Mage legs at lvl 200 |
| 12 | 5470 | Lion Ring | Fix duplicate Flags line | Bug fix |

---

## Design Compliance

- **Knight:** Keeps highest armor/protection/shielding. Lion set unchanged. Falcon Greaves/Ornate Legs remain.
- **Paladin:** Gets exclusive Speed items + Distance skill boosts. Speed always paired with physical weakness.
- **Mage:** Gets ML boosts on legs/boots/armor. Lower armor values than Knight/Paladin.

---

## Gaps Addressed

- ✅ Paladin legs at 150 (Pathfinder Legs)
- ✅ Paladin legs at 200 (Cast Iron Legs)
- ✅ Mage legs at 150 (Pathfinder Fleshguards with ML +6)
- ✅ Mage legs at 200 (Soulful Legs with ML +6)
- ✅ Speed items restricted to Paladin
- ✅ Paladin helm skill at 200 (Demon Mengu with Distance +5)
- ✅ Mage boots skill at 200 (Pathfinder Stompers with ML +6)
- ✅ Mage armor skill at 250 (Shroud Of Wisdom with ML +8)

## Remaining Gaps (Would Require New Items)

| Gap | Description |
|-----|-------------|
| Paladin legs lvl 250+ | No Paladin legs at 250, 300, 350 |
| Mage legs lvl 250+ | No Mage legs at 250, 300, 350 |
| Paladin lvl 220 | Lion set is Knight-only (correctly) |
| Paladin lvl 250 | No Paladin gear at level 250 tier |
| Paladin armor lvl 350 | Paladin only has Alicorn Ring at 350 |

---

## Files to Modify

1. **`~/repos/demonax-data/game/dat/objects.srv`** - Game data file
2. **`asset/demonax-test.sqlite`** - Website database

## objects.srv Format Reference

```
TypeID      = XXXX
Name        = "item name"
Flags       = {Flag1,Flag2,Flag3}
Attributes  = {Key1=Value1,Key2=Value2}
```

**Critical formatting rules:**
- Each item is exactly 4 lines (TypeID, Name, Flags, Attributes)
- Blank line between items
- No trailing spaces
- Attributes are comma-separated key=value pairs inside braces
- When adding SkillBoost, must add `SkillBoost` to Flags AND `SkillNumber` + `SkillModification` to Attributes
