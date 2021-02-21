pushpc

    org $01DC54
        rope_init_hijack:
            jsl rope_load
            jsr GetDrawInfoBnk1
            jml rope_init
        warnpc $01DC60
    org $01DC60
        rope_init_end:
    org $01DDB4
        rope_init_return:

    org $01DCA2
        rope_write_hijack:
            jml rope_write
        warnpc $01DCA7
    org $01DCA7
        rope_write_end:

    org $01DC47
        motor_tilemap:
            db $00,$01,$02,$01
    org $01DC4B
        rope_tilemap:
            db $04,$03,$03,$03,$03,$03,$03,$03
            db $03
        warnpc $01DC54

    org $01DCB9
        rope_bottom_write_hijack:
            jml rope_bottom_write
    org $01DCBE
        rope_bottom_write_end:

pullpc 

    rope_load:
        lda.b #!dss_id_rope
        jsl find_and_queue_gfx
        bcs .loaded_rope
    .return
        pla 
        pla 
        pla 
        jml rope_init_return
    .loaded_rope
        lda !dss_tile_buffer+$00
        sta !dss_tile_buffer+$03
        lda !dss_tile_buffer+$01
        sta !dss_tile_buffer+$04
        lda.b #!dss_id_motor
        jsl find_and_queue_gfx
        bcc .return
        rtl

    rope_init:
        lda $00
        sec 
        sbc #$08
        sta $00
        lda $01
        jml rope_init_end

    rope_write:
        phx 
        tax 
        lda.l !dss_tile_buffer,x
        sta $0302|!addr,y
        plx 
        lda #$37
        jml rope_write_end

    rope_bottom_write:
        lda !dss_tile_buffer+$04
        sta $02FE|!addr,y
        jml rope_bottom_write_end