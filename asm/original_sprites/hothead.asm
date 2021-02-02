pushpc
    org $02BEB5
        hothead_init_hijack:
            lda #!dss_id_hothead
            jsl find_and_queue_gfx
            bcs .loaded
            rts
        .loaded
            jsr GetDrawInfoBnk2
            jml hothead_init
        warnpc $02BEC6
    org $02BEC6
        hothead_init_end:

    org $02BEDF
        hothead_body_write_hijack:
            jml hothead_body_write
        warnpc $02BEE3
    org $02BEE3
        hothead_body_write_end:


    org $02BE95
        hothead_tilemap:
            ;db $0C,$0E,$0E,$0C                      ; Frame A
            ;db $0E,$0C,$0C,$0E                      ; Frame B
            db $00,$01,$01,$00                      ; Frame A
            db $01,$00,$00,$01                      ; Frame B
        warnpc $02BE9D


    org $02BF0A
        hothead_eyes_write_hijack:
            jml hothead_eyes_write
        warnpc $02BF13
    org $02BF13
        hothead_eyes_write_end:
pullpc

    hothead_init:
        tya
        clc
        adc #$04
        sta !15EA,x
        tay                 ; recover original code
        lda $14
        and #$04
        sta $03
        jml hothead_init_end

    hothead_body_write:
        tax
        phx
        lda.w hothead_tilemap,x
        tax 
        lda !dss_tile_buffer,x
        plx
        jml hothead_body_write_end

    hothead_eyes_write:
        lda !dss_tile_buffer+$02
        ldy !1558,x
        beq .open
        clc
        adc #$10 
    .open
        jml hothead_eyes_write_end
