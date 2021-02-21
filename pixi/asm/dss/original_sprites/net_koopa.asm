pushpc
    org $01B973
        net_koopa_gfx_page:
            db $01,$01,$01,$01,$01
            db $01,$01,$01,$01,$01

    org $01BA53
        net_koopa_load_gfx_hijack:
            jml net_koopa_load_gfx
    
    org $01BA57
        net_koopa_load_gfx_end:

    org $01BA7E
        net_koopa_load_gfx_return:
pullpc

    net_koopa_load_gfx:
        lda #!dss_id_koopa 
        jsl find_and_queue_gfx
        bcs .loaded
        jml net_koopa_load_gfx_return
    .loaded
        lda !157C,x
        pha
        jml net_koopa_load_gfx_end