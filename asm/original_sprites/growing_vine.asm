pushpc 
    org $01C19D
        growing_vine_write_hijack:
            jml growing_vine_write
        warnpc $01C1A3
    org $01C1A3
        growing_vine_write_end:
    org $01C1A6
        growing_vine_write_return:
pullpc 

    growing_vine_write:
        php
        lda.b #!dss_id_piranha_plant
        jsl find_and_queue_gfx
        bcs .loaded
        lda #$F0
        sta $0301|!addr,y
        plp
        jml growing_vine_write_return
    .loaded
        plp
        lda !dss_tile_buffer+$00
        bcc .store_tile
        lda !dss_tile_buffer+$01
    .store_tile
        jml growing_vine_write_end