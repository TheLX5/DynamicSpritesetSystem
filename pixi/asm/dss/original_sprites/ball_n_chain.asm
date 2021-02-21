pushpc
    org $02D813
        ball_n_chain_ball_write_hijack:
            lda #!dss_id_ball_n_chain
            jsl find_and_queue_gfx
            bcs .loaded
            rts
        .loaded
            jsr GetDrawInfoBnk2
            jsl ball_n_chain_ball_write
            rts
        warnpc $02D840

    org $02D7A0
        ball_n_chain_chain_write:
            lda !dss_tile_buffer+$00
            sta $08
            bra ball_n_chain_chain_end
    org $02D7AD
        ball_n_chain_chain_end:

    org $02D807
        ball_n_chain_ball_x_offset:
    org $02D80B
        ball_n_chain_ball_y_offset:
    org $02D80F
        ball_n_chain_ball_props:
pullpc

    ball_n_chain_ball_write:
        ldx #$03
    .loop
        lda $00
        clc 
        adc.w ball_n_chain_ball_x_offset,x
        sta $0300|!addr,y
        lda $01
        clc 
        adc.w ball_n_chain_ball_y_offset,x
        sta $0301|!addr,y
        lda !dss_tile_buffer+$01
        sta $0302|!addr,y
        lda.w ball_n_chain_ball_props,x
        sta $0303|!addr,y
        iny #4
        dex 
        bpl .loop
        ldx $15E9|!addr
        rtl