pushpc
    org $01AF57
        thwomp_gfx_init_hijack:
            pei ($00)
            lda #!dss_id_thwomp
            jsl find_and_queue_gfx
            jml thwomp_gfx_init

    org $01AF3F
        thwomp_gfx_init_return:

    org $01AF64
        thwomp_gfx_init_end:

    org $01AF7E
        thwomp_gfx_write_hijack:
            lda.w thwomp_tiles,x
            phx
            tax
            lda.l !dss_tile_buffer,x
            plx
            jml thwomp_gfx_write

        warnpc $01AF8F

    org $01AF8F
        thwomp_gfx_write_end:

    org $01AF4A
        thwomp_tiles: 
            db $00,$00,$01,$01,$02
pullpc

    thwomp_gfx_init:
        bcs .loaded 
        pla 
        pla
        jml thwomp_gfx_init_return
    .loaded
        pla 
        sta $00
        pla 
        sta $01
        lda !1528,x
        sta $02
        phx
        ldx #$03
        cmp #$00
        beq .default
        inx
    .default
        jml thwomp_gfx_init_end

    thwomp_gfx_write:
        cpx #$04
        bne .normal
        phx 
        ldx $02
        cpx #$02
        bne .watching
        lda.l !dss_tile_buffer+3
    .watching
        plx
    .normal
        jml thwomp_gfx_write_end
