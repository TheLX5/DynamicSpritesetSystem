pushpc 

    org $03C4C1
        spotlight_write_hijack:
            jml spotlight_write
        warnpc $03C4C7
    org $03C4C7
        spotlight_write_end:
    org $03C4D6
        spotlight_write_return:


pullpc 

    spotlight_write:
        lda #!dss_id_disco_ball
        jsl find_and_queue_gfx
        bcs .loaded
        jml spotlight_write_return
    .loaded
        lda !dss_tile_buffer,x
        sta $0302|!addr,y
        jml spotlight_write_end