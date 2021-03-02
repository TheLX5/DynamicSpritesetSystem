pushpc

    org $0386A8
        flying_grey_turnblocks_init_hijack:
            lda.b #!dss_id_turn_block
            jsl find_and_queue_gfx
            bcs .loaded
            rts 
        .loaded
            jsr GetDrawInfoBnk3
            jml flying_grey_turnblocks_init
        warnpc $0386B8
    org $0386B8
        flying_grey_turnblocks_init_end:
    
    org $03868A
        flying_grey_turnblocks_tilemap:
            db $FF,$FF,$FF,!big_wing_tile,!big_wing_tile
            db $FF,$FF,$FF,!small_wing_tile,!small_wing_tile
    org $038694
        flying_grey_turnblocks_props:
            db $33,$33,$33,$72,$32
            db $33,$33,$33,$72,$32

    org $0386D4
        flying_grey_turnblocks_write_hijack:
            jml flying_grey_turnblocks_write
        warnpc $0386DA
    org $0386DA
        flying_grey_turnblocks_write_end:

pullpc 

    flying_grey_turnblocks_init:
        ldy !15EA,x
        lda $14
        lsr 
        and #$04
        beq .anim
        inc
    .anim 
        sta $02
        jml flying_grey_turnblocks_init_end

    flying_grey_turnblocks_write:
        lda.w flying_grey_turnblocks_tilemap,x
        cmp #$FF 
        bne .original
        lda !dss_tile_buffer
    .original 
        sta $0302|!addr,y
        jml flying_grey_turnblocks_write_end