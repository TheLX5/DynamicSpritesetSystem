pushpc
    org $0383C2
        big_boo_init_hijack:
            lda.b #!dss_id_big_boo
            jsl find_and_queue_gfx
            bcs .loaded
            rts
        .loaded
            jsr GetDrawInfoBnk3
            jml big_boo_init
        warnpc $0383D2 
    org $0383D2 
        big_boo_init_end:
    org $0382F8
        big_boo_tilemap:
            db $0C,$0E,$10,$00,$04,$04,$00,$01
            db $05,$05,$01,$02,$06,$08,$0A,$03
            db $07,$09,$0B,$10
            db $0C,$0E,$10,$00,$04,$04,$00,$01
            db $05,$05,$01,$02,$06,$08,$0A,$03
            db $07,$09,$0B,$10
            db $0C,$0E,$10,$00,$04,$04,$00,$01
            db $05,$05,$01,$02,$06,$06,$02,$03
            db $07,$07,$03,$10
            db $10,$10,$0D,$0F,$00,$04,$04,$00
            db $01,$05,$05,$01,$02,$06,$08,$0A
            db $03,$07,$09,$0B
        warnpc $038348
    org $0383E1
        big_boo_write_hijack:
            jml big_boo_write
        warnpc $0383E6
    org $0383E6
        big_boo_write_end:
;V:172 H: 23 F:22
;V:253 H:193 F:22
pullpc 

    big_boo_init:
        lda !1602,x
        sta $06
        asl #2
        sta $03
        asl #2
        adc $03
        jml big_boo_init_end

    big_boo_write:
        ldx $02
        lda.w big_boo_tilemap,x
        tax
        lda.l !dss_tile_buffer,x
        ldx $02
        jml big_boo_write_end