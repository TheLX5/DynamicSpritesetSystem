pushpc 

    org $039292
        creating_eating_block_write_hijack:
            jml creating_eating_block_write
        warnpc $03929C
    org $03929C
        creating_eating_block_write_end:
    org $0392A7
        creating_eating_block_write_return:

pullpc 

    creating_eating_block_write:
        lda #!dss_id_used_block
        jsl find_and_queue_gfx
        bcs .loaded
        lda #$F0
        sta $0301|!addr,y
        jml creating_eating_block_write_return
    .loaded
        lda !dss_tile_buffer
        sta $0302|!addr,y
        lda $0303|!addr,y
        ora #$01
        and #$3F
        jml creating_eating_block_write_end