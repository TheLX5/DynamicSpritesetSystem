pushpc

    org $01DBF4 
        fuzzy_write_hijack:
            jml fuzzy_write
    org $01DBF9
        fuzzy_write_end:
    org $01DB95
        fuzzy_write_return:

pullpc

    fuzzy_write:
        lda.b #!dss_id_fuzzy
        jsl find_and_queue_gfx
        bcs .loaded 
        plx 
        lda #$F0 
        sta $0301|!addr,y
        jml fuzzy_write_return
    .loaded 
        lda !dss_tile_buffer
        sta $0302|!addr,y
        jml fuzzy_write_end