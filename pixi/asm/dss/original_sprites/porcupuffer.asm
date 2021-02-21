pushpc
    org $0385A3
        porcupuffer_init_hijack:
            lda #!dss_id_porcupuffer
            jsl find_and_queue_gfx
            bcs .loaded
            rts
        .loaded
            jsr GetDrawInfoBnk3
            jml porcupuffer_init
        warnpc $0385B4
    org $0385B4
        porcupuffer_init_end:


    org $0385DB
        porcupuffer_write_hijack:
            jml porcupuffer_write
        warnpc $0385DF
    org $0385DF
        porcupuffer_write_end:
    org $038593
        porcupuffer_tilemap:
            ;db $86,$C0,$A6,$C2
            ;db $86,$C0,$A6,$8A
            db $00,$02,$01,$03
            db $00,$02,$01,$04
        warnpc $03859B
pullpc

    porcupuffer_init:
        lda $14
        and #$04
        sta $03
        lda !157C,x                 ; restore original code
        sta $02
        phx
        ldx #$03
        jml porcupuffer_init_end

    porcupuffer_write:
        tax
        lda.w porcupuffer_tilemap,x
        tax
        lda.l !dss_tile_buffer,x
        jml porcupuffer_write_end

