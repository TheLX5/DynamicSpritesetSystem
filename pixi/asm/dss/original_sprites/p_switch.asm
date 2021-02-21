pushpc

    org $01A1FD 
        p_switch_write_hijack:
            jsl p_switch_load
            ldy !163E,x
            beq .not_pressed
        .pressed_not_disappear
            cpy #$01
            bne .pressed
            jmp p_switch_disappear
        .pressed
            jmp SmushedGfxRt
        .not_pressed
            lda #$01
            sta !157C,x
            jsr SubSprGfx2Entry1
            jsl p_switch_write
            lda !dss_tile_buffer
            bra p_switch_end
        warnpc $01A222
    org $01A222
        p_switch_end:

    org $019ACB
        p_switch_disappear:

    org $01E75A
        p_switch_return:

pullpc 

    p_switch_load:
        lda #!dss_id_p_switch
        jsl find_and_queue_gfx
        bcs .loaded
        pla
        pla
        pla
        jml p_switch_return
    .loaded
        rtl

    p_switch_write:
        ldy !15EA,x
        lda $0303|!addr,y
        ora #$01
        sta $0303|!addr,y
        rtl