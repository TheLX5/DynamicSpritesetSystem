pushpc
    org $039010 
        reflecting_fireball_write_hijack:
            jml reflecting_fireball_write
        warnpc $039015
    org $039015
        reflecting_fireball_write_end:
    org $03901F
        reflecting_fireball_write_return:
pullpc

    reflecting_fireball_write:
        lda #!dss_id_reflecting_fireball
        jsl find_and_queue_gfx
        bcs .loaded
        lda #$F0
        sta $0301|!addr,y
        jml reflecting_fireball_write_return
    .loaded
        lda.l !dss_tile_buffer+$00
        sta $0302|!addr,y
        jml reflecting_fireball_write_end
