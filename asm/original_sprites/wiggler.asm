pushpc
    org $02F110
        wiggler_init_hijack:
            jsl wiggler_init_load_misc
            lda.b #!dss_id_wiggler
            jsl find_and_queue_gfx
            bcs .loaded
        .return
            rts
        .loaded
            jsr GetDrawInfoBnk2
            jml wiggler_init
        warnpc $02F124
    org $02F124
        wiggler_init_end:

    org $02F16C
        wiggler_write_hijack:
            lda.l !dss_tile_buffer+$00
            cpx #$00
            beq wiggler_write_end
            jml wiggler_write
        warnpc $02F179
    org $02F179
        wiggler_write_end:
            sta $0302|!addr,y

    org $02F10C
        wiggler_tilemap:
            db $01,$02,$03,$01

    org $02F1BD
        wiggler_angry_write_hijack:
            jml wiggler_angry_write
        warnpc $02F1C2
    org $02F1C2
        wiggler_angry_write_end:


    org $02F1E3
        wiggler_flower_write_hijack:
            jml wiggler_flower_write
        warnpc $02F1E8
    org $02F1E8
        wiggler_flower_write_end:

    org $029D2F
        flower_write_hijack:
            jml flower_write
        warnpc $029D34
    org $029D34
        flower_write_end:
    org $029D44
        flower_write_return:
pullpc

    flower_write:
        lda.b #!dss_id_misc_tiles_2
        jsl find_and_queue_gfx
        bcs .loaded
        lda #$F0
        sta $0201|!addr,y
        jml flower_write_return
    .loaded
        lda !dss_tile_buffer+$00
        clc
        adc #$10
        sta $0202|!addr,y
        jml flower_write_end

    wiggler_init:
        lda !1570,x
        sta $03
        lda !15F6,x
        sta $07
        lda !151C,x
        sta $08
        lda !C2,x
        jml wiggler_init_end

    wiggler_init_load_misc:
        lda.b #!dss_id_misc_tiles_2
        jsl find_and_queue_gfx
        bcs .loaded
        pla
        pla
        pla
        jml wiggler_init_hijack_return
    .loaded
        lda.l !dss_tile_buffer+$00
        sta.l !dss_tile_buffer+$04
        rtl

    wiggler_write:
        phx
        ldx $06
        lda.w wiggler_tilemap,x
        tax
        lda.l !dss_tile_buffer,x
        plx
        jml wiggler_write_end

    wiggler_angry_write:
        lda.l !dss_tile_buffer+$04
        sta $0302|!addr,y
        jml wiggler_angry_write_end

    wiggler_flower_write:
        lda.l !dss_tile_buffer+$04
        clc
        adc #$10
        sta $0302|!addr,y
        jml wiggler_flower_write_end
