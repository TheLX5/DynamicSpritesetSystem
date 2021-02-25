pushpc
    org $01E453
        collapsing_bones_hijack:
            lda.b #!dss_id_bones
            jsl find_and_queue_gfx
            bcs .loaded
            jmp collapsing_bones_skip
        .loaded
            lda #$01
            cpy #$10
            bcc .midcollapse
            cpy #$F0
            bcs .midcollapse
            lda #$03
        .midcollapse
            ldy !15EA,x
            tax 
            lda !dss_tile_buffer,x
            phx
            sta $0302|!addr,y
            ldx $15E9|!addr
            tya
            clc
            adc #$04
            sta !15EA,x
            lda !157C,x
            tax
            lda $0300|!addr,y
            jml collapsing_bones
        warnpc $01E48C

    org $01E48C
        collapsing_bones_end:

    org $01E4B3
        collapsing_bones_skip:

    org $03C3E0
        dry_bones_init_hijack:
            jml dry_bones_init
            nop
        dry_bones_init_end:
            jsr GetDrawInfoBnk3
        warnpc $03C3E8

    org $03C44D
        dry_bones_return:

    org $03C400
        dry_bones_tile_count_hijack:
            jsl dry_bones_tile_count

    org $03C438
        dry_bones_write_hijack:
            jml dry_bones_write

    org $03C43C
        dry_bones_write_end:

    org $03C3CE
        dry_bones_tilemap:
            db $00,$00,$01
            db $00,$00,$02
            db $04,$00,$03

    org $02A2C3
        bone_projectile_write_hijack:
            lda #!dss_id_bone_projectile
            jsl find_and_queue_gfx
            bcs .loaded
            rts
        .loaded
            jsr $A1A4
            ldy.w $A153,x
            phx
            lda $1765|!addr,x
            lsr #2
            jsl bone_projectile_write
            plx
            rts
        warnpc $02A2DE
pullpc


    bone_projectile_write:
        lsr
        and #$07
        tax
        lda $A2E7,x
        eor $00
        eor #$40
        and #$F0
        ora #$03
        ora $64
        sta $0203|!addr,y
        lda.l bone_projectile_frames,x
        tax 
        lda.l !dss_tile_buffer,x
        sta $0202|!addr,y
        tya 
        lsr #2
        tax
        lda #$02
        sta $0420|!addr,x
        rtl
    bone_projectile_frames:
        db $01,$00,$00,$01,$01,$00,$00,$01

    dry_bones_write:
        tax 
        lda !dss_tile_buffer,x
        sta $0302|!addr,y
        plx
        jml dry_bones_write_end

    dry_bones_tile_count:
        sta $04
        lda $06
        cmp #$FF
        beq .keep_normal_count
        sta !dss_tile_buffer+4
        bra .return
    .keep_normal_count
        dec $04
    .return
        ldx #$02
        rtl

    dry_bones_init:
        lda !9E,x
        cmp #$30
        bne .two_tiles
        lda.b #!dss_id_bone_projectile
        jsl find_and_queue_gfx
        lda #$FF
        bcc .no_bone_loaded
        lda !dss_tile_buffer+0
    .no_bone_loaded
        sta $06
    .two_tiles
        lda.b #!dss_id_dry_bones
        jsl find_and_queue_gfx
        bcs .loaded
        jml dry_bones_return
    .loaded
        lda !15AC,x
        sta $05
        jml dry_bones_init_end

    collapsing_bones:
        clc 
        adc.w $E43C,x
        sta $0304|!addr,y
        lda $0301|!addr,y
        sta $0305|!addr,y
        lda $0303|!addr,y
        sta $0307|!addr,y
        plx
        lda !dss_tile_buffer-1,x
        sta $0306|!addr,y
        ldx $15E9|!addr
        jml collapsing_bones_end