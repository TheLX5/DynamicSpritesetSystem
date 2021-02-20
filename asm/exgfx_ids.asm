includefrom "dynamic_spritesets.asm"

;#########################################################################
;# Sprite ExGFX ID list
;# 
;# Whenever a sprite is spawned that's new to the frame (i.e spawned from a
;# generator, shooter or any sprite), it will try to load the ExGFX below
;# in the same frame it was spawned, so there won't be any extra delay
;# (+1 frame) when it's supposed to be on screen
;# 
;# You can force only one ExGFX file to be put in queue when said sprite
;# is spawned.
;#
;# This system supports regular, extended and cluster sprites.
;# 

exgfx_ids:

;##################################################################################################
;# Original sprites

.original_sprites
;.00 Green Koopa no shell
    db !dss_id_shelless_koopa
;.01 Red Koopa no shell
    db !dss_id_shelless_koopa
;.02 Blue Koopa no shell
    db !dss_id_shelless_blue_koopa
;.03 Yellow Koopa no shell
    db !dss_id_shelless_koopa
;.04 Green Koopa
    db !dss_id_koopa
;.05 Red Koopa
    db !dss_id_koopa
;.06 Blue Koopa
    db !dss_id_koopa
;.07 Yellow Koopa
    db !dss_id_koopa
;.08 Green Koopa flying left
    db !dss_id_koopa
;.09 Green bouncing Koopa
    db !dss_id_koopa
;.0A Red vertical flying Koopa
    db !dss_id_koopa
;.0B Red horizontal flying Koopa
    db !dss_id_koopa
;.0C Yellow Koopa with wings
    db !dss_id_koopa
;.0D Bob-omb
    db !dss_id_bobomb
;.0E Keyhole
    db !dss_id_null
;.0F Goomba
    db !dss_id_goomba
;.10 Bouncing Goomba with wings
    db !dss_id_goomba
;.11 Buzzy Beetle
    db !dss_id_buzzy_beetle
;.12 Unused
    db !dss_id_null
;.13 Spiny
    db !dss_id_spiny
;.14 Spiny falling
    db !dss_id_spiny
;.15 Fish, horizontal
    db !dss_id_cheep_cheep
;.16 Fish, vertical
    db !dss_id_cheep_cheep
;.17 Fish, created from generator
    db !dss_id_cheep_cheep
;.18 Surface jumping fish
    db !dss_id_cheep_cheep
;.19 Display text from level Message Box #1
    db !dss_id_null
;.1A Classic Piranha Plant
    db !dss_id_null
;.1B Bouncing football in place
    db !dss_id_football
;.1C Bullet Bill
    db !dss_id_bullet_bill
;.1D Hopping flame
    db !dss_id_hopping_flame
;.1E Lakitu
    db !dss_id_lakitu
;.1F Magikoopa
    db !dss_id_magikoopa
;.20 Magikoopa's magic
    db !dss_id_magikoopa_magic
;.21 Moving coin
    db !dss_id_null
;.22 Green vertical net Koopa
    db !dss_id_net_koopa
;.23 Red vertical net Koopa
    db !dss_id_net_koopa
;.24 Green horizontal net Koopa
    db !dss_id_net_koopa
;.25 Red horizontal net Koopa
    db !dss_id_net_koopa
;.26 Thwomp
    db !dss_id_thwomp
;.27 Thwimp
    db !dss_id_thwimp
;.28 Big Boo
    db !dss_id_big_boo
;.29 Koopa Kid
    db !dss_id_null
;.2A Upside down Piranha Plant
    db !dss_id_null
;.2B Sumo Brother's fire lightning
    db !dss_id_sumo_bro_lightning
;.2C Yoshi egg
    db !dss_id_yoshi_eggs
;.2D Baby green Yoshi
    db !dss_id_null
;.2E Spike Top
    db !dss_id_spike_top
;.2F Portable spring board
    db !dss_id_springboard
;.30 Dry Bones, throws bones
    db !dss_id_dry_bones
;.31 Bony Beetle
    db !dss_id_bony_beetle
;.32 Dry Bones, stay on ledge
    db !dss_id_dry_bones
;.33 Fireball
    db !dss_id_podoboo
;.34 Boss fireball
    db !dss_id_null
;.35 Green Yoshi
    db !dss_id_null
;.36 Unused
    db !dss_id_null
;.37 Boo
    db !dss_id_boo
;.38 Eerie
    db !dss_id_eerie
;.39 Eerie, wave motion
    db !dss_id_eerie
;.3A Urchin, fixed
    db !dss_id_urchin
;.3B Urchin, wall detect
    db !dss_id_urchin
;.3C Urchin, wall follow
    db !dss_id_urchin
;.3D Rip Van Fish
    db !dss_id_rip_van_fish
;.3E POW
    db !dss_id_null
;.3F Para-Goomba
    db !dss_id_paragoomba
;.40 Para-Bomb
    db !dss_id_parabobomb
;.41 Dolphin, horizontal
    db !dss_id_horizontal_dolphin
;.42 Dolphin2, horizontal
    db !dss_id_horizontal_dolphin
;.43 Dolphin, vertical
    db !dss_id_vertical_dolphin
;.44 Torpedo Ted
    db !dss_id_torpedo_ted
;.45 Directional coins
    db !dss_id_null
;.46 Diggin' Chuck
    db !dss_id_chuck_diggin
;.47 Swimming/Jumping fish
    db !dss_id_cheep_cheep
;.48 Diggin' Chuck's rock
    db !dss_id_chuck_rock
;.49 Growing/shrinking pipe end
    db !dss_id_vertical_growing_pipe
;.4A Goal Point Question Sphere
    db !dss_id_goal_question_sphere
;.4B Pipe dwelling Lakitu
    db !dss_id_lakitu
;.4C Exploding Block
    db !dss_id_null
;.4D Ground dwelling Monty Mole
    db !dss_id_monty_mole
;.4E Ledge dwelling Monty Mole
    db !dss_id_monty_mole
;.4F Jumping Piranha Plant
    db !dss_id_piranha_plant
;.50 Jumping Piranha Plant, spit fire
    db !dss_id_piranha_plant
;.51 Ninji
    db !dss_id_ninji
;.52 Moving ledge hole in ghost house
    db !dss_id_moving_hole
;.53 Throw block sprite
    db !dss_id_null
;.54 Climbing net door
    db !dss_id_climbing_net
;.55 Checkerboard platform, horizontal
    db !dss_id_checkerboard_platform
;.56 Flying rock platform, horizontal
    db !dss_id_rock_platform
;.57 Checkerboard platform, vertical
    db !dss_id_checkerboard_platform
;.58 Flying rock platform, vertical
    db !dss_id_rock_platform
;.59 Turn block bridge, horizontal and vertical
    db !dss_id_null
;.5A Turn block bridge, horizontal
    db !dss_id_null
;.5B Brown platform floating in water
    db !dss_id_brown_platform
;.5C Checkerboard platform that falls
    db !dss_id_checkerboard_platform
;.5D Orange platform floating in water
    db !dss_id_orange_platform
;.5E Orange platform, goes on forever
    db !dss_id_orange_platform
;.5F Brown platform on a chain
    db !dss_id_brown_platform
;.60 Flat green switch palace switch
    db !dss_id_null
;.61 Floating skulls
    db !dss_id_floating_skull
;.62 Brown platform, line-guided
    db !dss_id_brown_platform
;.63 Checker/brown platform, line-guided
    db !dss_id_null
;.64 Rope mechanism, line-guided
    db !dss_id_rope
;.65 Chainsaw, line-guided
    db !dss_id_chainsaw
;.66 Upside down chainsaw, line-guided
    db !dss_id_chainsaw
;.67 Grinder, line-guided
    db !dss_id_grinder
;.68 Fuzz ball, line-guided
    db !dss_id_fuzzy
;.69 Unused
    db !dss_id_null
;.6A Coin game cloud
    db !dss_id_smiling_coin
;.6B Spring board, left wall
    db !dss_id_null
;.6C Spring board, right wall
    db !dss_id_null
;.6D Invisible solid block
    db !dss_id_null
;.6E Dino Rhino
    db !dss_id_dino_rhino
;.6F Dino Torch
    db !dss_id_dino_torch
;.70 Pokey
    db !dss_id_pokey
;.71 Super Koopa, red cape
    db !dss_id_super_koopa
;.72 Super Koopa, yellow cape
    db !dss_id_super_koopa
;.73 Super Koopa, feather
    db !dss_id_super_koopa
;.74 Mushroom
    db !dss_id_mushroom
;.75 Flower
    db !dss_id_fire_flower
;.76 Star
    db !dss_id_star
;.77 Feather
    db !dss_id_feather
;.78 1-Up
    db !dss_id_mushroom
;.79 Growing Vine
    db !dss_id_piranha_plant
;.7A Firework
    db !dss_id_null
;.7B Goal Point
    db !dss_id_goal_tape
;.7C Princess Peach
    db !dss_id_null
;.7D Balloon
    db !dss_id_p_balloon
;.7E Flying Red coin
    db !dss_id_red_coin
;.7F Flying yellow 1-Up
    db !dss_id_mushroom
;.80 Key
    db !dss_id_null
;.81 Changing item from translucent block
    db !dss_id_null
;.82 Bonus game sprite
    db !dss_id_bonus_box
;.83 Left flying question block
    db !dss_id_null
;.84 Flying question block
    db !dss_id_null
;.85 Unused (Pretty sure)
    db !dss_id_null
;.86 Wiggler
    db !dss_id_wiggler
;.87 Lakitu's cloud
    db !dss_id_null
;.88 Unused (Winged cage sprite)
    db !dss_id_null
;.89 Layer 3 smash
    db !dss_id_null
;.8A Bird from Yoshi's house
    db !dss_id_null
;.8B Puff of smoke from Yoshi's house
    db !dss_id_null
;.8C Fireplace smoke/exit from side screen
    db !dss_id_null
;.8D Ghost house exit sign and door
    db !dss_id_null
;.8E Invisible "Warp Hole" blocks
    db !dss_id_null
;.8F Scale platforms
    db !dss_id_mushroom_scale
;.90 Large green gas bubble
    db !dss_id_gas_bubble
;.91 Chargin' Chuck
    db !dss_id_chuck_body
;.92 Splittin' Chuck
    db !dss_id_chuck_body
;.93 Bouncin' Chuck
    db !dss_id_chuck_body
;.94 Whistlin' Chuck
    db !dss_id_chuck_body
;.95 Clapin' Chuck
    db !dss_id_chuck_body
;.96 Unused (Chargin' Chuck clone)
    db !dss_id_chuck_body
;.97 Puntin' Chuck
    db !dss_id_chuck_pitchin_puntin
;.98 Pitchin' Chuck
    db !dss_id_chuck_pitchin_puntin
;.99 Volcano Lotus
    db !dss_id_volcano_lotus
;.9A Sumo Brother
    db !dss_id_sumo_bro
;.9B Hammer Brother
    db !dss_id_hammer_bro
;.9C Flying blocks for Hammer Brother
    db !dss_id_null
;.9D Bubble with sprite
    db !dss_id_bubble
;.9E Ball and Chain
    db !dss_id_ball_n_chain
;.9F Banzai Bill
    db !dss_id_banzai_bill
;.A0 Activates Bowser scene
    db !dss_id_null
;.A1 Bowser's bowling ball
    db !dss_id_null
;.A2 MechaKoopa
    db !dss_id_mechakoopa
;.A3 Grey platform on chain
    db !dss_id_brown_platform
;.A4 Floating Spike ball
    db !dss_id_spiky_balls
;.A5 Fuzzball/Sparky, ground-guided
    db !dss_id_sparky
;.A6 HotHead, ground-guided
    db !dss_id_hothead
;.A7 Iggy's ball
    db !dss_id_null
;.A8 Blargg
    db !dss_id_blarrg
;.A9 Reznor
    db !dss_id_reznor
;.AA Fishbone
    db !dss_id_fishbone
;.AB Rex
	db !dss_id_rex
;.AC Wooden Spike, moving down and up
    db !dss_id_wooden_spike
;.AD Wooden Spike, moving up/down first
    db !dss_id_wooden_spike
;.AE Fishin' Boo
    db !dss_id_fishing_boo
;.AF Boo Block
    db !dss_id_boo_block
;.B0 Reflecting stream of Boo Buddies
    db !dss_id_boo
;.B1 Creating/Eating block
    db !dss_id_null
;.B2 Falling Spike
    db !dss_id_falling_spike
;.B3 Bowser statue fireball
    db !dss_id_bowser_statue_flame
;.B4 Grinder, non-line-guided
    db !dss_id_grinder
;.B5 Sinking fireball used in boss battles
    db !dss_id_null
;.B6 Reflecting fireball
    db !dss_id_reflecting_fireball
;.B7 Carrot Top lift, upper right
    db !dss_id_carrot_platform
;.B8 Carrot Top lift, upper left
    db !dss_id_carrot_platform
;.B9 Info Box
    db !dss_id_null
;.BA Timed lift
    db !dss_id_timed_platform
;.BB Grey moving castle block
    db !dss_id_castle_block
;.BC Bowser statue
    db !dss_id_bowser_statue
;.BD Sliding Koopa without a shell
    db !dss_id_shelless_blue_koopa
;.BE Swooper bat
    db !dss_id_swooper_bat
;.BF Mega Mole
    db !dss_id_mega_mole
;.C0 Grey platform on lava
    db !dss_id_rock_platform
;.C1 Flying grey turnblocks
    db !dss_id_null
;.C2 Blurp fish
    db !dss_id_blurp
;.C3 Porcu-Puffer fish
    db !dss_id_porcupuffer
;.C4 Grey platform that falls
    db !dss_id_brown_platform
;.C5 Big Boo Boss
    db !dss_id_big_boo
;.C6 Dark room with spot light
    db !dss_id_disco_ball
;.C7 Invisible mushroom
    db !dss_id_null
;.C8 Light switch block for dark room
    db !dss_id_null
;.C9 Bullet Bill shooter
    db !dss_id_bullet_bill
;.CA Torpedo Launcher
    db !dss_id_torpedo_ted_hand
;.CB Eerie, generator
    db !dss_id_eerie
;.CC Para-Goomba, generator
    db !dss_id_parabobomb
;.CD Para-Bomb, generator
    db !dss_id_parabobomb
;.CE Para-Bomb and Para-Goomba, generator
    db !dss_id_parachute
;.CF Dolphin, left, generator
    db !dss_id_horizontal_dolphin
;.D0 Dolphin, right, generator
    db !dss_id_horizontal_dolphin
;.D1 Jumping fish, generator
    db !dss_id_cheep_cheep
;.D2 Turn off generator 2 (sprite E5)
    db !dss_id_null
;.D3 Super Koopa, generator
    db !dss_id_super_koopa
;.D4 Bubble with Goomba and Bob-omb, generator
    db !dss_id_bubble
;.D5 Bullet Bill, generator
    db !dss_id_bullet_bill
;.D6 Bullet Bill surrounded, generator
    db !dss_id_bullet_bill
;.D7 Bullet Bill diagonal, generator
    db !dss_id_bullet_bill
;.D8 Bowser statue fire breath, generator
    db !dss_id_null
;.D9 Turn off standard generators
    db !dss_id_null
;.DA Green Koopa shell
    db !dss_id_koopa_shell
;.DB Red Koopa shell
    db !dss_id_koopa_shell
;.DC Blue Koopa shell
    db !dss_id_koopa_shell
;.DD Yellow Koopa shell
    db !dss_id_koopa_shell
;.DE Group of 5 eeries, wave motion
    db !dss_id_eerie
;.DF Green bouncing Koopa shell
    db !dss_id_koopa_shell
;.E0 3 platforms on chains
    db !dss_id_brown_platform
;.E1 Ghost ceiling
    db !dss_id_boo
;.E2 Boo Buddies, counter clockwise
    db !dss_id_boo
;.E3 Boo Buddies, clockwise
    db !dss_id_boo
;.E4 Swooper bat ceiling
    db !dss_id_swooper_bat
;.E5 Reappearing ghost, generator 2
    db !dss_id_boo
;.E6 Candle flame background
    db !dss_id_background_flames
;.E7 Auto-Scroll, Unused?
    db !dss_id_null
;.E8 Auto-Scroll
    db !dss_id_null
;.E9 Layer 2 Smash
    db !dss_id_null
;.EA Layer 2 Scroll
    db !dss_id_null
;.EB Unused
    db !dss_id_null
;.EC Unused
    db !dss_id_null
;.ED Layer 2 Falls
    db !dss_id_null
;.EE Unused
    db !dss_id_null
;.EF Layer 2 Scroll
    db !dss_id_null
;.F0 Unused
    db !dss_id_null
;.F1 Unused
    db !dss_id_null
;.F2 Layer 2 On/Off Switch controlled
    db !dss_id_null
;.F3 Auto-Scroll level
    db !dss_id_null
;.F4 Fast BG scroll
    db !dss_id_null
;.F5 Layer 2 sink/rise
    db !dss_id_null
;.F6 Unused, fatal error
    db !dss_id_null
;.F7 Unused, fatal error
    db !dss_id_null
;.F8 Unused, fatal error
    db !dss_id_null
;.F9 Unused, fatal error
    db !dss_id_null
;.FA Unused, fatal error
    db !dss_id_null
;.FB Unused, fatal error
    db !dss_id_null
;.FC Unused, fatal error
    db !dss_id_null
;.FD Unused, fatal error
    db !dss_id_null
;.FE Unused, fatal error
    db !dss_id_null
;.FF Unused, fatal error
    db !dss_id_null

;##################################################################################################
;# Custom sprites

.custom_sprites
;.00
    db !dss_id_null
;.01
    db !dss_id_null
;.02
    db !dss_id_null
;.03
    db !dss_id_null
;.04
    db !dss_id_null
;.05
    db !dss_id_null
;.06
    db !dss_id_null
;.07
    db !dss_id_null
;.08
    db !dss_id_null
;.09
    db !dss_id_null
;.0A
    db !dss_id_null
;.0B
    db !dss_id_null
;.0C
    db !dss_id_null
;.0D
    db !dss_id_null
;.0E
    db !dss_id_null
;.0F
    db !dss_id_null
;.10
    db !dss_id_null
;.11
    db !dss_id_null
;.12
    db !dss_id_null
;.13
    db !dss_id_null
;.14
    db !dss_id_null
;.15
    db !dss_id_null
;.16
    db !dss_id_null
;.17
    db !dss_id_null
;.18
    db !dss_id_null
;.19
    db !dss_id_null
;.1A
    db !dss_id_null
;.1B
    db !dss_id_null
;.1C
    db !dss_id_null
;.1D
    db !dss_id_null
;.1E
    db !dss_id_null
;.1F
    db !dss_id_null
;.20
    db !dss_id_null
;.21
    db !dss_id_null
;.22
    db !dss_id_null
;.23
    db !dss_id_null
;.24
    db !dss_id_null
;.25
    db !dss_id_null
;.26
    db !dss_id_null
;.27
    db !dss_id_null
;.28
    db !dss_id_null
;.29
    db !dss_id_null
;.2A
    db !dss_id_null
;.2B
    db !dss_id_null
;.2C
    db !dss_id_null
;.2D
    db !dss_id_null
;.2E
    db !dss_id_null
;.2F
    db !dss_id_null
;.30
    db !dss_id_null
;.31
    db !dss_id_null
;.32
    db !dss_id_null
;.33
    db !dss_id_null
;.34
    db !dss_id_null
;.35
    db !dss_id_null
;.36
    db !dss_id_null
;.37
    db !dss_id_null
;.38
    db !dss_id_null
;.39
    db !dss_id_null
;.3A
    db !dss_id_null
;.3B
    db !dss_id_null
;.3C
    db !dss_id_null
;.3D
    db !dss_id_null
;.3E
    db !dss_id_null
;.3F
    db !dss_id_null
;.40
    db !dss_id_null
;.41
    db !dss_id_null
;.42
    db !dss_id_null
;.43
    db !dss_id_null
;.44
    db !dss_id_null
;.45
    db !dss_id_null
;.46
    db !dss_id_null
;.47
    db !dss_id_null
;.48
    db !dss_id_null
;.49
    db !dss_id_null
;.4A
    db !dss_id_null
;.4B
    db !dss_id_null
;.4C
    db !dss_id_null
;.4D
    db !dss_id_null
;.4E
    db !dss_id_null
;.4F
    db !dss_id_null
;.50
    db !dss_id_null
;.51
    db !dss_id_null
;.52
    db !dss_id_null
;.53
    db !dss_id_null
;.54
    db !dss_id_null
;.55
    db !dss_id_null
;.56
    db !dss_id_null
;.57
    db !dss_id_null
;.58
    db !dss_id_null
;.59
    db !dss_id_null
;.5A
    db !dss_id_null
;.5B
    db !dss_id_null
;.5C
    db !dss_id_null
;.5D
    db !dss_id_null
;.5E
    db !dss_id_null
;.5F
    db !dss_id_null
;.60
    db !dss_id_null
;.61
    db !dss_id_null
;.62
    db !dss_id_null
;.63
    db !dss_id_null
;.64
    db !dss_id_null
;.65
    db !dss_id_null
;.66
    db !dss_id_null
;.67
    db !dss_id_null
;.68
    db !dss_id_null
;.69
    db !dss_id_null
;.6A
    db !dss_id_null
;.6B
    db !dss_id_null
;.6C
    db !dss_id_null
;.6D
    db !dss_id_null
;.6E
    db !dss_id_null
;.6F
    db !dss_id_null
;.70
    db !dss_id_null
;.71
    db !dss_id_null
;.72
    db !dss_id_null
;.73
    db !dss_id_null
;.74
    db !dss_id_null
;.75
    db !dss_id_null
;.76
    db !dss_id_null
;.77
    db !dss_id_null
;.78
    db !dss_id_null
;.79
    db !dss_id_null
;.7A
    db !dss_id_null
;.7B
    db !dss_id_null
;.7C
    db !dss_id_null
;.7D
    db !dss_id_null
;.7E
    db !dss_id_null
;.7F
    db !dss_id_null
;.80
    db !dss_id_null
;.81
    db !dss_id_null
;.82
    db !dss_id_null
;.83
    db !dss_id_null
;.84
    db !dss_id_null
;.85
    db !dss_id_null
;.86
    db !dss_id_null
;.87
    db !dss_id_null
;.88
    db !dss_id_null
;.89
    db !dss_id_null
;.8A
    db !dss_id_null
;.8B
    db !dss_id_null
;.8C
    db !dss_id_null
;.8D
    db !dss_id_null
;.8E
    db !dss_id_null
;.8F
    db !dss_id_null
;.90
    db !dss_id_null
;.91
    db !dss_id_null
;.92
    db !dss_id_null
;.93
    db !dss_id_null
;.94
    db !dss_id_null
;.95
    db !dss_id_null
;.96
    db !dss_id_null
;.97
    db !dss_id_null
;.98
    db !dss_id_null
;.99
    db !dss_id_null
;.9A
    db !dss_id_null
;.9B
    db !dss_id_null
;.9C
    db !dss_id_null
;.9D
    db !dss_id_null
;.9E
    db !dss_id_null
;.9F
    db !dss_id_null
;.A0
    db !dss_id_null
;.A1
    db !dss_id_null
;.A2
    db !dss_id_null
;.A3
    db !dss_id_null
;.A4
    db !dss_id_null
;.A5
    db !dss_id_null
;.A6
    db !dss_id_null
;.A7
    db !dss_id_null
;.A8
    db !dss_id_null
;.A9
    db !dss_id_null
;.AA
    db !dss_id_null
;.AB
    db !dss_id_null
;.AC
    db !dss_id_null
;.AD
    db !dss_id_null
;.AE
    db !dss_id_null
;.AF
    db !dss_id_null
;.B0
    db !dss_id_null
;.B1
    db !dss_id_null
;.B2
    db !dss_id_null
;.B3
    db !dss_id_null
;.B4
    db !dss_id_null
;.B5
    db !dss_id_null
;.B6
    db !dss_id_null
;.B7
    db !dss_id_null
;.B8
    db !dss_id_null
;.B9
    db !dss_id_null
;.BA
    db !dss_id_null
;.BB
    db !dss_id_null
;.BC
    db !dss_id_null
;.BD
    db !dss_id_null
;.BE
    db !dss_id_null
;.BF
    db !dss_id_null
;.C0
    db !dss_id_null
;.C1
    db !dss_id_null
;.C2
    db !dss_id_null
;.C3
    db !dss_id_null
;.C4
    db !dss_id_null
;.C5
    db !dss_id_null
;.C6
    db !dss_id_null
;.C7
    db !dss_id_null
;.C8
    db !dss_id_null
;.C9
    db !dss_id_null
;.CA
    db !dss_id_null
;.CB
    db !dss_id_null
;.CC
    db !dss_id_null
;.CD
    db !dss_id_null
;.CE
    db !dss_id_null
;.CF
    db !dss_id_null
;.D0
    db !dss_id_null
;.D1
    db !dss_id_null
;.D2
    db !dss_id_null
;.D3
    db !dss_id_null
;.D4
    db !dss_id_null
;.D5
    db !dss_id_null
;.D6
    db !dss_id_null
;.D7
    db !dss_id_null
;.D8
    db !dss_id_null
;.D9
    db !dss_id_null
;.DA
    db !dss_id_null
;.DB
    db !dss_id_null
;.DC
    db !dss_id_null
;.DD
    db !dss_id_null
;.DE
    db !dss_id_null
;.DF
    db !dss_id_null
;.E0
    db !dss_id_null
;.E1
    db !dss_id_null
;.E2
    db !dss_id_null
;.E3
    db !dss_id_null
;.E4
    db !dss_id_null
;.E5
    db !dss_id_null
;.E6
    db !dss_id_null
;.E7
    db !dss_id_null
;.E8
    db !dss_id_null
;.E9
    db !dss_id_null
;.EA
    db !dss_id_null
;.EB
    db !dss_id_null
;.EC
    db !dss_id_null
;.ED
    db !dss_id_null
;.EE
    db !dss_id_null
;.EF
    db !dss_id_null
;.F0
    db !dss_id_null
;.F1
    db !dss_id_null
;.F2
    db !dss_id_null
;.F3
    db !dss_id_null
;.F4
    db !dss_id_null
;.F5
    db !dss_id_null
;.F6
    db !dss_id_null
;.F7
    db !dss_id_null
;.F8
    db !dss_id_null
;.F9
    db !dss_id_null
;.FA
    db !dss_id_null
;.FB
    db !dss_id_null
;.FC
    db !dss_id_null
;.FD
    db !dss_id_null
;.FE
    db !dss_id_null
;.FF
    db !dss_id_null


;##################################################################################################
;# Extended sprites

.extended_sprites
;.00 Null
    db !dss_id_null
;.01 Smoke puff
    db !dss_id_null
;.02 Reznor fireball
    db !dss_id_reznor_fireball
;.03 Hopping flame's flame
    db !dss_id_hopping_flame
;.04 Hammer
    db !dss_id_hammer_projectile
;.05 Player fireball
    db !dss_id_null
;.06 Bone
    db !dss_id_bone_projectile
;.07 Lava splash
    db !dss_id_null
;.08 Torpedo ted arm
    db !dss_id_torpedo_ted_hand
;.09 Null
    db !dss_id_null
;.0A Smiling coin
    db !dss_id_smiling_coin
;.0B Piranha plant fireball
    db !dss_id_null
;.0C Lava lotus projectile
    db !dss_id_volcano_lotus
;.0D Baseball
    db !dss_id_chuck_pitchin_puntin
;.0E Wiggler flower
    db !dss_id_misc_tiles_2
;.0F Trail of smoke
    db !dss_id_null
;.10 Spinjump stars
    db !dss_id_null
;.11 Yoshi fireballs
    db !dss_id_null
;.12 Water bubble
    db !dss_id_null
;.13
    db !dss_id_null
;.14
    db !dss_id_null
;.15
    db !dss_id_null
;.16
    db !dss_id_null
;.17
    db !dss_id_null
;.18
    db !dss_id_null
;.19
    db !dss_id_null
;.1A
    db !dss_id_null
;.1B
    db !dss_id_null
;.1C
    db !dss_id_null
;.1D
    db !dss_id_null
;.1E
    db !dss_id_null
;.1F
    db !dss_id_null
;.20
    db !dss_id_null
;.21
    db !dss_id_null
;.22
    db !dss_id_null
;.23
    db !dss_id_null
;.24
    db !dss_id_null
;.25
    db !dss_id_null
;.26
    db !dss_id_null
;.27
    db !dss_id_null
;.28
    db !dss_id_null
;.29
    db !dss_id_null
;.2A
    db !dss_id_null
;.2B
    db !dss_id_null
;.2C
    db !dss_id_null
;.2D
    db !dss_id_null
;.2E
    db !dss_id_null
;.2F
    db !dss_id_null
;.30
    db !dss_id_null
;.31
    db !dss_id_null
;.32
    db !dss_id_null
;.33
    db !dss_id_null
;.34
    db !dss_id_null
;.35
    db !dss_id_null
;.36
    db !dss_id_null
;.37
    db !dss_id_null
;.38
    db !dss_id_null
;.39
    db !dss_id_null
;.3A
    db !dss_id_null
;.3B
    db !dss_id_null
;.3C
    db !dss_id_null
;.3D
    db !dss_id_null
;.3E
    db !dss_id_null
;.3F
    db !dss_id_null
;.40
    db !dss_id_null
;.41
    db !dss_id_null
;.42
    db !dss_id_null
;.43
    db !dss_id_null
;.44
    db !dss_id_null
;.45
    db !dss_id_null
;.46
    db !dss_id_null
;.47
    db !dss_id_null
;.48
    db !dss_id_null
;.49
    db !dss_id_null
;.4A
    db !dss_id_null
;.4B
    db !dss_id_null
;.4C
    db !dss_id_null
;.4D
    db !dss_id_null
;.4E
    db !dss_id_null
;.4F
    db !dss_id_null
;.50
    db !dss_id_null
;.51
    db !dss_id_null
;.52
    db !dss_id_null
;.53
    db !dss_id_null
;.54
    db !dss_id_null
;.55
    db !dss_id_null
;.56
    db !dss_id_null
;.57
    db !dss_id_null
;.58
    db !dss_id_null
;.59
    db !dss_id_null
;.5A
    db !dss_id_null
;.5B
    db !dss_id_null
;.5C
    db !dss_id_null
;.5D
    db !dss_id_null
;.5E
    db !dss_id_null
;.5F
    db !dss_id_null
;.60
    db !dss_id_null
;.61
    db !dss_id_null
;.62
    db !dss_id_null
;.63
    db !dss_id_null
;.64
    db !dss_id_null
;.65
    db !dss_id_null
;.66
    db !dss_id_null
;.67
    db !dss_id_null
;.68
    db !dss_id_null
;.69
    db !dss_id_null
;.6A
    db !dss_id_null
;.6B
    db !dss_id_null
;.6C
    db !dss_id_null
;.6D
    db !dss_id_null
;.6E
    db !dss_id_null
;.6F
    db !dss_id_null
;.70
    db !dss_id_null
;.71
    db !dss_id_null
;.72
    db !dss_id_null
;.73
    db !dss_id_null
;.74
    db !dss_id_null
;.75
    db !dss_id_null
;.76
    db !dss_id_null
;.77
    db !dss_id_null
;.78
    db !dss_id_null
;.79
    db !dss_id_null
;.7A
    db !dss_id_null
;.7B
    db !dss_id_null
;.7C
    db !dss_id_null
;.7D
    db !dss_id_null
;.7E
    db !dss_id_null
;.7F
    db !dss_id_null
;.80
    db !dss_id_null
;.81
    db !dss_id_null
;.82
    db !dss_id_null
;.83
    db !dss_id_null
;.84
    db !dss_id_null
;.85
    db !dss_id_null
;.86
    db !dss_id_null
;.87
    db !dss_id_null
;.88
    db !dss_id_null
;.89
    db !dss_id_null
;.8A
    db !dss_id_null
;.8B
    db !dss_id_null
;.8C
    db !dss_id_null
;.8D
    db !dss_id_null
;.8E
    db !dss_id_null
;.8F
    db !dss_id_null
;.90
    db !dss_id_null
;.91
    db !dss_id_null
;.92
    db !dss_id_null
;.93
    db !dss_id_null
;.94
    db !dss_id_null
;.95
    db !dss_id_null
;.96
    db !dss_id_null
;.97
    db !dss_id_null
;.98
    db !dss_id_null
;.99
    db !dss_id_null
;.9A
    db !dss_id_null
;.9B
    db !dss_id_null
;.9C
    db !dss_id_null
;.9D
    db !dss_id_null
;.9E
    db !dss_id_null
;.9F
    db !dss_id_null
;.A0
    db !dss_id_null
;.A1
    db !dss_id_null
;.A2
    db !dss_id_null
;.A3
    db !dss_id_null
;.A4
    db !dss_id_null
;.A5
    db !dss_id_null
;.A6
    db !dss_id_null
;.A7
    db !dss_id_null
;.A8
    db !dss_id_null
;.A9
    db !dss_id_null
;.AA
    db !dss_id_null
;.AB
    db !dss_id_null
;.AC
    db !dss_id_null
;.AD
    db !dss_id_null
;.AE
    db !dss_id_null
;.AF
    db !dss_id_null
;.B0
    db !dss_id_null
;.B1
    db !dss_id_null
;.B2
    db !dss_id_null
;.B3
    db !dss_id_null
;.B4
    db !dss_id_null
;.B5
    db !dss_id_null
;.B6
    db !dss_id_null
;.B7
    db !dss_id_null
;.B8
    db !dss_id_null
;.B9
    db !dss_id_null
;.BA
    db !dss_id_null
;.BB
    db !dss_id_null
;.BC
    db !dss_id_null
;.BD
    db !dss_id_null
;.BE
    db !dss_id_null
;.BF
    db !dss_id_null
;.C0
    db !dss_id_null
;.C1
    db !dss_id_null
;.C2
    db !dss_id_null
;.C3
    db !dss_id_null
;.C4
    db !dss_id_null
;.C5
    db !dss_id_null
;.C6
    db !dss_id_null
;.C7
    db !dss_id_null
;.C8
    db !dss_id_null
;.C9
    db !dss_id_null
;.CA
    db !dss_id_null
;.CB
    db !dss_id_null
;.CC
    db !dss_id_null
;.CD
    db !dss_id_null
;.CE
    db !dss_id_null
;.CF
    db !dss_id_null
;.D0
    db !dss_id_null
;.D1
    db !dss_id_null
;.D2
    db !dss_id_null
;.D3
    db !dss_id_null
;.D4
    db !dss_id_null
;.D5
    db !dss_id_null
;.D6
    db !dss_id_null
;.D7
    db !dss_id_null
;.D8
    db !dss_id_null
;.D9
    db !dss_id_null
;.DA
    db !dss_id_null
;.DB
    db !dss_id_null
;.DC
    db !dss_id_null
;.DD
    db !dss_id_null
;.DE
    db !dss_id_null
;.DF
    db !dss_id_null
;.E0
    db !dss_id_null
;.E1
    db !dss_id_null
;.E2
    db !dss_id_null
;.E3
    db !dss_id_null
;.E4
    db !dss_id_null
;.E5
    db !dss_id_null
;.E6
    db !dss_id_null
;.E7
    db !dss_id_null
;.E8
    db !dss_id_null
;.E9
    db !dss_id_null
;.EA
    db !dss_id_null
;.EB
    db !dss_id_null
;.EC
    db !dss_id_null
;.ED
    db !dss_id_null
;.EE
    db !dss_id_null
;.EF
    db !dss_id_null
;.F0
    db !dss_id_null
;.F1
    db !dss_id_null
;.F2
    db !dss_id_null
;.F3
    db !dss_id_null
;.F4
    db !dss_id_null
;.F5
    db !dss_id_null
;.F6
    db !dss_id_null
;.F7
    db !dss_id_null
;.F8
    db !dss_id_null
;.F9
    db !dss_id_null
;.FA
    db !dss_id_null
;.FB
    db !dss_id_null
;.FC
    db !dss_id_null
;.FD
    db !dss_id_null
;.FE
    db !dss_id_null
;.FF
    db !dss_id_null


;##################################################################################################
;# Cluster sprites

.cluster_sprites
;.00 Null
    db !dss_id_null
;.01 1-Up from bonus game
    db !dss_id_null
;.02 Null
    db !dss_id_null
;.03 Boo from boo ceiling
    db !dss_id_boo
;.04 Boo from boo ring
    db !dss_id_boo
;.05 Background flame
    db !dss_id_background_flames
;.06 Fire pillar
    db !dss_id_fire_pillar
;.07 Reappearing boo
    db !dss_id_boo
;.08 Swooper bat
    db !dss_id_swooper_bat
;.09
    db !dss_id_null
;.0A
    db !dss_id_null
;.0B
    db !dss_id_null
;.0C
    db !dss_id_null
;.0D
    db !dss_id_null
;.0E
    db !dss_id_null
;.0F
    db !dss_id_null
;.10
    db !dss_id_null
;.11
    db !dss_id_null
;.12
    db !dss_id_null
;.13
    db !dss_id_null
;.14
    db !dss_id_null
;.15
    db !dss_id_null
;.16
    db !dss_id_null
;.17
    db !dss_id_null
;.18
    db !dss_id_null
;.19
    db !dss_id_null
;.1A
    db !dss_id_null
;.1B
    db !dss_id_null
;.1C
    db !dss_id_null
;.1D
    db !dss_id_null
;.1E
    db !dss_id_null
;.1F
    db !dss_id_null
;.20
    db !dss_id_null
;.21
    db !dss_id_null
;.22
    db !dss_id_null
;.23
    db !dss_id_null
;.24
    db !dss_id_null
;.25
    db !dss_id_null
;.26
    db !dss_id_null
;.27
    db !dss_id_null
;.28
    db !dss_id_null
;.29
    db !dss_id_null
;.2A
    db !dss_id_null
;.2B
    db !dss_id_null
;.2C
    db !dss_id_null
;.2D
    db !dss_id_null
;.2E
    db !dss_id_null
;.2F
    db !dss_id_null
;.30
    db !dss_id_null
;.31
    db !dss_id_null
;.32
    db !dss_id_null
;.33
    db !dss_id_null
;.34
    db !dss_id_null
;.35
    db !dss_id_null
;.36
    db !dss_id_null
;.37
    db !dss_id_null
;.38
    db !dss_id_null
;.39
    db !dss_id_null
;.3A
    db !dss_id_null
;.3B
    db !dss_id_null
;.3C
    db !dss_id_null
;.3D
    db !dss_id_null
;.3E
    db !dss_id_null
;.3F
    db !dss_id_null
;.40
    db !dss_id_null
;.41
    db !dss_id_null
;.42
    db !dss_id_null
;.43
    db !dss_id_null
;.44
    db !dss_id_null
;.45
    db !dss_id_null
;.46
    db !dss_id_null
;.47
    db !dss_id_null
;.48
    db !dss_id_null
;.49
    db !dss_id_null
;.4A
    db !dss_id_null
;.4B
    db !dss_id_null
;.4C
    db !dss_id_null
;.4D
    db !dss_id_null
;.4E
    db !dss_id_null
;.4F
    db !dss_id_null
;.50
    db !dss_id_null
;.51
    db !dss_id_null
;.52
    db !dss_id_null
;.53
    db !dss_id_null
;.54
    db !dss_id_null
;.55
    db !dss_id_null
;.56
    db !dss_id_null
;.57
    db !dss_id_null
;.58
    db !dss_id_null
;.59
    db !dss_id_null
;.5A
    db !dss_id_null
;.5B
    db !dss_id_null
;.5C
    db !dss_id_null
;.5D
    db !dss_id_null
;.5E
    db !dss_id_null
;.5F
    db !dss_id_null
;.60
    db !dss_id_null
;.61
    db !dss_id_null
;.62
    db !dss_id_null
;.63
    db !dss_id_null
;.64
    db !dss_id_null
;.65
    db !dss_id_null
;.66
    db !dss_id_null
;.67
    db !dss_id_null
;.68
    db !dss_id_null
;.69
    db !dss_id_null
;.6A
    db !dss_id_null
;.6B
    db !dss_id_null
;.6C
    db !dss_id_null
;.6D
    db !dss_id_null
;.6E
    db !dss_id_null
;.6F
    db !dss_id_null
;.70
    db !dss_id_null
;.71
    db !dss_id_null
;.72
    db !dss_id_null
;.73
    db !dss_id_null
;.74
    db !dss_id_null
;.75
    db !dss_id_null
;.76
    db !dss_id_null
;.77
    db !dss_id_null
;.78
    db !dss_id_null
;.79
    db !dss_id_null
;.7A
    db !dss_id_null
;.7B
    db !dss_id_null
;.7C
    db !dss_id_null
;.7D
    db !dss_id_null
;.7E
    db !dss_id_null
;.7F
    db !dss_id_null
;.80
    db !dss_id_null
;.81
    db !dss_id_null
;.82
    db !dss_id_null
;.83
    db !dss_id_null
;.84
    db !dss_id_null
;.85
    db !dss_id_null
;.86
    db !dss_id_null
;.87
    db !dss_id_null
;.88
    db !dss_id_null
;.89
    db !dss_id_null
;.8A
    db !dss_id_null
;.8B
    db !dss_id_null
;.8C
    db !dss_id_null
;.8D
    db !dss_id_null
;.8E
    db !dss_id_null
;.8F
    db !dss_id_null
;.90
    db !dss_id_null
;.91
    db !dss_id_null
;.92
    db !dss_id_null
;.93
    db !dss_id_null
;.94
    db !dss_id_null
;.95
    db !dss_id_null
;.96
    db !dss_id_null
;.97
    db !dss_id_null
;.98
    db !dss_id_null
;.99
    db !dss_id_null
;.9A
    db !dss_id_null
;.9B
    db !dss_id_null
;.9C
    db !dss_id_null
;.9D
    db !dss_id_null
;.9E
    db !dss_id_null
;.9F
    db !dss_id_null
;.A0
    db !dss_id_null
;.A1
    db !dss_id_null
;.A2
    db !dss_id_null
;.A3
    db !dss_id_null
;.A4
    db !dss_id_null
;.A5
    db !dss_id_null
;.A6
    db !dss_id_null
;.A7
    db !dss_id_null
;.A8
    db !dss_id_null
;.A9
    db !dss_id_null
;.AA
    db !dss_id_null
;.AB
    db !dss_id_null
;.AC
    db !dss_id_null
;.AD
    db !dss_id_null
;.AE
    db !dss_id_null
;.AF
    db !dss_id_null
;.B0
    db !dss_id_null
;.B1
    db !dss_id_null
;.B2
    db !dss_id_null
;.B3
    db !dss_id_null
;.B4
    db !dss_id_null
;.B5
    db !dss_id_null
;.B6
    db !dss_id_null
;.B7
    db !dss_id_null
;.B8
    db !dss_id_null
;.B9
    db !dss_id_null
;.BA
    db !dss_id_null
;.BB
    db !dss_id_null
;.BC
    db !dss_id_null
;.BD
    db !dss_id_null
;.BE
    db !dss_id_null
;.BF
    db !dss_id_null
;.C0
    db !dss_id_null
;.C1
    db !dss_id_null
;.C2
    db !dss_id_null
;.C3
    db !dss_id_null
;.C4
    db !dss_id_null
;.C5
    db !dss_id_null
;.C6
    db !dss_id_null
;.C7
    db !dss_id_null
;.C8
    db !dss_id_null
;.C9
    db !dss_id_null
;.CA
    db !dss_id_null
;.CB
    db !dss_id_null
;.CC
    db !dss_id_null
;.CD
    db !dss_id_null
;.CE
    db !dss_id_null
;.CF
    db !dss_id_null
;.D0
    db !dss_id_null
;.D1
    db !dss_id_null
;.D2
    db !dss_id_null
;.D3
    db !dss_id_null
;.D4
    db !dss_id_null
;.D5
    db !dss_id_null
;.D6
    db !dss_id_null
;.D7
    db !dss_id_null
;.D8
    db !dss_id_null
;.D9
    db !dss_id_null
;.DA
    db !dss_id_null
;.DB
    db !dss_id_null
;.DC
    db !dss_id_null
;.DD
    db !dss_id_null
;.DE
    db !dss_id_null
;.DF
    db !dss_id_null
;.E0
    db !dss_id_null
;.E1
    db !dss_id_null
;.E2
    db !dss_id_null
;.E3
    db !dss_id_null
;.E4
    db !dss_id_null
;.E5
    db !dss_id_null
;.E6
    db !dss_id_null
;.E7
    db !dss_id_null
;.E8
    db !dss_id_null
;.E9
    db !dss_id_null
;.EA
    db !dss_id_null
;.EB
    db !dss_id_null
;.EC
    db !dss_id_null
;.ED
    db !dss_id_null
;.EE
    db !dss_id_null
;.EF
    db !dss_id_null
;.F0
    db !dss_id_null
;.F1
    db !dss_id_null
;.F2
    db !dss_id_null
;.F3
    db !dss_id_null
;.F4
    db !dss_id_null
;.F5
    db !dss_id_null
;.F6
    db !dss_id_null
;.F7
    db !dss_id_null
;.F8
    db !dss_id_null
;.F9
    db !dss_id_null
;.FA
    db !dss_id_null
;.FB
    db !dss_id_null
;.FC
    db !dss_id_null
;.FD
    db !dss_id_null
;.FE
    db !dss_id_null
;.FF
    db !dss_id_null