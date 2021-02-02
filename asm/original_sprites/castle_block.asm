pushpc
    org $038EB4
        castle_block_write_hijack:
            lda #!dss_id_castle_block
            jsl find_and_queue_gfx
            bcs .loaded
            rts
        .loaded
            jsr GetDrawInfoBnk3
            ldx #$03
            jsl castle_block_write
            ldx $15E9|!addr
            ldy #$02
            lda #$03
            jsl FinishOAMWrite
            rts
        warnpc $038EE9

    org $038EA8
        castle_block_x_offset:
    org $038EAC
        castle_block_y_offset:
    org $038EB0
        castle_block_tilemap:
            db $00,$01,$02,$03
pullpc

    castle_block_write:
    .loop
        lda $00
        clc
        adc.w castle_block_x_offset,x
        sta $0300|!addr,y
        lda $01
        clc 
        adc.w castle_block_y_offset,x
        sta $0301|!addr,y
        phx
        lda.w castle_block_tilemap,x
        tax
        lda.l !dss_tile_buffer,x
        plx
        sta $0302|!addr,y
        lda #$03
        ora $64
        sta $0303|!addr,y
        iny #4
        dex 
        bpl .loop
        rtl