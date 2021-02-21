pushpc

    org $02ECDE
        super_koopa_init_hijack:
            lda.b #!dss_id_super_koopa
            jsl find_and_queue_gfx
            bcs .loaded
            rts
        .loaded
            jsr GetDrawInfoBnk2
            jml super_koopa_init
        warnpc $02ECF0
    org $02ECF0
        super_koopa_init_end:

    org $02EC72 
        super_koopa_tilemap:
            db $10,$12,$0F,$00                      ; 0 - Walking A
            db $11,$13,$0D,$04                      ; 1 = Walking B
            db $18,$19,$0E,$08                      ; 2 = Flight A
            db $1A,$1B,$0E,$08                      ; 3 = Flight B
            db $16,$14,$00,$0C                      ; 4 = Dying A
            db $17,$15,$00,$0C                      ; 5 = Dying B
            db $18,$19,$00,$0C                      ; 6 = Running A
            db $1A,$1B,$04,$0C                      ; 7 = Running B / Jumping A
            db $18,$19,$04,$0C                      ; 8 = Jumping B
    org $02EC96
        super_koopa_props:
            db $03,$03,$03,$01                      ; Bit 1 being set indicates the tile is a cape tile.
            db $03,$03,$03,$01
            db $03,$03,$01,$01
            db $03,$03,$01,$01
            db $83,$83,$81,$01
            db $83,$83,$81,$01
            db $03,$03,$01,$01
            db $03,$03,$01,$01
            db $03,$03,$01,$01

    org $02ED06
        super_koopa_write_hijack:
            jml super_koopa_write
        warnpc $02ED0C
    org $02ED0C
        super_koopa_write_end:
pullpc

    super_koopa_write:
        phx
        lda.w super_koopa_tilemap,x
        tax 
        pha 
        and #$03
        tax 
        lda.l .offset,x
        sta $06
        pla
        lsr #2
        tax 
        lda.l !dss_tile_buffer,x
        clc 
        adc $06
        sta $0302|!addr,y
    .return
        plx
        jml super_koopa_write_end
    
    .offset
        db $00,$01,$10,$11

    super_koopa_init:
        lda !157C,x
        sta $02
        lda !15F6,x
        and #$0E
        sta $05
        lda !1602,x
        jml super_koopa_init_end