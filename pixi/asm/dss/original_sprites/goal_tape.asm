pushpc
    org $01C132
        goal_tape_write_hijack:
            lda #!dss_id_goal_tape
            jsl find_and_queue_gfx
            bcs .loaded
            rts
        .loaded
            jsr GetDrawInfoBnk1
            lda $00
            sta $0304|!addr,y
            sec 
            sbc #$08
            sta $0300|!addr,y
            clc
            adc #$10
            sta $0308|!addr,y
            lda $01
            clc
            adc #$08
            sta $0301|!addr,y
            sta $0305|!addr,y
            sta $0309|!addr,y
            jsl goal_tape_write
            lda #$33
            sta $0303|!addr,y
            sta $0307|!addr,y
            sta $030B|!addr,y
            ldy #$00
            lda #$02
            jmp FinishOAMWriteRt
        warnpc $01C175
pullpc

    goal_tape_write:    
        lda.l !dss_tile_buffer
        sta $0302|!addr,y
        inc
        sta $0306|!addr,y
        sta $030A|!addr,y
        rtl