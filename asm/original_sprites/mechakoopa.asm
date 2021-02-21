pushpc 

    org $03B355
        mechakoopa_init_hijack:
            jml mechakoopa_load
        warnpc $03B35A
    org $03B3EE
        mechakoopa_init_return:
    org $03B35A
        mechakoopa_init_end:

    org $03B32F
        mechakoopa_tilemap:
            db $08,$05,$07,$0C
            db $08,$05,$07,$10
            db $08,$05,$07,$14
            db $08,$05,$07,$18
            db $00,$04,$02,$20
            db $00,$04,$02,$20
    org $03B317
        mechakoopa_y_disp:
            db $F8,$F8,$08,$00
            db $F9,$F9,$09,$00
            db $F8,$F8,$08,$00
            db $F9,$F9,$09,$00
            db $FD,$00,$05,$00
            db $00,$00,$08,$00

    org $03B3CA
        mechakoopa_write_hijack:
            jml mechakoopa_write
        warnpc $03B3D1
    org $03B3D1
        mechakoopa_write_end:

    org $03B42F 
        mechakoopa_key_write_hijack:
            jml mechakoopa_key_write
        warnpc $03B433
    org $03B433
        mechakoopa_key_write_end:

    org $03B3F3
        mechakoopa_key_tilemap:
            db $00,$01,$10,$01

pullpc 

    mechakoopa_load:
        lda.b #!dss_id_mechakoopa
        jsl find_and_queue_gfx
        bcs .loaded 
        jml mechakoopa_init_return
    .loaded
        lda #$0B
        sta !15F6,x
        jml mechakoopa_init_end

    mechakoopa_write:
        tax 
        cpx #$10
        phx
        lda.w mechakoopa_tilemap,x
        pha
        and #$03
        tax 
        lda.l .offset,x
        sta $0F
        pla 
        lsr #2
        tax 
        lda !dss_tile_buffer,x
        ora $0F
        sta $0302|!addr,y
        plx 
        jml mechakoopa_write_end

    .offset
        db $00,$01,$10,$11

    mechakoopa_key_write:
        clc 
        adc !dss_tile_buffer+$07
        sta $0302|!addr,y
        plx
        jml mechakoopa_key_write_end