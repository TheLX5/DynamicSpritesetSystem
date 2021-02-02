includeonce

;#########################################################################
;# Customization defines

;# Starting ExGFX ID for the dynamic spritesets
    !dss_exgfx = $0D00

;# How many tiles from the queue will be uploaded per frame
    !dss_queue_tiles = 6

;# 
    !dss_time_to_unmark_gfx = 16

;# Main RAM defines
;# Requires at least 1541 (0x605) bytes of consecutive free RAM
;# or you could edit the defines below to make some of them not consecutive
    !dss_ram = $404000

;####################################################################
;# RAM defines

;# Map of used 16x16 tiles in SP3-SP4.
;# Each entry has an 8-bit ID, useful to quickly compare data
;# 64 bytes
    !dss_map #= !dss_ram

;# List of loaded GFX files
;# FF = Invalid GFX
;# 32 bytes
    !dss_list #= !dss_map+64

;# Timer to mark as unused each GFX file
;# Each GFX is marked as unused after 4 frames of being unused
;# This is customizable in a global basis
    !dss_list_timer #= !dss_list+32

;# Amount of tiles used by each loaded GFX
;# 32 bytes
    !dss_gfx_size #= !dss_list_timer+32

;# ExGFX usage map
;# How many times was each GFX searched within a frame
;# 32 bytes
    !dss_list_usage #= !dss_gfx_size+32

;# Array containing tile number for the latest loaded/searched ExGFX file
;# 32 bytes
    !dss_tile_buffer #= !dss_list_usage+32

;# Array of arrays containing tile numbers for each GFX loaded
;# 1024 bytes
    !dss_tile_buffer_complete #= !dss_tile_buffer+32

;# Buffer index
;# 1 byte
    !dss_ram_buffer_index #= !dss_tile_buffer_complete+1024

    !dss_maximum_tiles #= !dss_ram_buffer_index+1
    !dss_loaded_tiles #= !dss_maximum_tiles+1

;# Queue of pending graphics to be uploaded to VRAM
;# The values are supposed to be VRAM locations for each 16x16 tile needed to be uploaded to VRAM
;# Up to 64 tiles can be put in queue, but only a certain amount will be uploaded each frame which
;# is determined by !dss_queue_tiles
;# Format:
;#      Byte 1-2: VRAM destination
;#      Byte 3-4: RAM GFX buffer location
;# 256 bytes
    !dss_gfx_queue #= !dss_loaded_tiles+1
    !dss_gfx_queue_vram #= !dss_gfx_queue
    !dss_gfx_queue_ram #= !dss_gfx_queue+2

;# Index for the GFX upload queue. 
    !dss_gfx_queue_index_nmi #= !dss_gfx_queue+256
    !dss_gfx_queue_index_game #= !dss_gfx_queue_index_nmi+2

;# Map of possible VRAM destinations for sprite tiles
;# FF is treated as invalid.
;# 64 bytes
    !dss_vram_dest #= !dss_gfx_queue_index_game+2

;# 16-bit table which contains the last queue index written to for the current
;# GFX.
;# 64 bytes
    !dss_list_queue_index = !dss_vram_dest+64

;# List of flags for each item in the GFX list to determine wheter the GFX has been loaded
;# or not
;# 32 bytes
    !dss_list_gfx_loaded = !dss_list_queue_index+64

;# Copy of the regular sprite number table ($9E)
;# 22 bytes
    !dss_regular_sprite_copy = !dss_list_gfx_loaded+64

;# Copy of the custom sprite number table ($7FAB10)
;# 22 bytes
    !dss_custom_sprite_copy = !dss_regular_sprite_copy+22

;# Copy of the extended sprite number table ($170B)
;# 10 bytes
    !dss_extended_sprite_copy = !dss_custom_sprite_copy+22

;# Copy of the cluster sprite table ($1892)
;# 20 bytes
    !dss_cluster_sprite_copy = !dss_extended_sprite_copy+10

;####################################################################
;# Spriteset defines

    !dss_id_koopa                   ?= $00
    !dss_id_koopa_shell             ?= $01
    !dss_id_shelless_koopa          ?= $02
    !dss_id_shelless_blue_koopa     ?= $03
    !dss_id_goomba                  ?= $04
    !dss_id_piranha_plant           ?= $05
    !dss_id_misc_tiles_1            ?= $06
    !dss_id_cheep_cheep             ?= $07
    !dss_id_spiny                   ?= $08
    !dss_id_lakitu                  ?= $09
    !dss_id_misc_tiles_2            ?= $0A
    !dss_id_bobomb                  ?= $0B
    !dss_id_bubble                  ?= $0C
    !dss_id_wiggler                 ?= $0D
    !dss_id_paragoomba              ?= $0E
    !dss_id_parabobomb              ?= $0F
    !dss_id_parachute               ?= $10
    !dss_id_football                ?= $11
    !dss_id_bullet_bill             ?= $12
    !dss_id_buzzy_beetle            ?= $13
    !dss_id_hopping_flame           ?= $14
    !dss_id_vertical_growing_pipe   ?= $15
    !dss_id_spike_top               ?= $16
    !dss_id_swooper_bat             ?= $17
    !dss_id_blarrg                  ?= $18
    !dss_id_floating_skull          ?= $19
    !dss_id_piranha_plant_stem      ?= $1A
    !dss_id_ninji                   ?= $1B
    !dss_id_mega_mole               ?= $1C
    !dss_id_banzai_bill             ?= $1D
    !dss_id_volcano_lotus           ?= $1E
    !dss_id_pokey                   ?= $1F
    !dss_id_rex                     ?= $20
    !dss_id_monty_mole              ?= $21
    !dss_id_sumo_bro                ?= $22
    !dss_id_sumo_bro_lightning      ?= $23
    !dss_id_fire_pillar             ?= $24
    !dss_id_bony_beetle             ?= $25
    !dss_id_dry_bones               ?= $26
    !dss_id_bones                   ?= $27
    !dss_id_bone_projectile         ?= $28
    !dss_id_fishbone                ?= $29
    !dss_id_thwomp                  ?= $2A
    !dss_id_thwimp                  ?= $2B
    !dss_id_magikoopa               ?= $2C
    !dss_id_magikoopa_magic         ?= $2D
    !dss_id_ball_n_chain            ?= $2E
    !dss_id_castle_block            ?= $2F
    !dss_id_net_koopa               ?= $30
    !dss_id_hothead                 ?= $31
    !dss_id_sparky                  ?= $32
    !dss_id_climbing_net            ?= $33
    !dss_id_grinder                 ?= $34
    !dss_id_wooden_spike            ?= $35
    !dss_id_bowser_statue           ?= $36
    !dss_id_bowser_statue_flame     ?= $37
    !dss_id_reflecting_fireball     ?= $38
    !dss_id_background_flames       ?= $39
    !dss_id_falling_spike           ?= $3A
    !dss_id_eerie                   ?= $3B
    !dss_id_boo                     ?= $3C
    !dss_id_boo_block               ?= $3D
    !dss_id_big_boo                 ?= $3E
    !dss_id_fishing_boo             ?= $3F
    !dss_id_chuck_head              ?= $40
    !dss_id_chuck_body              ?= $41
    !dss_id_chuck_pitchin_puntin    ?= $42
    !dss_id_chuck_diggin            ?= $43
    !dss_id_chuck_rock              ?= $44
    !dss_id_motor                   ?= $45
    !dss_id_chainsaw                ?= $46
    !dss_id_rope                    ?= $47
    !dss_id_fuzzy                   ?= $48
    !dss_id_blurp                   ?= $49
    !dss_id_rip_van_fish            ?= $4A
    !dss_id_horizontal_dolphin      ?= $4B
    !dss_id_vertical_dolphin        ?= $4C
    !dss_id_torpedo_ted             ?= $4D
    !dss_id_torpedo_ted_hand        ?= $4E
    !dss_id_urchin                  ?= $4F
    !dss_id_porcupuffer             ?= $50
    !dss_id_super_koopa             ?= $51
    !dss_id_mushroom_scale          ?= $52
    !dss_id_rock_platform           ?= $53
    !dss_id_orange_platform         ?= $54
    !dss_id_spiky_balls             ?= $55
    !dss_id_goal_question_sphere    ?= $56
    !dss_id_springboard             ?= $57
    !dss_id_disco_ball              ?= $58
    !dss_id_hammer_bro              ?= $59
    !dss_id_hammer_projectile       ?= $5A
    !dss_id_carrot_platform         ?= $5B
    !dss_id_timed_platform          ?= $5C
    !dss_id_dino_rhino              ?= $5D
    !dss_id_dino_torch              ?= $5E
    !dss_id_dino_fire               ?= $5F
    !dss_id_mechakoopa              ?= $60
    !dss_id_bowling_ball            ?= $61
    !dss_id_brown_platform          ?= $62
    !dss_id_brown_platform_chain    ?= $63
    !dss_id_smiling_coin            ?= $64
    !dss_id_checkerboard_platform   ?= $65
    !dss_id_reznor                  ?= $66
    !dss_id_yoshi_eggs              ?= $67
    !dss_id_ludwig_fireball         ?= $68
    !dss_id_reznor_fireball         ?= $69
    !dss_id_balls                   ?= $6A
    !dss_id_reznor_platform         ?= $6B
    !dss_id_podoboo                 ?= $6C
    !dss_id_gas_bubble              ?= $6D
    !dss_id_moving_hole             ?= $6E
    !dss_id_            ?= $6F
    !dss_id_            ?= $70
    !dss_id_            ?= $71
    !dss_id_            ?= $72
    !dss_id_            ?= $73
    !dss_id_            ?= $74
    !dss_id_            ?= $75
    !dss_id_            ?= $76
    !dss_id_            ?= $77
    !dss_id_            ?= $78
    !dss_id_            ?= $79
    !dss_id_            ?= $7A
    !dss_id_            ?= $7B
    !dss_id_            ?= $7C
    !dss_id_            ?= $7D
    !dss_id_            ?= $7E
    !dss_id_            ?= $7F
    !dss_id_            ?= $80
    !dss_id_            ?= $81
    !dss_id_            ?= $82
    !dss_id_            ?= $83
    !dss_id_            ?= $84
    !dss_id_            ?= $85
    !dss_id_            ?= $86
    !dss_id_            ?= $87
    !dss_id_            ?= $88
    !dss_id_            ?= $89
    !dss_id_            ?= $8A
    !dss_id_            ?= $8B
    !dss_id_            ?= $8C
    !dss_id_            ?= $8D
    !dss_id_            ?= $8E
    !dss_id_            ?= $8F
    !dss_id_            ?= $90
    !dss_id_            ?= $91
    !dss_id_            ?= $92
    !dss_id_            ?= $93
    !dss_id_            ?= $94
    !dss_id_            ?= $95
    !dss_id_            ?= $96
    !dss_id_            ?= $97
    !dss_id_            ?= $98
    !dss_id_            ?= $99
    !dss_id_            ?= $9A
    !dss_id_            ?= $9B
    !dss_id_            ?= $9C
    !dss_id_            ?= $9D
    !dss_id_            ?= $9E
    !dss_id_            ?= $9F
    !dss_id_            ?= $A0
    !dss_id_            ?= $A1
    !dss_id_            ?= $A2
    !dss_id_            ?= $A3
    !dss_id_            ?= $A4
    !dss_id_            ?= $A5
    !dss_id_            ?= $A6
    !dss_id_            ?= $A7
    !dss_id_            ?= $A8
    !dss_id_            ?= $A9
    !dss_id_            ?= $AA
    !dss_id_            ?= $AB
    !dss_id_            ?= $AC
    !dss_id_            ?= $AD
    !dss_id_            ?= $AE
    !dss_id_            ?= $AF
    !dss_id_            ?= $B0
    !dss_id_            ?= $B1
    !dss_id_            ?= $B2
    !dss_id_            ?= $B3
    !dss_id_            ?= $B4
    !dss_id_            ?= $B5
    !dss_id_            ?= $B6
    !dss_id_            ?= $B7
    !dss_id_            ?= $B8
    !dss_id_            ?= $B9
    !dss_id_            ?= $BA
    !dss_id_            ?= $BB
    !dss_id_            ?= $BC
    !dss_id_            ?= $BD
    !dss_id_            ?= $BE
    !dss_id_            ?= $BF
    !dss_id_            ?= $C0
    !dss_id_            ?= $C1
    !dss_id_            ?= $C2
    !dss_id_            ?= $C3
    !dss_id_            ?= $C4
    !dss_id_            ?= $C5
    !dss_id_            ?= $C6
    !dss_id_            ?= $C7
    !dss_id_            ?= $C8
    !dss_id_            ?= $C9
    !dss_id_            ?= $CA
    !dss_id_            ?= $CB
    !dss_id_            ?= $CC
    !dss_id_            ?= $CD
    !dss_id_            ?= $CE
    !dss_id_            ?= $CF
    !dss_id_            ?= $D0
    !dss_id_            ?= $D1
    !dss_id_            ?= $D2
    !dss_id_            ?= $D3
    !dss_id_            ?= $D4
    !dss_id_            ?= $D5
    !dss_id_            ?= $D6
    !dss_id_            ?= $D7
    !dss_id_            ?= $D8
    !dss_id_            ?= $D9
    !dss_id_            ?= $DA
    !dss_id_            ?= $DB
    !dss_id_            ?= $DC
    !dss_id_            ?= $DD
    !dss_id_            ?= $DE
    !dss_id_            ?= $DF
    !dss_id_            ?= $E0
    !dss_id_            ?= $E1
    !dss_id_            ?= $E2
    !dss_id_            ?= $E3
    !dss_id_            ?= $E4
    !dss_id_            ?= $E5
    !dss_id_            ?= $E6
    !dss_id_            ?= $E7
    !dss_id_            ?= $E8
    !dss_id_            ?= $E9
    !dss_id_            ?= $EA
    !dss_id_            ?= $EB
    !dss_id_            ?= $EC
    !dss_id_            ?= $ED
    !dss_id_            ?= $EE
    !dss_id_            ?= $EF
    !dss_id_            ?= $F0
    !dss_id_            ?= $F1
    !dss_id_            ?= $F2
    !dss_id_            ?= $F3
    !dss_id_            ?= $F4
    !dss_id_            ?= $F5
    !dss_id_            ?= $F6
    !dss_id_            ?= $F7
    !dss_id_            ?= $F8
    !dss_id_            ?= $F9
    !dss_id_            ?= $FA
    !dss_id_            ?= $FB
    !dss_id_            ?= $FC
    !dss_id_            ?= $FD
    !dss_id_            ?= $FE
    !dss_id_null            ?= $FF










