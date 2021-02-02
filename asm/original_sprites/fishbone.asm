pushpc
    org $039790
        fishbone_body_write_hijack:
            lda.b #!dss_id_fishbone
            jsl find_and_queue_gfx
            jml fishbone_body_write
        warnpc $03979E
    org $03979E
        fishbone_body_write_end:
    org $0397F8
        fishbone_body_write_return:

    org $0397E0
        fishbone_tail_write_hijack:
            jml fishbone_tail_write
        warnpc $0397E4
    org $0397E4
        fishbone_tail_write_end:

    org $039788
        fishbone_tail_tilemap:
            ;db $A3,$A3
            ;db $B3,$B3
            db $00,$00
            db $10,$10
pullpc

    fishbone_body_write:
        ldy !15EA,x
        bcs .loaded
        lda #$F0
        sta $0301|!addr,y
        jml fishbone_body_write_return
    .loaded
        lda !1558,x
        cmp #$01
        lda.l !dss_tile_buffer+$00
        bcc .no_blink
        lda.l !dss_tile_buffer+$01
    .no_blink
        jml fishbone_body_write_end

    fishbone_tail_write:
        tax 
        lda.w fishbone_tail_tilemap,x
        clc
        adc.l !dss_tile_buffer+$02
        jml fishbone_tail_write_end