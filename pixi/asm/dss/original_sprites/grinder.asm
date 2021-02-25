pushpc
    org $01DC0B
        line_grinder_write_hijack:
            lda #!dss_id_grinder
            jsl find_and_queue_gfx
            bcs .loaded
            rts
        .loaded
            jsr GetDrawInfoBnk1
            phx
            jsl line_grinder_write
            jmp grinder_write_end
            warnpc $01DC39
    org $01DBD0
        grinder_write_end:

    org $01DC3B
        line_grinder_x_offset:
    org $01DC3F
        line_grinder_y_offset:
    org $01DC43
        line_grinder_props:


    org $01DBA2
        ground_grinder_write_hijack:
            lda #!dss_id_grinder
            jsl find_and_queue_gfx
            bcs .loaded 
            rts
        .loaded
            jsr GetDrawInfoBnk1
            phx
            jsl ground_grinder_write
            bra grinder_write_end
        warnpc $01DBD0

    org $01DB96
        ground_grinder_x_offset:
    org $01DB9A
        ground_grinder_y_offset:
    org $01DB9E
        ground_grinder_props:
pullpc

    ground_grinder_write:
        ldx #$03
    .loop
        lda $00
        clc
        adc.w ground_grinder_x_offset,x
        sta $0300|!addr,y
        lda $01
        clc 
        adc.w ground_grinder_y_offset,x
        sta $0301|!addr,y
        lda $14
        and #$02
        lsr
        phx
        tax
        lda !dss_tile_buffer,x
        plx
        sta $0302|!addr,y
        lda.w ground_grinder_props,x
        sta $0303|!addr,y
        iny #4
        dex 
        bpl .loop
        rtl

    line_grinder_write:
        ldx #$03
    .loop
        lda $00
        clc
        adc.w line_grinder_x_offset,x
        sta $0300|!addr,y
        lda $01
        clc 
        adc.w line_grinder_y_offset,x
        sta $0301|!addr,y
        lda $14
        and #$02
        lsr
        phx
        tax
        lda !dss_tile_buffer,x
        plx
        sta $0302|!addr,y
        lda.w line_grinder_props,x
        sta $0303|!addr,y
        iny #4
        dex 
        bpl .loop
        rtl