;#########################################################################
;# Dynamic Spritesets auxiliary patch
;# Version 0.0.1
;# by lx5
;#
;# This file has everything needed for the original sprites to properly
;# make use of the dynamic spriteset system
;#

;################################################
;# Ensure SA-1 only compatibility

    sa1rom

    assert read1($00FFD5) == $23,"This patch only works on ROMs with SA-1 Pack!"

;################################################
;# Include defines

    incsrc "../dss/sa1_defs.asm"
    incsrc "../ExtraDefines/dynamic_spritesets_defines.asm"

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

        incsrc "../dss/garbage_collector.asm"
        incsrc "../dss/exgfx_lenght.asm"
        incsrc "../dss/exgfx_ids.asm"
        incsrc "../dss/tweaker.asm"
        incsrc "../dss/remaps.asm"
        incsrc "../dss/shared_routines.asm"

;################################################
;# Includes edits SMW's sprites

        incsrc "../dss/original_sprites/smoke_sprites.asm"
        incsrc "../dss/original_sprites/generators.asm"
        incsrc "../dss/original_sprites/shared_gfx_routines.asm"
        incsrc "../dss/original_sprites/smushed_sprites.asm"
        incsrc "../dss/original_sprites/powerups.asm"
        incsrc "../dss/original_sprites/key.asm"
        incsrc "../dss/original_sprites/keyhole.asm"
        incsrc "../dss/original_sprites/goal_tape.asm"
        incsrc "../dss/original_sprites/yoshi_egg.asm"
        incsrc "../dss/original_sprites/info_box.asm"
        incsrc "../dss/original_sprites/p_switch.asm"
        incsrc "../dss/original_sprites/growing_vine.asm"
        incsrc "../dss/original_sprites/piranha_plants.asm"
        incsrc "../dss/original_sprites/rex.asm"
        incsrc "../dss/original_sprites/pipe_lakitu.asm"
        incsrc "../dss/original_sprites/bullet_bills.asm"
        incsrc "../dss/original_sprites/cheep_cheep.asm"
        incsrc "../dss/original_sprites/lakitu.asm"
        incsrc "../dss/original_sprites/sliding_koopa.asm"
        incsrc "../dss/original_sprites/hopping_flame.asm"
        incsrc "../dss/original_sprites/net_koopa.asm"
        incsrc "../dss/original_sprites/thwomp.asm"
        incsrc "../dss/original_sprites/banzai_bill.asm"
        incsrc "../dss/original_sprites/dry_bones_bony_beetle.asm"
        incsrc "../dss/original_sprites/magikoopa.asm"
        incsrc "../dss/original_sprites/ball_n_chain.asm"
        incsrc "../dss/original_sprites/grinder.asm"
        incsrc "../dss/original_sprites/bowser_statue.asm"
        incsrc "../dss/original_sprites/hothead.asm"
        incsrc "../dss/original_sprites/sparky.asm"
        incsrc "../dss/original_sprites/fishbone.asm"
        incsrc "../dss/original_sprites/falling_spike.asm"
        incsrc "../dss/original_sprites/castle_block.asm"
        incsrc "../dss/original_sprites/reflecting_fireball.asm"
        incsrc "../dss/original_sprites/podoboo.asm"
        incsrc "../dss/original_sprites/climbing_net.asm"
        incsrc "../dss/original_sprites/candle_flames.asm"
        incsrc "../dss/original_sprites/rotating_gray_platform.asm"
        incsrc "../dss/original_sprites/wooden_spike.asm"
        incsrc "../dss/original_sprites/rip_van_fish.asm"
        incsrc "../dss/original_sprites/dolphins.asm"
        incsrc "../dss/original_sprites/blurp.asm"
        incsrc "../dss/original_sprites/urchin.asm"
        incsrc "../dss/original_sprites/torpedo_ted.asm"
        incsrc "../dss/original_sprites/porcupuffer.asm"
        incsrc "../dss/original_sprites/chucks.asm"
        incsrc "../dss/original_sprites/wiggler.asm"
        incsrc "../dss/original_sprites/growing_pipe.asm"
        incsrc "../dss/original_sprites/bubble.asm"
        incsrc "../dss/original_sprites/pokey.asm"
        incsrc "../dss/original_sprites/volcano_lotus.asm"
        incsrc "../dss/original_sprites/super_koopa.asm"
        incsrc "../dss/original_sprites/sumo_bro.asm"
        incsrc "../dss/original_sprites/carrot_lift.asm"
        incsrc "../dss/original_sprites/timed_lift.asm"
        incsrc "../dss/original_sprites/mega_mole.asm"
        incsrc "../dss/original_sprites/moving_hole.asm"
        incsrc "../dss/original_sprites/boo_block.asm"
        incsrc "../dss/original_sprites/big_boo.asm"
        incsrc "../dss/original_sprites/fishin_boo.asm"
        incsrc "../dss/original_sprites/gas_bubble.asm"
        incsrc "../dss/original_sprites/boo_buddies.asm"
        incsrc "../dss/original_sprites/boo_stream.asm"
        incsrc "../dss/original_sprites/dinos.asm"
        incsrc "../dss/original_sprites/hammer_bro.asm"
        incsrc "../dss/original_sprites/coin_game_cloud.asm"
        incsrc "../dss/original_sprites/platforms.asm"
        incsrc "../dss/original_sprites/floating_skulls.asm"
        incsrc "../dss/original_sprites/swooper_bat.asm"
        incsrc "../dss/original_sprites/rope_mechanism.asm"
        incsrc "../dss/original_sprites/chainsaw.asm"
        incsrc "../dss/original_sprites/fuzzy.asm"
        incsrc "../dss/original_sprites/mechakoopa.asm"
        incsrc "../dss/original_sprites/floating_spike_ball.asm"
        incsrc "../dss/original_sprites/blargg.asm"
        incsrc "../dss/original_sprites/spotlight.asm"
        incsrc "../dss/original_sprites/item_box.asm"
        incsrc "../dss/original_sprites/bowling_ball.asm"