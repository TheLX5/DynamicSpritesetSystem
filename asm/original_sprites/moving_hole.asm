pushpc
    org $02E637
        moving_hole_write_hijack:
            lda.b #!dss_id_moving_hole
            jsl find_and_queue_gfx
            bcs .loaded
            rts
        .loaded
            jsr GetDrawInfoBnk2
            jsl moving_hole_write
            ldx $15E9|!addr
            lda #$03
            ldy #$02
            jsl FinishOAMWrite
            rts
        warnpc $02E666
    org $02E666
        moving_hole_x_offsets:
            db $00,$08,$18,$20
    org $02E66A
        moving_hole_tilemap:
            db $01,$00,$00,$01
    org $02E66E
        moving_hole_props:
            db $71,$31,$31,$31
pullpc

    moving_hole_write:
        ldx #$03
    .loop
        lda $00
        clc
        adc.w moving_hole_x_offsets,x
        sta $0300|!addr,y
        lda $01
        sta $0301|!addr,y
        phx
        lda.w moving_hole_tilemap,x
        tax
        lda.l !dss_tile_buffer,x
        sta $0302|!addr,y
        plx
        lda.w moving_hole_props,x
        sta $0303|!addr,y
        iny #4
        dex 
        bpl .loop
        rtl