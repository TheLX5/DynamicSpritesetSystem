pushpc

    org $01B710
        turn_block_bridge_init_hijack:
            lda #!dss_id_turn_block
            jsl find_and_queue_gfx
            bcs .loaded
            rts 
        .loaded 
            jsr GetDrawInfoBnk1
            jml turn_block_bridge_init
        warnpc $01B720
    org $01B720
        turn_block_bridge_init_end:

    org $01B77B
        turn_block_bridge_write:
            lda.l !dss_tile_buffer
    
    org $01B79D
        turn_block_bridge_flipped_fix:
            db $20

    org $01B78F
        turn_block_bridge_props:
            db $04


pullpc 

    turn_block_bridge_init:
        stz $00
        stz $01
        stz $02
        stz $03
        lda $64
        ora #$01
        sta $04
        lda !C2,x
        and #$02
        tay 
        jml turn_block_bridge_init_end