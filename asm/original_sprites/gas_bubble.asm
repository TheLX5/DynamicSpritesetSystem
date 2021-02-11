pushpc
    org $02E3AA
        gas_bubble_init_hijack:
            lda.b #!dss_id_gas_bubble
            jsl find_and_queue_gfx
            bcs .loaded
            rts
        .loaded
            jsr GetDrawInfoBnk2
            jml gas_bubble_init
        warnpc $02E3BB
    org $02E3BB
        gas_bubble_init_end:
    org $02E3A2
        gas_bubble_x_offset_extra:
    org $02E372
        gas_bubble_tilemap:
            db $00,$01,$02,$03
            db $04,$05,$06,$07
            db $04,$05,$06,$07
            db $00,$01,$02,$03
    org $02E3FC
        gas_bubble_write_hijack:
            jml gas_bubble_write
        warnpc $02E402
    org $02E402
        gas_bubble_write_end:
pullpc

    gas_bubble_init:
        lda !1570,x
        lsr #3
        and #$03
        tay
        lda.w gas_bubble_x_offset_extra,y
        sta $02
        jml gas_bubble_init_end
    
    gas_bubble_write:
        lda.w gas_bubble_tilemap,x
        phx
        tax
        lda.l !dss_tile_buffer,x
        plx
        sta $0302|!addr,y
        jml gas_bubble_write_end

