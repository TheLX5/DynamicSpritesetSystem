
pushpc 
    org $03883F
        mega_mole_init_hijack:
            lda.b #!dss_id_mega_mole
            jsl find_and_queue_gfx
            bcs .loaded
            rts
        .loaded
            jsr GetDrawInfoBnk3
            jml mega_mole_init
        warnpc $038850
    org $038850
        mega_mole_init_end:

    org $03887B
        mega_mole_write_hijack:
            jml mega_mole_write
        warnpc $038881
    org $038881
        mega_mole_write_end:

    org $038837
        mega_mole_tilemap:
            db $00,$01,$02,$03
            db $04,$05,$06,$07

pullpc

    mega_mole_init:
        lda !151C,x
        sta $02
        lda $14
        lsr #2
        clc 
        adc $15E9|!addr
        jml mega_mole_init_end
    
    mega_mole_write:
        lda.l !dss_tile_buffer,x
        sta $0302|!addr,y
        jml mega_mole_write_end