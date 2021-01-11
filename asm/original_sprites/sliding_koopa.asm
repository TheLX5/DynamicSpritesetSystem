if !pass == 0

    org $0189EC
        sliding_koopa:
            ldx #$03
            lda.l !dss_tile_buffer,x
            ldx $15E9|!addr
            ldy !15EA,x
            sta $0302|!addr,y
            rts
        warnpc $0189FC

endif