/obj/item/weapon/material/sword
	name = "claymore"
	desc = "What are you standing around staring at this for? Get to killing!"
	icon_state = "claymore"
	item_state = "claymore"
	slot_flags = SLOT_BELT
	w_class = ITEM_SIZE_HUGE
	mod_weight = 1.75
	mod_reach = 1.65
	mod_handy = 1.25
	force_const = 12
	thrown_force_const = 5
	force_divisor = 0.4 // 24 when wielded with hardnes 60 (steel)
	thrown_force_divisor = 0.3 // 6 when thrown with weight 20 (steel)
	sharp = 1
	edge = 1
	attack_verb = list("attacked", "slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	hitsound = 'sound/weapons/bladeslice.ogg'

/obj/item/weapon/material/sword/replica
	desc = "What are you standing around staring at this for? Get to looking cringy!"
	edge = 0
	sharp = 0
	force_const = 3.0
	force_divisor = 0.35 // 7 when wielded with weight 20 (steel)
	thrown_force_divisor = 0.2
	hitsound = SFX_FIGHTING_SWING // It's dull

/obj/item/weapon/material/sword/katana
	name = "katana"
	desc = "Woefully underpowered in D20. This one looks pretty sharp."
	icon_state = "katana"
	item_state = "katana"
	w_class = ITEM_SIZE_LARGE
	mod_weight = 1.3
	mod_reach = 1.5
	mod_handy = 1.5
	slot_flags = SLOT_BELT | SLOT_BACK

/obj/item/weapon/material/sword/katana/replica
	desc = "The best friend of a samurai wannabe. This one looks not so sharp."
	edge = 0
	sharp = 0
	force_const = 2.5
	force_divisor = 0.25 // 5 when wielded with weight 20 (steel)
	thrown_force_divisor = 0.2
	hitsound = SFX_FIGHTING_SWING

/obj/item/weapon/material/sword/longsword
	name = "longsword blade"
	icon = 'icons/obj/weapons.dmi'
	icon_state = "longsword"
	item_state = "longsword"
	desc = "A long blade. Very sharp and uncomfortable."
	obj_flags = OBJ_FLAG_CONDUCTIBLE
	w_class = ITEM_SIZE_HUGE
	sharp = 1
	edge = 1
	mod_weight = 1.3
	mod_reach = 1.3
	mod_handy = 0.1
	force_const = 10
	thrown_force_const = 4
	force_divisor = 0.35    // 20 when wielded with hardness 60 (steel)
	matter = list(MATERIAL_STEEL = 20000)
	origin_tech = list(TECH_MATERIAL = 1)
	attack_verb = list("attacked", "slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	unbreakable = 0
	slot_flags = SLOT_BELT | SLOT_BACK
	randpixel = 0
	m_overlay = 1
	var/hasgrip = 0


/obj/item/weapon/material/sword/longsword/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if(!hasgrip)
		if(istype(W,/obj/item/weapon/material/longgrip))
			hasgrip = 1
			name = "[src:material.display_name] longsword"
			desc = "A long blade. This one has a comfortable [src:material.display_name] grip."
			mod_weight += 0.10
			mod_handy = W.mod_handy
			unbreakable = 1
			to_chat(user, "<span class='notice'>You insert [src] into [W].</span>")
			overlays += image("icon" = 'icons/obj/weapons.dmi', "icon_state" = "[W.icon_state]")
			user.drop_from_inventory(W)
			qdel(W)
			return
		if(isCoil(W))
			var/obj/item/stack/cable_coil/C = W
			if(C.use(5))
				hasgrip = 1
				name = "[src:material.display_name] longblade"
				desc = "A long blade. This one has a makeshift cable grip."
				mod_weight += 0.05
				mod_handy = 1.0
				to_chat(user, "<span class='notice'>You wind up [src]'s grip with the cable.</span>")
				overlays += image("icon" = 'icons/obj/weapons.dmi', "icon_state" = "longshiv_wire")
			return
		if(istype(W,/obj/item/weapon/tape_roll))
			hasgrip = 1
			name = "[src:material.display_name] longblade"
			desc = "A long blade. This one has a makeshift duct tape grip."
			mod_weight += 0.1
			mod_handy = 1.0
			to_chat(user, "<span class='notice'>You wind up [src]'s grip with the cable.</span>")
			overlays += image("icon" = 'icons/obj/weapons.dmi', "icon_state" = "longshiv_tape")
			return
	..()

/obj/item/weapon/material/longgrip
	name = "long knife grip"
	icon = 'icons/obj/weapons.dmi'
	icon_state = "longshiv_plastic"
	desc = "A durable grip for a longsword."
	obj_flags = OBJ_FLAG_CONDUCTIBLE
	mod_weight = 0.2
	mod_reach = 0.1
	mod_handy = 1.15
	force_const = 5.0
	thrown_force_const = 3
	force_divisor = 0
	matter = list(MATERIAL_STEEL = 6000)
	randpixel = 0
	applies_material_colour = 0
	hitsound = SFX_FIGHTING_SWING

/obj/item/weapon/material/longgrip/wood/New(newloc)
	..(newloc, MATERIAL_WOOD)
	name = "wooden longsword grip"
	icon_state = "longshiv_wood"
	color = null

/obj/item/weapon/material/longgrip/plastic/New(newloc)
	..(newloc, MATERIAL_PLASTIC)
	name = "plastic longsword grip"
	icon_state = "longshiv_plastic"
	color = null
