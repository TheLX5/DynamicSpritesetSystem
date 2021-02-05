pushpc
    org $02E00B
        volcano_lotus_hijack:
            lda.b #!dss_id_volcano_lotus
            jsl find_and_queue_gfx
            bcs .loaded
            rts
        .loaded
            jsr GetDrawInfoBnk2
            lda $00
            sta $0308|!addr,y
            sec
            sbc #$08
            sta $0300|!addr,y
            clc 
            adc #$10
            sta $0304|!addr,y
            sta $030C|!addr,y
            lda $01
            sta $0301|!addr,y
            sta $0305|!addr,y
            sta $0309|!addr,y
            sta $030D|!addr,y
            lda.l !dss_tile_buffer+$00
            sta $0302|!addr,y
            sta $0306|!addr,y
            jsl volcano_lotus_write
            tya
            lsr #2
            tay
            lda #$02
            sta $0460|!addr,y
            sta $0461|!addr,y
            lda #$00
            sta $0462|!addr,y
            sta $0463|!addr,y
            ldy #$FF
            lda #$03
            jsl FinishOAMWrite
            rts
        warnpc $02E06E

    org $02E008
        volcano_lotus_tilemap:
            db $04,$06,$08
        warnpc $02E00B

    org $029B93
        volcano_lotus_fire_hijack:
            jml volcano_lotus_fire
        warnpc $029B99
    org $029B99
        volcano_lotus_fire_end:
pullpc

    volcano_lotus_fire:
        php
        lda.b #!dss_id_volcano_lotus
        jsl find_and_queue_gfx
        bcs .loaded
        lda #$F0
        sta $0201|!addr,y
    .loaded
        plp
        lda !dss_tile_buffer+$02
        bcc .change
        inc 
    .change
        clc 
        adc #$10
        jml volcano_lotus_fire_end

    volcano_lotus_write:
        phx
        lda !1602,x
        tax
        lda.w volcano_lotus_tilemap,x
        pha
        lsr #2
        tax
        lda !dss_tile_buffer,x
        sta $00
        pla
        and #$03
        tax
        lda.l volcano_lotus_offsets,x
        clc 
        adc $00
        sta $030A|!addr,y
        inc 
        sta $030E|!addr,y
        plx
        lda !15F6,x
        ora $64
        sta $0303|!addr,y
        ora #$40
        sta $0307|!addr,y
        lda !151C,x
        lsr
        lda #$09
        bcc .flash
        lda #$05
    .flash
        ora $64
        sta $030B|!addr,y
        sta $030F|!addr,y
        rtl

    volcano_lotus_offsets:
        db $00,$01,$10,$11