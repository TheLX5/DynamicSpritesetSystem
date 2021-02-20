pushpc

    org $038DAF
        info_box_write_hijack:
            jml info_box_write
        warnpc $038DB4
    org $038DB4
        info_box_write_end:

pullpc

    info_box_write:
        lda.b #!dss_id_info_fox
        jsl find_and_queue_gfx
        bcs .loaded
        lda #$F0
        sta $0301|!addr,y
        jml info_box_write_end
    .loaded
        lda !dss_tile_buffer
        sta $0302|!addr,y
        jml info_box_write_end