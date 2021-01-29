if !pass == 0

    org $02E6A7
        lakitu_fishing_hijack:
            jml lakitu_fishing

    org $02E6B1
        lakitu_fishing_end:

    org $02E636
        lakitu_fishing_return:

    org $02E706
        lakitu_fishing_line_hijack:
            jml lakitu_fishing_line
    
    org $02E70B
        lakitu_fishing_line_end:

else 

    lakitu_fishing:
        lda #!dss_id_lakitu
        jsl find_and_queue_gfx
        lda.l !dss_tile_buffer+4
        sta $0302|!addr,y
        lda #$24
        sta $0306|!addr,y
        lda #!dss_id_misc_tiles_2
        jsl find_and_queue_gfx
        bcs .loaded 
        lda #$F0
        sta $0301|!addr,y
        sta $0305|!addr,y
        jml lakitu_fishing_return
    .loaded
        jml lakitu_fishing_end

    lakitu_fishing_line:
        lda.l !dss_tile_buffer
        inc
        sta $0302|!addr,y
        jml lakitu_fishing_line_end

endif 