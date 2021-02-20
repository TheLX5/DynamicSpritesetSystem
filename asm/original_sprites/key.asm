pushpc

    org $01A1F9
        key_write_hijack:
            jml key_write
        warnpc $01A1FD
    org $01A222
        key_write_end:
    org $01A228
        key_write_return:

pullpc

    key_write:
        lda #!dss_id_key
        jsl find_and_queue_gfx
        bcs .loaded
        ldy !15EA,x
        lda #$F0
        sta $0301|!addr,y
        jml key_write_return
    .loaded
        lda !dss_tile_buffer+$00
        jml key_write_end