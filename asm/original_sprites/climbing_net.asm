pushpc
    org $01BB16
        climbing_net_init_hijack:
            jml climbing_net_init
        warnpc $01BB1B
    org $01BACC
        climbing_net_init_return:
    org $01BB1B
        climbing_net_init_end:

    org $01BBBD
        climbing_net_write_hijack:
            jml climbing_net_write
        warnpc $01BBC3
    org $01BBC3
        climbing_net_write_end:

    org $01BAB7
        climbing_net_tilemap:
            ;db $00,$10,$00,$00,$10,$00,$01,$11,$01  ; Three columns
            ;db $05,$15,$05,$05,$15,$05              ; Two columns
            ;db $00,$00,$00                          ; (unused)
            ;db $03,$13,$03                          ; One column
            db $00,$02,$00,$00,$02,$00,$01,$03,$01  ; Three columns
            db $06,$07,$06,$06,$07,$06              ; Two columns
            db $00,$00,$00                          ; (unused)
            db $04,$05,$04                          ; One column
pullpc

    climbing_net_init:
        lda #!dss_id_climbing_net
        jsl find_and_queue_gfx
        bcs .loaded
        lda !1540,x
        cmp #$01
        bne .return2
        lda #$1A
        jsl GenTileFromSpr2
    .return2
        jml climbing_net_init_return
    .loaded
        lda !1540,x
        beq .return2
        jml climbing_net_init_end

    climbing_net_write:
        lda.w climbing_net_tilemap,x
        phx
        tax 
        lda.l !dss_tile_buffer,x
        sta $0302|!addr,y
        plx
        jml climbing_net_write_end

    