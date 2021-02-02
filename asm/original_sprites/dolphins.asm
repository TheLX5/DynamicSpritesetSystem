pushpc
    org $02BC1D
        horizontal_dolphin_init_hijack:
            lda.b #!dss_id_horizontal_dolphin
            jsl find_and_queue_gfx
            bcs .loaded
            rts
        .loaded
            jsr GetDrawInfoBnk2
            jml horizontal_dolphin_init
        warnpc $02BC2E
    org $02BC2E
        horizontal_dolphin_init_end_right:
    org $02BC3C
        horizontal_dolphin_init_end_left:

    org $02BC0E
        horizontal_dolphin_tilemap:
            ;db $E2,$88
            ;db $E7,$A8
            ;db $E8,$A9
            db $00,$03
            db $01,$04
            db $02,$05
        warnpc $02BC14

    org $02BC34
        clc
        adc #$10            ; fixes offset
    org $02BC48
        sec
        sbc #$10

    org $02BC62
        lda.w horizontal_dolphin_tilemap+$04,x
        sta $00
        lda.w horizontal_dolphin_tilemap+$02,x
        xba
        lda.w horizontal_dolphin_tilemap+$00,x
        jml horizontal_dolphin_write
        warnpc $02BC74
    org $02BC74
        horizontal_dolphin_write_end:
pullpc

    horizontal_dolphin_init:
        lda !B6,x
        sta $02                 ; restore original code
        lda $00
        asl $02
        php
        bcc .facing_left
        sta $0300|!addr,y
        jml horizontal_dolphin_init_end_right
    .facing_left
        jml horizontal_dolphin_init_end_left

    horizontal_dolphin_write:
        tax 
        lda.l !dss_tile_buffer,x
        sta $0302|!addr,y
        xba
        tax
        lda.l !dss_tile_buffer,x
        sta $0306|!addr,y
        ldx $00
        lda.l !dss_tile_buffer,x
        sta $030A|!addr,y
        jml horizontal_dolphin_write_end
