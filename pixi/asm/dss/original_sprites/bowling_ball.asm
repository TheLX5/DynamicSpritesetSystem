pushpc

    org $03B221
        bowling_ball_init_hijack:
            jml bowling_ball_load
        warnpc $03B226
    org $03B226
        bowling_ball_init_end:
    org $03B2A6
        bowling_ball_init_return:

    org $03B23E
        bowling_ball_write_hijack:
            jml bowling_ball_write
        warnpc $03B244
    org $03B244
        bowling_ball_write_end:

    org $03B1ED
        bowling_ball_tilemap:
            db $00,$04,$00
            db $08,$0C,$08
            db $00,$04,$00
            db $15,$14,$10

pullpc 

    bowling_ball_load:
        lda.b #!dss_id_bowling_ball
        jsl find_and_queue_gfx
        bcs .loaded
        jml bowling_ball_init_return
    .loaded
        lda #$70
        sta !15EA,x
        jml bowling_ball_init_end

    bowling_ball_write:
        phx 
        lda.w bowling_ball_tilemap,x
        pha
        and #$03
        tax 
        lda.l .offset,x
        sta $0F
        pla
        lsr #2
        tax 
        lda.l !dss_tile_buffer,x
        ora $0F
        plx 
        sta $0302|!addr,y
        jml bowling_ball_write_end

    .offset
        db $00,$01,$10,$11