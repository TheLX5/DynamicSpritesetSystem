pushpc
    org $02EE03
        floating_skulls_write_hijack:
            jml floating_skulls_write
        warnpc $02EE09
    org $02EE09
        floating_skulls_write_end:
    org $02EDF5
        floating_skulls_write_return:
pullpc 

    floating_skulls_write:
        php
        lda.b #!dss_id_floating_skull
        jsl find_and_queue_gfx
        bcs .loaded 
        plp 
        lda #$F0 
        sta $0301|!addr,y
        jml floating_skulls_write_return
    .loaded 
        lda !dss_tile_buffer+$00
        plp 
        bcc .anim 
        lda !dss_tile_buffer+$01
    .anim 
        jml floating_skulls_write_end
