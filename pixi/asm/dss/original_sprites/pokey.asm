pushpc
    org $02B726
        pokey_init_hijack:
            lda.b #!dss_id_pokey
            jsl find_and_queue_gfx
            bcs .loaded
            rts
        .loaded
            jsr GetDrawInfoBnk2
            jml pokey_init
        warnpc $02B736
    org $02B736
        pokey_init_end:

    org $02B78B
        pokey_write_hijack:
            jml pokey_write
        warnpc $02B791
    org $02B791
        pokey_write_end:

    org $02B685
        pokey_single_hijack:
            lda.b #!dss_id_pokey
            jsl find_and_queue_gfx
            bcs .loaded
            rts
        .loaded
            jml pokey_single
        warnpc $02B692
    org $02B692
        pokey_single_end:
pullpc

    pokey_single:
        ldy !15EA,x
        lda !C2,x
        cmp #$01
        lda.l !dss_tile_buffer+$00
        bcc .head
        lda.l !dss_tile_buffer+$01
    .head
        jml pokey_single_end

    pokey_init:
        lda $01
        clc
        adc #$40
        sta $01
        lda !C2,x
        sta $02
        sta $07
        jml pokey_init_end

    pokey_write:
        lda.l !dss_tile_buffer+$01
        bcs .body
        lda.l !dss_tile_buffer+$00
    .body
        jml pokey_write_end
