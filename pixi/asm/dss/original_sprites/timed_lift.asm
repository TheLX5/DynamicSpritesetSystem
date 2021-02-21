pushpc
    org $038E12
        timed_lift_init_hijack:
            lda.b #!dss_id_timed_platform
            jsl find_and_queue_gfx
            bcs .loaded
            rts
        .loaded
            jsr GetDrawInfoBnk3
            jml timed_lift_init
        warnpc $038E24
    org $038E24
        timed_lift_init_end:
    org $038E40
        timed_lift_write_hijack:
            jml timed_lift_write
        warnpc $038E45
    org $038E45
        timed_lift_write_end:
pullpc

    timed_lift_init:
        lda !1570,x
        phx
        pha
        lsr #6
        tax
        lda.l .offset,x
        clc 
        adc.l !dss_tile_buffer+$01
        jml timed_lift_init_end
    .offset
        db $00,$01,$10,$11

    timed_lift_write:
        lda.l !dss_tile_buffer+$00
        cpx #$02
        jml timed_lift_write_end