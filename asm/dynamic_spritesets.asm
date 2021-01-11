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

        !pass #= !pass+1

    endif

;################################################
;# Print data

    print "Dynamic Spritesets auxiliary patch"
    print "Version 0.0.1"
    print "by lx5"
    print ""
    print "Freespace used: ", freespaceuse," bytes."

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