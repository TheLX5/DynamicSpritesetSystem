pushpc
    org $02D848
        rotating_gray_platform_write_hijack:
            lda #!dss_id_brown_platform
            jsl find_and_queue_gfx
            bcs .platform_loaded
        .abort
            rts
        .platform_loaded
            lda.l !dss_tile_buffer+$00
            sta.l !dss_tile_buffer+$03
            lda #!dss_id_brown_platform_chain
            jsl find_and_queue_gfx
            bcc .abort
        .chain_loaded
            jsr GetDrawInfoBnk2
            jsl rotating_gray_platform_write
            ldx $15E9|!addr
            rts
        warnpc $02D86F

    org $02D840
        rotating_gray_platform_x_offset:
    org $02D844
        rotating_gray_platform_tilemap:
            ;db $A2,$60,$61,$62
            db $00,$03,$01,$02
        warnpc $02D848
pullpc

    rotating_gray_platform_write:
        ldx #$03
    .loop
        lda $00
        clc
        adc.w rotating_gray_platform_x_offset,x
        sta $0300|!addr,y
        lda $01
        sta $0301|!addr,y
        phx
        lda.w rotating_gray_platform_tilemap,x
        tax
        lda.l !dss_tile_buffer,x
        plx
        sta $0302|!addr,y
        lda #$33
        sta $0303|!addr,y
        iny #4
        dex 
        bpl .loop
        rtl
