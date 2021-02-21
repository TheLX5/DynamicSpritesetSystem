pushpc
    org $03921B
        falling_spike_write_hijack:
            jml falling_spike_write
        warnpc $039220
    org $039220
        falling_spike_write_end:
    org $03926C
        falling_spike_write_return:
pullpc

    falling_spike_write:
        lda #!dss_id_falling_spike
        jsl find_and_queue_gfx
        bcs .loaded
        lda #$F0
        sta $0301|!addr,y
        jml falling_spike_write_return
    .loaded
        lda.l !dss_tile_buffer+$00
        sta $0302|!addr,y
        jml falling_spike_write_end