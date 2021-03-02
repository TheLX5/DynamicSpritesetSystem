pushpc

    org $029251
        bounce_blocks_write_hijack:
            jml bounce_blocks_write
        warnpc $029255
    org $029255
        bounce_blocks_write_end:
    org $029261
        bounce_blocks_write_return:

    org $0291F1
        bounce_blocks_gfxs:
            db !dss_id_turn_block
            db !dss_id_note_block
            db !dss_id_question_block
            db !dss_id_turn_block
            db !dss_id_glass_block
            db !dss_id_on_off_bounce_block
            db !dss_id_turn_block
    org $028789
        bounce_blocks_props:
            db $01
            db $03
            db $01
            db $01
            db $01
            db $07
            db $01
            db $05
            db $0B

pullpc 

    bounce_blocks_write:
        tax 
        lda.w bounce_blocks_gfxs-1,x
        jsl find_and_queue_gfx
        bcs .loaded
        lda #$F0 
        sta $0201|!addr,y
        jml bounce_blocks_write_return
    .loaded 
        lda !dss_tile_buffer
        jml bounce_blocks_write_end