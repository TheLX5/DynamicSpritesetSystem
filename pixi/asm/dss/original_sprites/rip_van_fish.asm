pushpc
    org $028E62
        jsl rip_van_fish_z_tiles_write

    org $028E72
        rip_van_fish_z_tiles_write_end:

    org $028DD7
        rip_van_fish_z_tiles:
            db $03,$02,$01,$00
pullpc

    rip_van_fish_z_tiles_write:
        tax
        lda #!dss_id_rip_van_fish
        jsl find_and_queue_gfx
        bcs .loaded
        pla 
        pla 
        pla 
        lda #$F0
        sta $0201|!addr,y
        jml rip_van_fish_z_tiles_write_end
    .loaded
        lda.l rip_van_fish_z_tiles,x
        tax
        lda !dss_tile_buffer+4
        clc
        adc.l .offsets,x
        rtl


    .offsets
        db $00,$01,$10,$11