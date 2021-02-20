
pushpc
    org $02D5E4
        banzai_bill_gfx_routine:
            jsr GetDrawInfoBnk2
            lda #!dss_id_banzai_bill
            jsl find_and_queue_gfx
            bcs .loaded
            rts
        .loaded
            phx
            ldx #$0F
        .loop
            lda $00
            clc
            adc.w $D5A4,x
            sta $0300|!addr,y
            jsl banzai_bill_gfx_routine_aux
            dex 
            bpl .loop
            plx
            ldy #$02
            lda #$0F
            jmp $B7A7

        basic_configuration:
            dl !dss_ram                         ; this section gets read by other resources
            dw !dss_exgfx                       ; to grab useful info about this patch
            db !dss_queue_tiles
            db !dss_time_to_unmark_gfx
            
        warnpc $02D617

    org $02D5C4
        banzai_bill_tiles:
            db $00,$01,$02,$03
            db $04,$07,$0A,$0B
            db $05,$06,$0A,$0B
            db $08,$09,$02,$03
pullpc


    banzai_bill_gfx_routine_aux:
        lda $01
        clc 
        adc.w $D5B4,x
        sta $0301|!addr,y
        lda.w banzai_bill_tiles,x
        phx
        tax
        lda.l !dss_tile_buffer,x
        plx
        sta $0302|!addr,y
        lda.w $D5D4,x
        sta $0303|!addr,y
        iny #4
        rtl