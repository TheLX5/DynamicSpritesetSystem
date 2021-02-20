pushpc
    org $02EF2E
        db !smoke_large_tile            ; cloud tile
    org $02EF56
        db !cloud_face_tile             ; face tile
    org $02EF5B
        db $38                          ; face props
    org $029D4A
        coin_game_write_hijack:
            jml coin_game_write
        warnpc $029D4F
    org $029D4F
        coin_game_write_end:
            lda #$05
    org $029D59
        coin_game_write_return:
pullpc

    coin_game_write:
        lda.b #!dss_id_smiling_coin
        jsl find_and_queue_gfx
        bcs .loaded
        lda #$F0
        sta $0201|!addr,y
        jml coin_game_write_return
    .loaded
        lda.l !dss_tile_buffer+$00
        sta $0202|!addr,y
        jml coin_game_write_end