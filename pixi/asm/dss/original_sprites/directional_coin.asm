pushpc

    org $02E24C
        solid_directional_coin_hijack:
            jml solid_directional_coin
        warnpc $02E254
    org $02E254
        solid_directional_coin_end:
    org $02E259
        solid_directional_coin_return:

pullpc 

    solid_directional_coin:
        lda.b #!dss_id_used_block
        jsl find_and_queue_gfx
        bcs .loaded
        lda #$F0
        sta $0301|!addr,y
        jml solid_directional_coin_return
    .loaded
        lda !dss_tile_buffer
        sta $0302|!addr,y
        lda $0303|!addr,y
        ora #$01
        jml solid_directional_coin_end