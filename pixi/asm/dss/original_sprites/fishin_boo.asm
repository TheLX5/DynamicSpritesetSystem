pushpc
    org $039180
        fishin_boo_init_hijack:
            lda.b #!dss_id_fishing_boo
            jsl find_and_queue_gfx
            bcs .loaded
            rts
        .loaded
            jsr GetDrawInfoBnk3
            jml fishin_boo_init
        warnpc $039191
    org $039191
        fishin_boo_init_end:
    org $0391B4
        fishin_boo_write_hijack:
            jml fishin_boo_write
        warnpc $0391B9 
    org $0391B9
        fishin_boo_write_end:
    
    org $039160
        fishin_boo_tilemap:
            db $60,$60,$00,$01,$60,$60,$02,$02,$02,$03
    org $039174
        fishin_boo_flame_tilemap:
            db $03,$04,$03,$04
    org $03916A
        fishin_boo_props:
pullpc

    fishin_boo_init:
        lda !1602,x
        sta $04
        lda !157C,x
        sta $02
        phx
        phy
        ldx #$09
        jml fishin_boo_init_end

    fishin_boo_write:
        pha
        lda fishin_boo_props,x
        lsr  
        pla
        bcc .normal
        phx
        tax
        lda.l !dss_tile_buffer,x
        plx
    .normal
        sta $0302|!addr,y
        lda $02
        jml fishin_boo_write_end