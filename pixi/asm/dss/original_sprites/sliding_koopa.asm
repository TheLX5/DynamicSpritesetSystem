pushpc
    org $0189EC
        sliding_koopa:
            ldx #$03
            lda.l !dss_tile_buffer,x
            ldx $15E9|!addr
            ldy !15EA,x
            sta $0302|!addr,y
            rts
        warnpc $0189FC
    org $038983
        sliding_koopa_write_hijack:
            jml sliding_koopa_write
        warnpc $038989
    org $038989
        sliding_koopa_write_end:
    org $03898C
        sliding_koopa_write_return:
pullpc

    sliding_koopa_write:
        php
        lda #!dss_id_shelless_blue_koopa
        jsl find_and_queue_gfx
        bcs .loaded
        plp
        lda #$F0
        sta $0301|!addr,y
        jml sliding_koopa_write_return
    .loaded
        lda !dss_tile_buffer+$04
        plp
        bcc .sliding
        lda !dss_tile_buffer+$00
    .sliding
        jml sliding_koopa_write_end