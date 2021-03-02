pushpc

    org $02DC3F
        hammer_bro_platform_init_hijack:
            lda.b #!dss_id_turn_block
            jsl find_and_queue_gfx
            bcs .loaded
            rts 
        .loaded
            jsr GetDrawInfoBnk2
            jml hammer_bro_platform_init
        warnpc $02DC50
    org $02DC50
        hammer_bro_platform_init_end:


    org $02DC8A
        hammer_bro_platform_write_hijack:
            jml hammer_bro_platform_write
        warnpc $02DC8E
    org $02DC8E
        hammer_bro_platform_write_end:

    org $02DC1F
        hammer_bro_platform_tilemap:
            db $FF,$FF,!big_wing_tile,!big_wing_tile
            db $FF,$FF,!small_wing_tile,!small_wing_tile

    org $02DC27
        hammer_bro_platform_props:
            db $33,$33,$72,$32
            db $33,$33,$72,$32
pullpc 

    hammer_bro_platform_init:
        lda !C2,x
        sta $07
        lda !1558,x
        lsr 
        tay 
        lda.w $DC37,y
        sta $05
        jml hammer_bro_platform_init_end

    hammer_bro_platform_write: 
        plx 
        lda.w hammer_bro_platform_tilemap,x
        cmp #$FF
        bne .original
        lda.l !dss_tile_buffer
    .original
        jml hammer_bro_platform_write_end