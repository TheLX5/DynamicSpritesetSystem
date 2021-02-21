pushpc

    org $03C26B
        chainsaw_init_hijack:
            jsl chainsaw_load
            jsr GetDrawInfoBnk3
            jml chainsaw_init
        warnpc $03C278
    org $03C278
        chainsaw_init_end:
    org $03C2D8
        chainsaw_init_return:

    org $03C2B6
        chainsaw_write_hijack:
            tax
            lda !dss_tile_buffer,x
            plx
            jml chainsaw_write
        warnpc $03C2C1
    org $03C2C1
        chainsaw_write_end:

    org $03C25B
        chainsaw_motor_tilemap:
            db $00,$01,$02,$01

pullpc

    chainsaw_load:
        lda.b #!dss_id_chainsaw
        jsl find_and_queue_gfx
        bcs .loaded_chainsaw
    .return
        pla 
        pla 
        pla 
        jml chainsaw_init_return
    .loaded_chainsaw
        lda !dss_tile_buffer+$00
        sta !dss_tile_buffer+$03
        lda !dss_tile_buffer+$01
        sta !dss_tile_buffer+$04
        lda.b #!dss_id_motor
        jsl find_and_queue_gfx
        bcc .return
        rtl

    chainsaw_init:
        phx 
        lda !9E,x
        sec 
        sbc #$65
        tax
        lda.w $C25F,x
        jml chainsaw_init_end

    chainsaw_write:
        sta $0302|!addr,y
        lda !dss_tile_buffer+$04
        sta $0306|!addr,y
        lda !dss_tile_buffer+$03
        sta $030A|!addr,y
        jml chainsaw_write_end