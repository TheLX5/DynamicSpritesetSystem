pushpc
    org $01B666
        floating_spike_balls_write_hijack:
            lda.b #!dss_id_spiky_balls
            jsl find_and_queue_gfx
            bcs .loaded
            rts 
        .loaded
            jsr GetDrawInfoBnk1
            ldx #$03
        .loop
            lda $00
            clc
            adc.w floating_spike_balls_x_disp,x
            sta $0300|!addr,y
            lda $01
            clc 
            adc.w floating_spike_balls_y_disp,x
            sta $0301|!addr,y
            jsl floating_spike_balls_write
            iny #4
            dex 
            bpl .loop 
            ldx $15E9|!addr 
            ldy #$02
            lda #$03
            jmp FinishOAMWriteRt
        warnpc $01B69E

    org $01B65A
        floating_spike_balls_x_disp:
    org $01B65E
        floating_spike_balls_y_disp:
    org $01B662
        floating_spike_balls_props:


pullpc 

    floating_spike_balls_write:
        lda $14
        lsr #2
        and #$04
        lsr #2
        phx 
        tax 
        lda !dss_tile_buffer,x
        plx 
        sta $0302|!addr,y
        lda.w floating_spike_balls_props,x
        sta $0303|!addr,y 
        rtl 
