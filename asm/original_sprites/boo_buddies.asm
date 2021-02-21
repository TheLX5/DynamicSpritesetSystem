pushpc
    org $02FD73
        boo_buddies_write_hijack:
            jml boo_buddies_write
        warnpc $02FD77
    org $02FD77
        boo_buddies_write_end:
    org $02FBBF
        boo_buddies_tilemap:
            db $00,$01,$03,$02,$04,$05,$00,$01
pullpc

    boo_buddies_write:
        pha
        lda $02,s
        tax 
        lda $1892|!addr,x
        cmp #$08
        bne .boo
        plx 
        bra .return 
    .boo 
        lda.b #!dss_id_boo
        jsl find_and_queue_gfx
        plx
        bcs .loaded
        lda #$F0
        sta $0301|!addr,y
        bra .return
    .loaded
        lda.l !dss_tile_buffer,x
        sta $0302|!addr,y
    .return
        plx
        jml boo_buddies_write_end