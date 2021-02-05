pushpc
    org $02DE3E
        sumo_bro_init_hijack:
            lda.b #!dss_id_sumo_bro
            jsl find_and_queue_gfx
            bcs .loaded
            rts
        .loaded
            jsr GetDrawInfoBnk2
            jml sumo_bro_init
        warnpc $02DE50
    org $02DE50
        sumo_bro_init_end:

    org $02DE78
        sumo_bro_write_hijack:
            jml sumo_bro_write
        warnpc $02DE83
    org $02DE83
        sumo_bro_write_end:
            sec 

    org $02DE0E
        sumo_bro_tilemap:
            db $0A,$0B,$0C,$10
            db $0A,$0B,$14,$18
            db $0A,$0B,$14,$18
            db $04,$04,$1C,$20
            db $00,$00,$24,$28
            db $00,$00,$24,$28


    org $02F940
        flame_pillar_init_hijack:
            jmp flame_pillar_init
        flame_pillar_init_end:
    org $02F9A5
        flame_pillar_init_return:
    org $02F97D
        flame_pillar_hijack:
            jml flame_pillar_write
        flame_pillar_init:
            jml flame_pillar_init2
        warnpc $02F987
    org $02F987
        flame_pillar_end:
    org $02F904
        flame_pillar_tilemap:
            db $01,$02
            db $00,$02
            db $00,$01
            db $00,$00
pullpc

    flame_pillar_init2:
        lda #!dss_id_fire_pillar
        jsl find_and_queue_gfx
        bcs .loaded
        jml flame_pillar_init_return
    .loaded
        txa 
        asl
        tay
        jml flame_pillar_init_end

    flame_pillar_write:
        phx
        lda.w flame_pillar_tilemap,x
        tax
        lda !dss_tile_buffer,x
        sta $0302|!addr,y
        plx
        lda $14
        and #$04
        jml flame_pillar_end

    sumo_bro_init:
        lda !157C,x
        lsr 
        ror #2
        and #$40
        eor #$40
        sta $02
        ldy !15EA,x
        jml sumo_bro_init_end

    sumo_bro_write:
        phx
        lda.w sumo_bro_tilemap,x
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
        plx
        jml sumo_bro_write_end
    .offset
        db $00,$01,$10,$11