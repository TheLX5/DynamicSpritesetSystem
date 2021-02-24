pushpc
    org $01F793
        yoshi_egg_write_hijack:
            jml yoshi_egg_write
        warnpc $01F798
    org $01F798
        yoshi_egg_write_end:
    
    org $01F760
        yoshi_egg_tilemap:
            db !smoke_medium_tile
            db $01,$01,$00

    org $01F7BD
        hatching_egg_write_hijack:
            jml hatching_egg_write
        warnpc $01F7C1
    org $01F7C1
        hatching_egg_write_end:
    org $018335
        yoshi_egg_props_2:
            db $09,$07,$05,$07

pullpc

    yoshi_egg_write:
        lda #!dss_id_yoshi_eggs
        jsl find_and_queue_gfx
        bcs .loaded
        lda #$F0
        sta $0301|!addr,y
        jml yoshi_egg_write_end
    .loaded
        lda !dss_tile_buffer+$00
        sta $0302|!addr,y
        jml yoshi_egg_write_end

    hatching_egg_write:
        lda #!dss_id_yoshi_eggs
        jsl find_and_queue_gfx
        bcs .loaded
        pla
        lda #$F0
        sta $0301|!addr,y
        jml hatching_egg_write_end
    .loaded
        pla
        cmp #$02
        bcs .smoke
        tax
        lda.l !dss_tile_buffer,x
        ldx $15E9|!addr
    .smoke
        sta $0302|!addr,y
        jml hatching_egg_write_end