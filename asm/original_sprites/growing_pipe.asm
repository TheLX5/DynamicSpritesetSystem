pushpc
    org $02E902
        vertical_growing_pipe_write_hijack:
            lda.b #!dss_id_vertical_growing_pipe
            jsl find_and_queue_gfx
            bcs .loaded
            rts
        .loaded
            jsr GetDrawInfoBnk2
            lda $00
            sta $0300|!addr,y
            clc
            adc #$10
            sta $0304|!addr,y
            lda $01
            dec
            sta $0301|!addr,y
            sta $0305|!addr,y
            jml vertical_growing_pipe_write
        warnpc $02E92E
    org $02E92E
        vertical_growing_pipe_write_end:
pullpc

    vertical_growing_pipe_write:
        lda.l !dss_tile_buffer+$00
        sta $0302|!addr,y
        lda.l !dss_tile_buffer+$01
        sta $0306|!addr,y
        lda !15F6,x
        ora $64
        sta $0303|!addr,y
        sta $0307|!addr,y
        jml vertical_growing_pipe_write_end