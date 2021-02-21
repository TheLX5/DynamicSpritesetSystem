pushpc

    org $03A065
        blargg_init_hijack:
            jml blargg_load
        warnpc $03A069
    org $03A069
        blargg_init_end:
    org $03A081
        blargg_init_return:
    org $03A038
        blargg_no_draw:

    org $03A074 
        blargg_eyes_write_hijack: 
            jml blargg_eyes_write
        warnpc $03A079
    org $03A079
        blargg_eyes_write_end:

    org $03A0D0
        blargg_write_hijack:
            jsl blargg_write
    org $03A091
        blargg_tilemap:
            db $01,$02,$04,$05,$03
            db $01,$02,$06,$07,$03

pullpc

    blargg_load:
        lda.b #!dss_id_blarrg
        jsl find_and_queue_gfx
        bcs .loaded
        jml blargg_init_return
    .loaded
        lda !C2,x
        beq .no_draw
        jml blargg_init_end
    .no_draw 
        jml blargg_no_draw

    blargg_eyes_write:
        lda !dss_tile_buffer
        sta $0302|!addr,y
        jml blargg_eyes_write_end

    blargg_write:
        tax 
        lda.w blargg_tilemap,x
        phx
        tax 
        lda !dss_tile_buffer,x 
        plx 
        rtl 
    