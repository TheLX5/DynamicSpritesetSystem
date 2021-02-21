pushpc

    org $0388B2
        swooper_bat_write_hijack:
            jml swooper_bat_write 
        warnpc $0388B6 
    org $0388B6
        swooper_bat_write_end:

    org $0388A0
        swooper_bat_tilemap:
            db $00,$01,$02

    org $02FDAA 
        swooper_ceiling_write_hijack:
            jml swooper_ceiling_write
        warnpc $02FDAE
    org $02FDAE
        swooper_ceiling_write_end:
    org $02FDB6
        swooper_ceiling_write_return:

    org $02FDB8
        swooper_ceiling_tilemap:
            db $00,$00,$01,$02

pullpc

    swooper_bat_write:
        tax 
        lda.b #!dss_id_swooper_bat
        jsl find_and_queue_gfx
        bcs .loaded
        plx 
        lda #$F0
        sta $0301|!addr,y
        jml swooper_bat_write_end
    .loaded 
        lda.l !dss_tile_buffer,x
        sta $0302|!addr,y
        plx 
        jml swooper_bat_write_end

    swooper_ceiling_write:
        tax
        lda.b #!dss_id_swooper_bat
        jsl find_and_queue_gfx
        bcs .loaded
        lda #$F0 
        sta $0301|!addr,y
        jml swooper_ceiling_write_return
    .loaded 
        lda.w swooper_ceiling_tilemap,x 
        tax 
        lda !dss_tile_buffer,x 
        jml swooper_ceiling_write_end
