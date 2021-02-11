pushpc
    org $039E49
        dino_init_hijack:
            jsl dino_prepare_gfx
            jsr GetDrawInfoBnk3
            bra dino_init_end
        warnpc $039E56
    org $039E56
        dino_init_end:
    org $039EA8
        dino_init_return:

    org $039E93
        dino_rhino_write_hijack:
            jml dino_rhino_write
        warnpc $039E97
    org $039E97
        dino_rhino_write_end:
    org $039F00
        dino_torch_write_hijack:
            jml dino_torch_write
        warnpc $039F05
    org $039F05
        dino_torch_write_end:

    org $039E39
        dino_rhino_tilemap:
            db $00,$01,$04,$05
            db $00,$01,$02,$03
            db $06,$07,$08,$03
            db $09,$0A,$0B,$0C
    org $039E21
        dino_torch_tilemap:
            db $00,$01,$02,$03
    org $039E12
        dino_flame_tilemap:
            db $10,$11,$12,$13,$00
            db $14,$15,$16,$17,$00

    org $019B0A
        dino_torch_squished_hijack:
            jml dino_torch_squished
        warnpc $019B0F
    org $019B0F
        dino_torch_squished_end:

pullpc 

    dino_torch_squished:
        lda #!dss_id_dino_torch
        jsl find_and_queue_gfx
        lda !dss_tile_buffer+$04
        sta $0302|!addr,y
        jml dino_torch_squished_end

    dino_prepare_gfx:
        lda.b #!dss_id_dino_fire
        jsl find_and_queue_gfx
        bcs .loaded_fire
    .return
        pla
        pla
        pla 
        jml dino_init_return
    .loaded_fire
        ldx #$07
    .loop_fire
        lda.l !dss_tile_buffer+$00,x
        sta.l !dss_tile_buffer+$10,x
        dex
        bpl .loop_fire
        ldx $15E9|!addr
        ldy.b #!dss_id_dino_torch
        lda !9E,x
        cmp #$6F
        beq .dino_torch
    .dino_rhino
        ldy.b #!dss_id_dino_rhino
    .dino_torch
        tya
        jsl find_and_queue_gfx
        bcc .return
        lda !157C,x
        sta $02
        lda !1602,x
        sta $04
        rtl

    dino_torch_write:
        tax
        lda.l !dss_tile_buffer,x
        sta $0302|!addr,y
        lda #$00
        jml dino_torch_write_end

    dino_rhino_write:
        tax
        lda.l !dss_tile_buffer,x
        sta $0302|!addr,y
        iny
        jml dino_rhino_write_end