pushpc
    org $01FA23
        boo_block_write_hijack:
            jml boo_block_write
        warnpc $01FA27
    org $01FA27
        boo_block_write_end:
    org $01FA35
        boo_block_write_return:
    org $01FA37
        boo_block_tilemap:
            db $02,$00,$01
    org $01FA3A
            db $02,$02,$02
pullpc 

    boo_block_write:
        tax
        lda #!dss_id_boo
        jsl find_and_queue_gfx
        bcc .not_loaded
        lda.l !dss_tile_buffer+$01
        sta.l !dss_tile_buffer+$02
        lda #!dss_id_boo_block
        jsl find_and_queue_gfx
        bcs .loaded
    .not_loaded
        lda #$F0
        sta $0301|!addr,y
        jml boo_block_write_return
    .loaded
        lda.w boo_block_tilemap,x
        tax
        lda.l !dss_tile_buffer,x
        jml boo_block_write_end