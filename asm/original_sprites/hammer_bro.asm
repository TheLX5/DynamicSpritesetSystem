pushpc
    org $02DAFD
        hammer_bro_init_hijack:
            jml hammer_bro_init
        hammer_bro_init_return:
            rts
        hammer_bro_init_end:
            jsr GetDrawInfoBnk2
        warnpc $02DB05
    org $02DB2D
        hammer_bro_write_hijack:
            jml hammer_bro_write
        warnpc $02DB31 
    org $02DB31 
        hammer_bro_write_end:
    org $02DAF1
        hammer_bro_tilemap:
            db $0A,$08,$00,$04                      ; Facing left
            db $08,$0A,$04,$00                      ; Facing right

    org $02A326
        hammer_projectile_write_hijack:
            jml hammer_projectile_write
        warnpc $02A32A
    org $02A343
        hammer_projectile_write_return:
    org $02A32A
        hammer_projectile_write_end:
    org $02A2DF
        hammer_projectile_tilemap:
            db $00,$01,$01,$00,$00,$01,$01,$00
pullpc

    hammer_projectile_write:
        tax
        lda.b #!dss_id_hammer_projectile
        jsl find_and_queue_gfx
        bcs .loaded
        plx
        lda #$F0
        sta $0202|!addr,y
        jml hammer_projectile_write_return
    .loaded
        phx
        lda.w hammer_projectile_tilemap,x
        tax
        lda.l !dss_tile_buffer,x
        plx 
        jml hammer_projectile_write_end

    hammer_bro_init:
        lda.b #!dss_id_hammer_bro
        jsl find_and_queue_gfx
        bcs .loaded
        jml hammer_bro_init_return
    .loaded
        lda !157C,x
        sta $02
        jml hammer_bro_init_end

    hammer_bro_write:
        pha
        and #$03
        tax
        lda.l .offset,x
        sta $07
        pla
        lsr #2
        tax 
        lda !dss_tile_buffer,x 
        clc
        adc $07
        sta $0302|!addr,y
        plx
        jml hammer_bro_write_end

    .offset
        db $00,$01,$10,$11