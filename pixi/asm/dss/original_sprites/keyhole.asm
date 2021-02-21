pushpc
    org $01E23A
        keyhole_write_hijack:
            lda #!dss_id_keyhole
            jsl find_and_queue_gfx
            bcs .loaded
            rts
        .loaded
            jsr GetDrawInfoBnk1
            lda $00
            sta $0300|!addr,y
            sta $0304|!addr,y
            lda $01
            sta $0301|!addr,y
            clc 
            adc #$08
            jsl keyhole_write
            lda #$31
            sta $0303|!addr,y
            sta $0307|!addr,y
            ldy #$00
            lda #$01
            jsr FinishOAMWriteRt
            rts
        warnpc $01E26A
pullpc

    keyhole_write:
        sta $0305|!addr,y
        lda !dss_tile_buffer
        sta $0302|!addr,y
        clc
        adc #$10
        sta $0306|!addr,y
        rtl