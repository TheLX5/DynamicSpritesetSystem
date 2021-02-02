pushpc
    org $02FA47
        candle_flames_write_hijack:
            jml candle_flames_write
        warnpc $02FA4B
    org $02FA4B
        candle_flames_write_end:
    org $02FA83
        candle_flames_write_return:

    org $02FA0E
        candle_flames_tilemap:
            ;db $E2,$E4,$E2,$E4
            db $00,$01,$00,$01
pullpc

    candle_flames_write:
        tax
        lda #!dss_id_background_flames
        jsl find_and_queue_gfx
        bcs .loaded
        lda #$F0
        sta $0301|!addr,y
        plx
        ply
        jml candle_flames_write_return
    .loaded
        phx
        lda.w candle_flames_tilemap,x
        tax
        lda.l !dss_tile_buffer,x
        plx
        jml candle_flames_write_end