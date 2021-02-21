pushpc
    org $02BE58
        sparky_write_hijack:
            ldy !15EA,x
            lda #!dss_id_sparky
            jsl find_and_queue_gfx
            bcs .loaded
            lda #$F0
            sta $0301|!addr,y
            rts
        .loaded
            lda.l !dss_tile_buffer+$00
            sta $0302|!addr,y
            lda $14
            and #$0C
            asl #4
            eor $0303|!addr,y
            sta $0303|!addr,y
            rts
        warnpc $02BE8C
pullpc