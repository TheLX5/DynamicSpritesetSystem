pushpc
    org $02D9D6
        bubble_init_hijack:
            jsl bubble_shine_load
            lda.b #!dss_id_bubble
            jsl find_and_queue_gfx
            bcs .loaded
        .return
            rts
        .loaded
            jsr GetDrawInfoBnk2
            jml bubble_init
        warnpc $02D9EA
    org $02D9EA
        bubble_init_end:
    org $02D9D2
        bubble_animation_offsets:

    org $02DA11
        bubble_write_hijack:
            jml bubble_write
        warnpc $02DA17
    org $02DA17
        bubble_write_end:

    org $02D9C3 
        bubble_tilemap:
            ;db $A0,$A0,$A0,$A0,$99 
            db $00,$00,$00,$00,$01

    org $02D8E4
        bubble_item_hijack:
            jml bubble_item
        warnpc $02D8E8
    org $02D8E8
        bubble_item_end:

    org $02D8A1
        bubble_item_anim_frame_1:
            db $00,$00,$00,$00

    org $02D8A5
        bubble_item_anim_frame_2:
            db $01,$01,$01,$00

    org $02D8A9
        bubble_item_props:
            db $85,$85,$05,$09
pullpc

    bubble_item:
        pha
        lda.l bubble_item_gfx,x
        plx
        jsl find_and_queue_gfx
        bcs .loaded
        lda #$F0
        dey
        bra .return
    .loaded
        lda !dss_tile_buffer,x
    .return
        sta $0302|!addr,y
        plx
        jml bubble_item_end
    
    bubble_item_gfx:
        db !dss_id_goomba
        db !dss_id_bobomb
        db !dss_id_cheep_cheep
        db !dss_id_mushroom

    bubble_shine_load:
        lda.b #!dss_id_misc_tiles_2
        jsl find_and_queue_gfx
        bcs .loaded
        pla 
        pla 
        pla
        jml bubble_init_hijack_return
    .loaded
        lda !dss_tile_buffer+$00
        sta !dss_tile_buffer+$01
        rtl

    bubble_init:
        lda $14
        lsr #3
        and #$03
        tay 
        lda.w bubble_animation_offsets,y
        sta $02
        lda !15EA,x
        sec
        jml bubble_init_end

    bubble_write:
        lda.l !dss_tile_buffer+$00
        cpx #$04
        bne .big
        lda.l !dss_tile_buffer+$01
        clc
        adc #$11
    .big
        sta $0302|!addr,y
        jml bubble_write_end
