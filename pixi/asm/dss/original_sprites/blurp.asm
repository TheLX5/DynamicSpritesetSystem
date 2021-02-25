pushpc
    org $0384CA
        blurp_write:
            lda #!dss_id_blurp
            jsl find_and_queue_gfx
            bcc blurp_write_end
        .loaded
            jsr GetDrawInfoBnk3
            lda $00
            sta $0300|!addr,y
            lda $01
            jsl blurp_write_extra
            ldy !15EA,x
            lda !14C8,x
            cmp #$08
            beq blurp_write_end
            lda $0303|!addr,y
            ora #$80
            sta $0303|!addr,y
            rts
        warnpc $0384F5

    org $0384F5
        blurp_write_end:
pullpc

    blurp_write_extra:
        sta $0301|!addr,y
        lda $14
        lsr #3
        clc
        adc $15E9|!addr
        lsr #1
        lda.l !dss_tile_buffer+$00
        bcc .other
        lda.l !dss_tile_buffer+$01
    .other
        sta $0302|!addr,y
        lda !157C,x
        lsr 
        lda !15F6,x
        bcs .flip 
        ora #$40
    .flip 
        ora $64
        sta $0303|!addr,y
        ldx $15E9|!addr
        lda #$00
        ldy #$02
        jml FinishOAMWrite