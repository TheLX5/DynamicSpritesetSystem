pushpc

    org $01E722
        smushed_sprites_write_hijack:
            cpx #$3E
            bne .not_p_switch
        .p_switch
            jml smushed_p_switch
        .not_p_switch
            cpx #$BD
            beq .koopa
            cpx #$05
            bcs .not_koopa
        .koopa
            jml smushed_koopa
        .not_koopa
            jml smushed_anything
        warnpc $01E740
    org $01E740
        smushed_sprites_end:
    org $01E75A
        smushed_sprites_return:

    org $018904
        fix_shelless_koopa_delay_hijack:
            jml fix_shelless_koopa_delay
    org $018908
        fix_shelless_koopa_delay_end:
    org $018952
        fix_shelless_koopa_delay_return:
pullpc

    fix_shelless_koopa_delay:
        lda.b #!dss_id_misc_tiles_1
        jsl find_and_queue_gfx
        lda $9D
        beq ._return
        jml fix_shelless_koopa_delay_end
    ._return 
        jml fix_shelless_koopa_delay_return
        

    smushed_p_switch:
        lda.l !dss_tile_buffer+$01
        bra smushed_write

    smushed_koopa:
        lda #!dss_id_misc_tiles_1
        jsl find_and_queue_gfx
        bcs .loaded
    .return
        lda #$F0
        sta $0301|!addr,y
        sta $0305|!addr,y
        plx
        jml smushed_sprites_return
    .loaded
        lda.l !dss_tile_buffer
        bra smushed_write
    
    smushed_anything:
        lda #!dss_id_misc_tiles_1
        jsl find_and_queue_gfx
        bcs .loaded
        jmp smushed_koopa_return
    .loaded
        lda.l !dss_tile_buffer
        clc
        adc #$10

    smushed_write:
        sta $0302|!addr,y
        sta $0306|!addr,y
        ldx $15E9|!addr
        lda !15F6,x
        ora #$01
        sta !15F6,x
        jml smushed_sprites_end