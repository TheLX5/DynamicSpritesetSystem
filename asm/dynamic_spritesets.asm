;#########################################################################
;# Dynamic Spritesets auxiliary patch
;# Version 0.0.1
;# by lx5
;#
;# This file has everything needed for the original sprites to properly
;# make use of the dynamic spriteset system
;#
;# TO DO:
;#  - Use MaxTile API directly instead of working with the OAM mirror for
;#    proper priorities between sprites
;#  - Make most of SMW sprites use DSS natively


;################################################
;# Ensure SA-1 only compatibility

    sa1rom

    assert read1($00FFD5) == $23,"This patch only works on ROMs with SA-1 Pack!"

;################################################
;# Include defines

    incsrc "sa1_defs.asm"
    incsrc "dynamic_spritesets_defines.asm"

;################################################
;# Common locations in ROM
;# Used to call routines directly instead of writing raw addresses

    org $02D378
        GetDrawInfoBnk2:

    org $03B760
        GetDrawInfoBnk3:

    org $01A365
        GetDrawInfoBnk1:

    org $019F09
        SubSprGfx2Entry0:

    org $019F0D
        SubSprGfx2Entry1:

    org $01857C
        FaceMario:

    org $01B7BB
        FinishOAMWriteRt:

    org $01B7B3
        FinishOAMWrite:

    org $03C000
        GenTileFromSpr2:

    org $01E700
        SmushedGfxRt:
    
;################################################
;# Search freespace

    freecode

;################################################
;# Includes main files

        incsrc "garbage_collector.asm"
        incsrc "exgfx_lenght.asm"
        incsrc "exgfx_ids.asm"
        incsrc "tweaker.asm"
        incsrc "remaps.asm"
        incsrc "shared_routines.asm"

;################################################
;# Includes edits SMW's sprites

        incsrc "original_sprites/smoke_sprites.asm"
        incsrc "original_sprites/generators.asm"
        incsrc "original_sprites/shared_gfx_routines.asm"
        incsrc "original_sprites/smushed_sprites.asm"
        incsrc "original_sprites/powerups.asm"
        incsrc "original_sprites/key.asm"
        incsrc "original_sprites/keyhole.asm"
        incsrc "original_sprites/goal_tape.asm"
        incsrc "original_sprites/yoshi_egg.asm"
        incsrc "original_sprites/info_box.asm"
        incsrc "original_sprites/p_switch.asm"
        incsrc "original_sprites/growing_vine.asm"
        incsrc "original_sprites/rex.asm"
        incsrc "original_sprites/pipe_lakitu.asm"
        incsrc "original_sprites/bullet_bills.asm"
        incsrc "original_sprites/cheep_cheep.asm"
        incsrc "original_sprites/lakitu.asm"
        incsrc "original_sprites/sliding_koopa.asm"
        incsrc "original_sprites/hopping_flame.asm"
        incsrc "original_sprites/net_koopa.asm"
        incsrc "original_sprites/thwomp.asm"
        incsrc "original_sprites/banzai_bill.asm"
        incsrc "original_sprites/dry_bones_bony_beetle.asm"
        incsrc "original_sprites/magikoopa.asm"
        incsrc "original_sprites/ball_n_chain.asm"
        incsrc "original_sprites/grinder.asm"
        incsrc "original_sprites/bowser_statue.asm"
        incsrc "original_sprites/hothead.asm"
        incsrc "original_sprites/sparky.asm"
        incsrc "original_sprites/fishbone.asm"
        incsrc "original_sprites/falling_spike.asm"
        incsrc "original_sprites/castle_block.asm"
        incsrc "original_sprites/reflecting_fireball.asm"
        incsrc "original_sprites/podoboo.asm"
        incsrc "original_sprites/climbing_net.asm"
        incsrc "original_sprites/candle_flames.asm"
        incsrc "original_sprites/rotating_gray_platform.asm"
        incsrc "original_sprites/wooden_spike.asm"
        incsrc "original_sprites/rip_van_fish.asm"
        incsrc "original_sprites/dolphins.asm"
        incsrc "original_sprites/blurp.asm"
        incsrc "original_sprites/urchin.asm"
        incsrc "original_sprites/torpedo_ted.asm"
        incsrc "original_sprites/porcupuffer.asm"
        incsrc "original_sprites/chucks.asm"
        incsrc "original_sprites/wiggler.asm"
        incsrc "original_sprites/growing_pipe.asm"
        incsrc "original_sprites/bubble.asm"
        incsrc "original_sprites/pokey.asm"
        incsrc "original_sprites/volcano_lotus.asm"
        incsrc "original_sprites/super_koopa.asm"
        incsrc "original_sprites/sumo_bro.asm"
        incsrc "original_sprites/carrot_lift.asm"
        incsrc "original_sprites/timed_lift.asm"
        incsrc "original_sprites/mega_mole.asm"
        incsrc "original_sprites/moving_hole.asm"
        incsrc "original_sprites/boo_block.asm"
        incsrc "original_sprites/big_boo.asm"
        incsrc "original_sprites/fishin_boo.asm"
        incsrc "original_sprites/gas_bubble.asm"
        incsrc "original_sprites/boo_buddies.asm"
        incsrc "original_sprites/boo_stream.asm"
        incsrc "original_sprites/dinos.asm"
        incsrc "original_sprites/hammer_bro.asm"
        incsrc "original_sprites/coin_game_cloud.asm"

;################################################
;# Print info

    print "Dynamic Spritesets auxiliary patch"
    print "Version 0.0.1"
    print "by lx5"
    print ""
    print "Bytes modified: ", bytes," bytes."
    print "Freespace used: ", freespaceuse," bytes."