pushpc

    org $03C247
        light_switch_write_hijack:
            jml light_switch_write
        warnpc $03C24C
    org $03C24C
        light_switch_write_end:
    org $03C254
        light_switch_write_return:

pullpc 


    light_switch_write:
        lda.b #!dss_id_question_block
        jsl find_and_queue_gfx
        bcs .loaded
        lda #$F0
        sta $0301|!addr,y
        jml light_switch_write_return
    .loaded
        lda !dss_tile_buffer
        sta $0302|!addr,y 
        jml light_switch_write_end
