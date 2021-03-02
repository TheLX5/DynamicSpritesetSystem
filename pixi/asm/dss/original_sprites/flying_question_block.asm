pushpc

    org $01AE71
        flying_question_block_write_hijack:
            jml flying_question_block_write
        warnpc $01AE7B
    org $01AE7B
        flying_question_block_write_end:
    org $01AE7E
        flying_question_block_write_return:

pullpc 

    flying_question_block_write:
        lda !C2,x
        cmp #$01
        lda.b #!dss_id_question_block
        bcc .question
        lda.b #!dss_id_used_block
    .question
        jsl find_and_queue_gfx
        bcs .loaded
        lda #$F0
        sta $0301|!addr,y
        jml flying_question_block_write_return
    .loaded
        lda !dss_tile_buffer
        sta $0302|!addr,y
        jml flying_question_block_write_end