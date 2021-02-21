pushpc
    org $02BFC5
        jmp fix_urchin_gfx_end

    org $02BF5C
        urchin_init_hijack:
            lda #!dss_id_urchin
            jsl find_and_queue_gfx
            bcs .loaded
            rts
        .loaded
            jsl urchin_init
        warnpc $02BF69

    org $02BF9E
        urchin_write_hijack:
            txa
            beq .eyes
        .body
            ldx $02
            lda.w urchin_body_tilemap,x
            tax
            lda.l !dss_tile_buffer,x
            bra urchin_write_end
        .eyes
            jml urchin_write_eyes 
        warnpc $02BFB1
    org $02BFB1
        urchin_write_end:

    org $02BF58
        urchin_body_tilemap:
            ;db $C4,$C6,$C8,$C6
            db $00,$01,$02,$01
pullpc

    urchin_init:
        lda !163E,x
        bne .dont_animate
        inc !1528,x
        lda #$0C
        sta !163E,x
    .dont_animate
        rtl

    urchin_write:
    .eyes
        lda.l !dss_tile_buffer+$03
        ldx $03
        beq ..open
        lda.l !dss_tile_buffer+$04
    ..open
        jml urchin_write_end