pushpc
    org $02E9EC
        pipe_lakitu_hijack:
            lda.b #!dss_id_lakitu
            jsl find_and_queue_gfx
            bcs .loaded
            rts
        .loaded
            jsr GetDrawInfoBnk2
            lda $00
            sta $0300|!addr,y
            sta $0304|!addr,y
            lda $01
            sta $0301|!addr,y
            clc
            adc #$10
            sta $0305|!addr,y
            phx
            jml pipe_lakitu_edit
    warnpc $02EA10
    org $02EA10
        pipe_lakitu_return:

    org $02E9E6
        pipe_lakitu_top_tiles:
            db $00,$01,$02
        pipe_lakitu_bottom_tiles:
            db $03,$03,$03
pullpc

pipe_lakitu_edit:
    lda !1602,x
    tax
    phx
    lda.w pipe_lakitu_top_tiles,x
    tax
    lda.l !dss_tile_buffer,x
    sta $0302|!addr,y
    plx
    lda.w pipe_lakitu_bottom_tiles,x
    tax
    lda.l !dss_tile_buffer,x
    jml pipe_lakitu_return