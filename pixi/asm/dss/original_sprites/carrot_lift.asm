pushpc
    org $038D24
        carrot_lift_init_hijack:
            lda.b #!dss_id_carrot_platform
            jsl find_and_queue_gfx
            bcs .loaded
            rts
        .loaded
            jsr GetDrawInfoBnk3
            jml carrot_lift_init
        warnpc $038D34
    org $038D34
        carrot_lift_init_end:

    org $038D46
        carrot_lift_write_hijack:
            jml carrot_lift_write
        warnpc $038D4C
    org $038D4C
        carrot_lift_write_end:

    org $038D18
        carrot_lift_tilemap:
            db $02,$00,$01
            db $02,$00,$01
        warnpc $038D1E
pullpc

    carrot_lift_init:
        phx
        lda !9E,x
        cmp #$B8
        ldx #$02
        stx $02
        bcc .other
        ldx #$05
    .other
        jml carrot_lift_init_end

    carrot_lift_write:
        phx
        lda.w carrot_lift_tilemap,x
        tax
        lda.l !dss_tile_buffer,x
        sta $0302|!addr,y
        plx
        jml carrot_lift_write_end