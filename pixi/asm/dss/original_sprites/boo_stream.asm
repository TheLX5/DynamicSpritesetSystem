pushpc
    org $038FA0
        boo_stream_write_hijack:
            jml boo_stream_write
        warnpc $038FA4
    org $038FA4
        boo_stream_write_end:
    org $038F6D
        boo_stream_tilemap:
            db $00,$03,$04,$01,$02,$05,$00,$03
        warnpc $038F75
    org $028D23
        boo_stream_minor_write_hijack:
            jml boo_stream_minor_write
        warnpc $028D29
    org $028D29
        boo_stream_minor_write_end:
    org $028D41
        boo_stream_minor_write_return:
    org $028CB8
        boo_stream_minor_tilemap:
            db $00,$03,$04,$01,$02,$05
            db $00,$03,$04,$01,$02,$05
pullpc 

    boo_stream_write:
        tax 
        lda.b #!dss_id_boo
        jsl find_and_queue_gfx
        bcs .loaded
        lda #$F0 
        sta $0301|!addr,y
        bra .return
    .loaded
        lda !dss_tile_buffer,x
        sta $0302|!addr,y
    .return
        plx
        jml boo_stream_write_end

    boo_stream_minor_write:
        lda.b #!dss_id_boo
        jsl find_and_queue_gfx
        bcs .loaded
        lda #$F0
        sta $0201|!addr,y
        jml boo_stream_minor_write_return
    .loaded
        phx
        lda boo_stream_minor_tilemap,x
        tax
        lda !dss_tile_buffer,x
        sta $0202|!addr,y
        plx
        jml boo_stream_minor_write_end