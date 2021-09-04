includefrom "exgfx_ids.asm"

;#########################################################################
;# Sprite ExGFX ID list for the original sprites
;# 
;# Whenever a sprite is spawned that's new to the frame (i.e spawned from a
;# generator, shooter or any sprite), it will try to load the ExGFX below
;# in the same frame it was spawned, so there won't be any extra delay
;# (+1 frame) when it's supposed to be on screen
;# 
;# You can force only one ExGFX file to be put in queue when said sprite
;# is spawned.
;#
;# The second byte in each entry determines the page used for the ExGFX
;# select either !page_0 or !page_1, which will depend on the sprite.

.original_sprites
;.00 Green Koopa no shell
    db !dss_id_shelless_koopa
    db !page_0
;.01 Red Koopa no shell
    db !dss_id_shelless_koopa
    db !page_0
;.02 Blue Koopa no shell
    db !dss_id_shelless_blue_koopa
    db !page_0
;.03 Yellow Koopa no shell
    db !dss_id_shelless_koopa
    db !page_0
;.04 Green Koopa
    db !dss_id_koopa
    db !page_0
;.05 Red Koopa
    db !dss_id_koopa
    db !page_0
;.06 Blue Koopa
    db !dss_id_koopa
    db !page_0
;.07 Yellow Koopa
    db !dss_id_koopa
    db !page_0
;.08 Green Koopa flying left
    db !dss_id_koopa
    db !page_0
;.09 Green bouncing Koopa
    db !dss_id_koopa
    db !page_0
;.0A Red vertical flying Koopa
    db !dss_id_koopa
    db !page_0
;.0B Red horizontal flying Koopa
    db !dss_id_koopa
    db !page_0
;.0C Yellow Koopa with wings
    db !dss_id_koopa
    db !page_0
;.0D Bob-omb
    db !dss_id_bobomb
    db !page_0
;.0E Keyhole
    db !dss_id_keyhole
    db !page_0
;.0F Goomba
    db !dss_id_goomba
    db !page_0
;.10 Bouncing Goomba with wings
    db !dss_id_goomba
    db !page_0
;.11 Buzzy Beetle
    db !dss_id_buzzy_beetle
    db !page_0
;.12 Unused
    db !dss_id_null
    db !page_0
;.13 Spiny
    db !dss_id_spiny
    db !page_0
;.14 Spiny falling
    db !dss_id_spiny
    db !page_0
;.15 Fish, horizontal
    db !dss_id_cheep_cheep
    db !page_0
;.16 Fish, vertical
    db !dss_id_cheep_cheep
    db !page_0
;.17 Fish, created from generator
    db !dss_id_cheep_cheep
    db !page_0
;.18 Surface jumping fish
    db !dss_id_cheep_cheep
    db !page_0
;.19 Display text from level Message Box #1
    db !dss_id_null
    db !page_0
;.1A Classic Piranha Plant
    db !dss_id_piranha_plant
    db !page_0
;.1B Bouncing football in place
    db !dss_id_football
    db !page_0
;.1C Bullet Bill
    db !dss_id_bullet_bill
    db !page_0
;.1D Hopping flame
    db !dss_id_hopping_flame
    db !page_0
;.1E Lakitu
    db !dss_id_lakitu
    db !page_0
;.1F Magikoopa
    db !dss_id_magikoopa
    db !page_0
;.20 Magikoopa's magic
    db !dss_id_magikoopa_magic
    db !page_0
;.21 Moving coin
    db !dss_id_null
    db !page_0
;.22 Green vertical net Koopa
    db !dss_id_net_koopa
    db !page_0
;.23 Red vertical net Koopa
    db !dss_id_net_koopa
    db !page_0
;.24 Green horizontal net Koopa
    db !dss_id_net_koopa
    db !page_0
;.25 Red horizontal net Koopa
    db !dss_id_net_koopa
    db !page_0
;.26 Thwomp
    db !dss_id_thwomp
    db !page_0
;.27 Thwimp
    db !dss_id_thwimp
    db !page_0
;.28 Big Boo
    db !dss_id_big_boo
    db !page_0
;.29 Koopa Kid
    db !dss_id_null
    db !page_0
;.2A Upside down Piranha Plant
    db !dss_id_piranha_plant
    db !page_0
;.2B Sumo Brother's fire lightning
    db !dss_id_sumo_bro_lightning
    db !page_0
;.2C Yoshi egg
    db !dss_id_yoshi_eggs
    db !page_0
;.2D Baby green Yoshi
    db !dss_id_null
    db !page_0
;.2E Spike Top
    db !dss_id_spike_top
    db !page_0
;.2F Portable spring board
    db !dss_id_springboard
    db !page_0
;.30 Dry Bones, throws bones
    db !dss_id_dry_bones
    db !page_0
;.31 Bony Beetle
    db !dss_id_bony_beetle
    db !page_0
;.32 Dry Bones, stay on ledge
    db !dss_id_dry_bones
    db !page_0
;.33 Fireball
    db !dss_id_podoboo
    db !page_0
;.34 Boss fireball
    db !dss_id_null
    db !page_0
;.35 Green Yoshi
    db !dss_id_null
    db !page_0
;.36 Unused
    db !dss_id_null
    db !page_0
;.37 Boo
    db !dss_id_boo
    db !page_0
;.38 Eerie
    db !dss_id_eerie
    db !page_0
;.39 Eerie, wave motion
    db !dss_id_eerie
    db !page_0
;.3A Urchin, fixed
    db !dss_id_urchin
    db !page_0
;.3B Urchin, wall detect
    db !dss_id_urchin
    db !page_0
;.3C Urchin, wall follow
    db !dss_id_urchin
    db !page_0
;.3D Rip Van Fish
    db !dss_id_rip_van_fish
    db !page_0
;.3E POW
    db !dss_id_p_switch
    db !page_0
;.3F Para-Goomba
    db !dss_id_paragoomba
    db !page_0
;.40 Para-Bomb
    db !dss_id_parabobomb
    db !page_0
;.41 Dolphin, horizontal
    db !dss_id_horizontal_dolphin
    db !page_0
;.42 Dolphin2, horizontal
    db !dss_id_horizontal_dolphin
    db !page_0
;.43 Dolphin, vertical
    db !dss_id_vertical_dolphin
    db !page_0
;.44 Torpedo Ted
    db !dss_id_torpedo_ted
    db !page_0
;.45 Directional coins
    db !dss_id_null
    db !page_0
;.46 Diggin' Chuck
    db !dss_id_chuck_diggin
    db !page_0
;.47 Swimming/Jumping fish
    db !dss_id_cheep_cheep
    db !page_0
;.48 Diggin' Chuck's rock
    db !dss_id_chuck_rock
    db !page_0
;.49 Growing/shrinking pipe end
    db !dss_id_vertical_growing_pipe
    db !page_0
;.4A Goal Point Question Sphere
    db !dss_id_goal_question_sphere
    db !page_0
;.4B Pipe dwelling Lakitu
    db !dss_id_lakitu
    db !page_0
;.4C Exploding Block
    db !dss_id_turn_block
    db !page_0
;.4D Ground dwelling Monty Mole
    db !dss_id_monty_mole
    db !page_0
;.4E Ledge dwelling Monty Mole
    db !dss_id_monty_mole
    db !page_0
;.4F Jumping Piranha Plant
    db !dss_id_piranha_plant
    db !page_0
;.50 Jumping Piranha Plant, spit fire
    db !dss_id_piranha_plant
    db !page_0
;.51 Ninji
    db !dss_id_ninji
    db !page_0
;.52 Moving ledge hole in ghost house
    db !dss_id_moving_hole
    db !page_0
;.53 Throw block sprite
    db !dss_id_turn_block
    db !page_0
;.54 Climbing net door
    db !dss_id_climbing_net
    db !page_0
;.55 Checkerboard platform, horizontal
    db !dss_id_checkerboard_platform
    db !page_0
;.56 Flying rock platform, horizontal
    db !dss_id_rock_platform
    db !page_0
;.57 Checkerboard platform, vertical
    db !dss_id_checkerboard_platform
    db !page_0
;.58 Flying rock platform, vertical
    db !dss_id_rock_platform
    db !page_0
;.59 Turn block bridge, horizontal and vertical
    db !dss_id_turn_block
    db !page_0
;.5A Turn block bridge, horizontal
    db !dss_id_turn_block
    db !page_0
;.5B Brown platform floating in water
    db !dss_id_brown_platform
    db !page_0
;.5C Checkerboard platform that falls
    db !dss_id_checkerboard_platform
    db !page_0
;.5D Orange platform floating in water
    db !dss_id_orange_platform
    db !page_0
;.5E Orange platform, goes on forever
    db !dss_id_orange_platform
    db !page_0
;.5F Brown platform on a chain
    db !dss_id_brown_platform
    db !page_0
;.60 Flat green switch palace switch
    db !dss_id_null
    db !page_0
;.61 Floating skulls
    db !dss_id_floating_skull
    db !page_0
;.62 Brown platform, line-guided
    db !dss_id_brown_platform
    db !page_0
;.63 Checker/brown platform, line-guided
    db !dss_id_null
    db !page_0
;.64 Rope mechanism, line-guided
    db !dss_id_rope
    db !page_0
;.65 Chainsaw, line-guided
    db !dss_id_chainsaw
    db !page_0
;.66 Upside down chainsaw, line-guided
    db !dss_id_chainsaw
    db !page_0
;.67 Grinder, line-guided
    db !dss_id_grinder
    db !page_0
;.68 Fuzz ball, line-guided
    db !dss_id_fuzzy
    db !page_0
;.69 Unused
    db !dss_id_null
    db !page_0
;.6A Coin game cloud
    db !dss_id_smiling_coin
    db !page_0
;.6B Spring board, left wall
    db !dss_id_null
    db !page_0
;.6C Spring board, right wall
    db !dss_id_null
    db !page_0
;.6D Invisible solid block
    db !dss_id_null
    db !page_0
;.6E Dino Rhino
    db !dss_id_dino_rhino
    db !page_0
;.6F Dino Torch
    db !dss_id_dino_torch
    db !page_0
;.70 Pokey
    db !dss_id_pokey
    db !page_0
;.71 Super Koopa, red cape
    db !dss_id_super_koopa
    db !page_0
;.72 Super Koopa, yellow cape
    db !dss_id_super_koopa
    db !page_0
;.73 Super Koopa, feather
    db !dss_id_super_koopa
    db !page_0
;.74 Mushroom
    db !dss_id_mushroom
    db !page_0
;.75 Flower
    db !dss_id_fire_flower
    db !page_0
;.76 Star
    db !dss_id_star
    db !page_0
;.77 Feather
    db !dss_id_feather
    db !page_0
;.78 1-Up
    db !dss_id_mushroom
    db !page_0
;.79 Growing Vine
    db !dss_id_piranha_plant
    db !page_0
;.7A Firework
    db !dss_id_null
    db !page_0
;.7B Goal Point
    db !dss_id_goal_tape
    db !page_0
;.7C Princess Peach
    db !dss_id_null
    db !page_0
;.7D Balloon
    db !dss_id_p_balloon
    db !page_0
;.7E Flying Red coin
    db !dss_id_red_coin
    db !page_0
;.7F Flying yellow 1-Up
    db !dss_id_mushroom
    db !page_0
;.80 Key
    db !dss_id_key
    db !page_0
;.81 Changing item from translucent block
    db !dss_id_null
    db !page_0
;.82 Bonus game sprite
    db !dss_id_bonus_box
    db !page_0
;.83 Left flying question block
    db !dss_id_question_block
    db !page_0
;.84 Flying question block
    db !dss_id_question_block
    db !page_0
;.85 Unused (Pretty sure)
    db !dss_id_null
    db !page_0
;.86 Wiggler
    db !dss_id_wiggler
    db !page_0
;.87 Lakitu's cloud
    db !dss_id_null
    db !page_0
;.88 Unused (Winged cage sprite)
    db !dss_id_null
    db !page_0
;.89 Layer 3 smash
    db !dss_id_null
    db !page_0
;.8A Bird from Yoshi's house
    db !dss_id_null
    db !page_0
;.8B Puff of smoke from Yoshi's house
    db !dss_id_null
    db !page_0
;.8C Fireplace smoke/exit from side screen
    db !dss_id_null
    db !page_0
;.8D Ghost house exit sign and door
    db !dss_id_null
    db !page_0
;.8E Invisible "Warp Hole" blocks
    db !dss_id_null
    db !page_0
;.8F Scale platforms
    db !dss_id_mushroom_scale
    db !page_0
;.90 Large green gas bubble
    db !dss_id_gas_bubble
    db !page_0
;.91 Chargin' Chuck
    db !dss_id_chuck_body
    db !page_0
;.92 Splittin' Chuck
    db !dss_id_chuck_body
    db !page_0
;.93 Bouncin' Chuck
    db !dss_id_chuck_body
    db !page_0
;.94 Whistlin' Chuck
    db !dss_id_chuck_body
    db !page_0
;.95 Clapin' Chuck
    db !dss_id_chuck_body
    db !page_0
;.96 Unused (Chargin' Chuck clone)
    db !dss_id_chuck_body
    db !page_0
;.97 Puntin' Chuck
    db !dss_id_chuck_pitchin_puntin
    db !page_0
;.98 Pitchin' Chuck
    db !dss_id_chuck_pitchin_puntin
    db !page_0
;.99 Volcano Lotus
    db !dss_id_volcano_lotus
    db !page_0
;.9A Sumo Brother
    db !dss_id_sumo_bro
    db !page_0
;.9B Hammer Brother
    db !dss_id_hammer_bro
    db !page_0
;.9C Flying blocks for Hammer Brother
    db !dss_id_turn_block
    db !page_0
;.9D Bubble with sprite
    db !dss_id_bubble
    db !page_0
;.9E Ball and Chain
    db !dss_id_ball_n_chain
    db !page_0
;.9F Banzai Bill
    db !dss_id_banzai_bill
    db !page_0
;.A0 Activates Bowser scene
    db !dss_id_null
    db !page_0
;.A1 Bowser's bowling ball
    db !dss_id_null
    db !page_0
;.A2 MechaKoopa
    db !dss_id_mechakoopa
    db !page_0
;.A3 Grey platform on chain
    db !dss_id_brown_platform
    db !page_0
;.A4 Floating Spike ball
    db !dss_id_spiky_balls
    db !page_0
;.A5 Fuzzball/Sparky, ground-guided
    db !dss_id_sparky
    db !page_0
;.A6 HotHead, ground-guided
    db !dss_id_hothead
    db !page_0
;.A7 Iggy's ball
    db !dss_id_null
    db !page_0
;.A8 Blargg
    db !dss_id_blarrg
    db !page_0
;.A9 Reznor
    db !dss_id_null
    db !page_0
;.AA Fishbone
    db !dss_id_fishbone
    db !page_0
;.AB Rex
	db !dss_id_rex
    db !page_0
;.AC Wooden Spike, moving down and up
    db !dss_id_wooden_spike
    db !page_0
;.AD Wooden Spike, moving up/down first
    db !dss_id_wooden_spike
    db !page_0
;.AE Fishin' Boo
    db !dss_id_fishing_boo
    db !page_0
;.AF Boo Block
    db !dss_id_boo_block
    db !page_0
;.B0 Reflecting stream of Boo Buddies
    db !dss_id_boo
    db !page_0
;.B1 Creating/Eating block
    db !dss_id_used_block
    db !page_0
;.B2 Falling Spike
    db !dss_id_falling_spike
    db !page_0
;.B3 Bowser statue fireball
    db !dss_id_bowser_statue_flame
    db !page_0
;.B4 Grinder, non-line-guided
    db !dss_id_grinder
    db !page_0
;.B5 Sinking fireball used in boss battles
    db !dss_id_null
    db !page_0
;.B6 Reflecting fireball
    db !dss_id_reflecting_fireball
    db !page_0
;.B7 Carrot Top lift, upper right
    db !dss_id_carrot_platform
    db !page_0
;.B8 Carrot Top lift, upper left
    db !dss_id_carrot_platform
    db !page_0
;.B9 Info Box
    db !dss_id_info_fox
    db !page_0
;.BA Timed lift
    db !dss_id_timed_platform
    db !page_0
;.BB Grey moving castle block
    db !dss_id_castle_block
    db !page_0
;.BC Bowser statue
    db !dss_id_bowser_statue
    db !page_0
;.BD Sliding Koopa without a shell
    db !dss_id_shelless_blue_koopa
    db !page_0
;.BE Swooper bat
    db !dss_id_swooper_bat
    db !page_0
;.BF Mega Mole
    db !dss_id_mega_mole
    db !page_0
;.C0 Grey platform on lava
    db !dss_id_rock_platform
    db !page_0
;.C1 Flying grey turnblocks
    db !dss_id_turn_block
    db !page_0
;.C2 Blurp fish
    db !dss_id_blurp
    db !page_0
;.C3 Porcu-Puffer fish
    db !dss_id_porcupuffer
    db !page_0
;.C4 Grey platform that falls
    db !dss_id_brown_platform
    db !page_0
;.C5 Big Boo Boss
    db !dss_id_big_boo
    db !page_0
;.C6 Dark room with spot light
    db !dss_id_disco_ball
    db !page_0
;.C7 Invisible mushroom
    db !dss_id_null
    db !page_0
;.C8 Light switch block for dark room
    db !dss_id_question_block
    db !page_0
;.C9 Bullet Bill shooter
    db !dss_id_bullet_bill
    db !page_0
;.CA Torpedo Launcher
    db !dss_id_torpedo_ted_hand
    db !page_0
;.CB Eerie, generator
    db !dss_id_eerie
    db !page_0
;.CC Para-Goomba, generator
    db !dss_id_parabobomb
    db !page_0
;.CD Para-Bomb, generator
    db !dss_id_parabobomb
    db !page_0
;.CE Para-Bomb and Para-Goomba, generator
    db !dss_id_parachute
    db !page_0
;.CF Dolphin, left, generator
    db !dss_id_horizontal_dolphin
    db !page_0
;.D0 Dolphin, right, generator
    db !dss_id_horizontal_dolphin
    db !page_0
;.D1 Jumping fish, generator
    db !dss_id_cheep_cheep
    db !page_0
;.D2 Turn off generator 2 (sprite E5)
    db !dss_id_null
    db !page_0
;.D3 Super Koopa, generator
    db !dss_id_super_koopa
    db !page_0
;.D4 Bubble with Goomba and Bob-omb, generator
    db !dss_id_bubble
    db !page_0
;.D5 Bullet Bill, generator
    db !dss_id_bullet_bill
    db !page_0
;.D6 Bullet Bill surrounded, generator
    db !dss_id_bullet_bill
    db !page_0
;.D7 Bullet Bill diagonal, generator
    db !dss_id_bullet_bill
    db !page_0
;.D8 Bowser statue fire breath, generator
    db !dss_id_null
    db !page_0
;.D9 Turn off standard generators
    db !dss_id_null
    db !page_0
;.DA Green Koopa shell
    db !dss_id_koopa_shell
    db !page_0
;.DB Red Koopa shell
    db !dss_id_koopa_shell
    db !page_0
;.DC Blue Koopa shell
    db !dss_id_koopa_shell
    db !page_0
;.DD Yellow Koopa shell
    db !dss_id_koopa_shell
    db !page_0
;.DE Group of 5 eeries, wave motion
    db !dss_id_eerie
    db !page_0
;.DF Green bouncing Koopa shell
    db !dss_id_koopa_shell
    db !page_0
;.E0 3 platforms on chains
    db !dss_id_brown_platform
    db !page_0
;.E1 Ghost ceiling
    db !dss_id_boo
    db !page_0
;.E2 Boo Buddies, counter clockwise
    db !dss_id_boo
    db !page_0
;.E3 Boo Buddies, clockwise
    db !dss_id_boo
    db !page_0
;.E4 Swooper bat ceiling
    db !dss_id_swooper_bat
    db !page_0
;.E5 Reappearing ghost, generator 2
    db !dss_id_boo
    db !page_0
;.E6 Candle flame background
    db !dss_id_background_flames
    db !page_0
;.E7 Auto-Scroll, Unused?
    db !dss_id_null
    db !page_0
;.E8 Auto-Scroll
    db !dss_id_null
    db !page_0
;.E9 Layer 2 Smash
    db !dss_id_null
    db !page_0
;.EA Layer 2 Scroll
    db !dss_id_null
    db !page_0
;.EB Unused
    db !dss_id_null
    db !page_0
;.EC Unused
    db !dss_id_null
    db !page_0
;.ED Layer 2 Falls
    db !dss_id_null
    db !page_0
;.EE Unused
    db !dss_id_null
    db !page_0
;.EF Layer 2 Scroll
    db !dss_id_null
    db !page_0
;.F0 Unused
    db !dss_id_null
    db !page_0
;.F1 Unused
    db !dss_id_null
    db !page_0
;.F2 Layer 2 On/Off Switch controlled
    db !dss_id_null
    db !page_0
;.F3 Auto-Scroll level
    db !dss_id_null
    db !page_0
;.F4 Fast BG scroll
    db !dss_id_null
    db !page_0
;.F5 Layer 2 sink/rise
    db !dss_id_null
    db !page_0
;.F6 Unused, fatal error
    db !dss_id_null
    db !page_0
;.F7 Unused, fatal error
    db !dss_id_null
    db !page_0
;.F8 Unused, fatal error
    db !dss_id_null
    db !page_0
;.F9 Unused, fatal error
    db !dss_id_null
    db !page_0
;.FA Unused, fatal error
    db !dss_id_null
    db !page_0
;.FB Unused, fatal error
    db !dss_id_null
    db !page_0
;.FC Unused, fatal error
    db !dss_id_null
    db !page_0
;.FD Unused, fatal error
    db !dss_id_null
    db !page_0
;.FE Unused, fatal error
    db !dss_id_null
    db !page_0
;.FF Unused, fatal error
    db !dss_id_null