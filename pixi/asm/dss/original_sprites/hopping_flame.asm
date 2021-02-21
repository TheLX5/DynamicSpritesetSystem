pushpc
    org $02A23F
        hopping_flame_remnant_hijack:
            jml hopping_flame_remnant
        hopping_flame_remnant_end:

    org $02A253
        hopping_flame_remnant_return:

    org $02A217
        hopping_flame_remnant_tiles:
            db $00,$01
pullpc

    hopping_flame_remnant:
        tax
        lda #!dss_id_hopping_flame
        jsl find_and_queue_gfx
        bcs .loaded
        lda #$F0
        sta $0201|!addr,y
        jml hopping_flame_remnant_return
    .loaded
        lda.w hopping_flame_remnant_tiles,x
        clc
        adc.l !dss_tile_buffer+2
        jml hopping_flame_remnant_end