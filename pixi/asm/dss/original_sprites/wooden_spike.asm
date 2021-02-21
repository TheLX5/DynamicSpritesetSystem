pushpc
    org $0394CF
        wooden_spike_init_hijack:
            lda #!dss_id_wooden_spike
            jsl find_and_queue_gfx
            bcs .loaded
            rts
        .loaded
            jsr GetDrawInfoBnk3
            jml wooden_spike_init
        warnpc $0394DF
    org $0394DF
        wooden_spike_init_end:

    
    org $0394F5
        wooden_spike_write_hijack:
            lda.w wooden_spike_props,x
            sta $0303|!addr,y
            jml wooden_spike_write
        warnpc $039501
    org $039501
        wooden_spike_write_end:

    org $0394C5
        wooden_spike_props:
    org $0394BB
        wooden_spike_tilemap:
            ;db $6A,$6A,$6A,$6A,$4A                  ; Downwards-pointing
            ;db $6A,$6A,$6A,$6A,$4A                  ; Upwards-pointing
            db $01,$01,$01,$01,$00                  ; Downwards-pointing
            db $01,$01,$01,$01,$00                  ; Upwards-pointing
        warnpc $0394C5
pullpc

    wooden_spike_init:
        stz $02
        lda !9E,x
        cmp #$AD
        bne .normal
        lda #$05
        sta $02
    .normal
        phx
        jml wooden_spike_init_end

    wooden_spike_write:
        lda.w wooden_spike_tilemap,x
        tax
        lda.l !dss_tile_buffer,x
        sta $0302|!addr,y
        jml wooden_spike_write_end