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


;################################################
;# Include defines

    sa1rom

    incsrc "sa1_defs.asm"
    incsrc "dynamic_spritesets_defines.asm"

;################################################
;# Insert asm

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

    !pass = 0

    while !pass < 2
        if !pass == 1
            freecode
            incsrc "shared_routines.asm"
            incsrc "exgfx_lenght.asm"
            incsrc "exgfx_ids.asm"
        endif

        incsrc "tweaker.asm"
        incsrc "garbage_collector.asm"
        
        incsrc "original_sprites/generators.asm"
        incsrc "original_sprites/shared_gfx_routines.asm"
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

        !pass #= !pass+1

    endif

;################################################
;# Print data

    print "Dynamic Spritesets auxiliary patch"
    print "Version 0.0.1"
    print "by lx5"
    print ""
    print "Freespace used: ", freespaceuse," bytes."

if !pass == 0

    print ""
    print " ################################ RAM INFO ################################ "
    print ""
    print "\!dss_map                     = $", hex(!dss_map)
    print "\!dss_list                    = $", hex(!dss_list)
    print "\!dss_gfx_size                = $", hex(!dss_gfx_size)
    print "\!dss_list_usage              = $", hex(!dss_list_usage)
    print "\!dss_tile_buffer             = $", hex(!dss_tile_buffer)
    print "\!dss_tile_buffer_complete    = $", hex(!dss_tile_buffer_complete)
    print "\!dss_ram_buffer_index        = $", hex(!dss_ram_buffer_index)
    print "\!dss_maximum_tiles           = $", hex(!dss_maximum_tiles)
    print "\!dss_loaded_tiles            = $", hex(!dss_loaded_tiles)
    print "\!dss_gfx_queue               = $", hex(!dss_gfx_queue)
    print "\!dss_gfx_queue_index_nmi     = $", hex(!dss_gfx_queue_index_nmi)
    print "\!dss_gfx_queue_index_game    = $", hex(!dss_gfx_queue_index_game)
    print "\!dss_vram_dest               = $", hex(!dss_vram_dest)
    print ""
    print " ################################ ROUTINE INFO ################################ "
    print ""
    print "find_and_queue_gfx           = $", hex(find_and_queue_gfx)
    print ""
    print " ################################ ASM HACKS INFO ################################ "
    print ""
    print "garbage_collector            = $", hex(garbage_collector)
    print ""

endif