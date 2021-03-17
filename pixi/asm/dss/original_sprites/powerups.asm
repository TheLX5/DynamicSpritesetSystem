pushpc
    org $01C6D6
        powerups_write_hijack:
            jml powerups_write
        warnpc $01C6DA
    org $01C6DA
        powerups_write_end:
    org $01C6E5
        powerups_write_return:
    org $01C609
        powerups_gfx_indices:
            db !dss_id_mushroom
            db !dss_id_fire_flower
            db !dss_id_star
            db !dss_id_feather
            db !dss_id_mushroom
            db !dss_id_null
            db !dss_id_null
            db !dss_id_null
            db !dss_id_null
            db !dss_id_p_balloon
            db !dss_id_red_coin
            db !dss_id_mushroom
            db !dss_id_key
    org $01DEE3
        bonus_items_tilemaps:
            db $00,$00,$FF,$FF          ; 0 - Star (bottom)
            db $00,$00,$00,$00          ; 1 - Star
            db $FF,$FF,$00,$00          ; 2 - Star (top)
            db $01,$01,$FF,$FF          ; 3 - Mushroom (bottom)
            db $01,$01,$01,$01          ; 4 - Mushroom
            db $FF,$FF,$01,$01          ; 5 - Mushroom (top)
            db $02,$02,$FF,$FF          ; 6 - Fireflower (bottom)
            db $02,$02,$02,$02          ; 7 - Fireflower
            db $FF,$FF,$02,$02          ; 8 - Fireflower (top)
    org $01DF07
        bonus_items_props:
            db $05,$05,$05              ; Star
            db $09,$09,$09              ; Mushroom
            db $0B,$0B,$0B              ; Fireflower
    org $01DF19
        bonus_items_init_hijack:
            jml bonus_items_init
        warnpc $01DF1D
    org $01DF1D
        bonus_items_init_end:
    org $01DFC0
        bonus_items_init_return2:

    org $01DF74
        bonus_items_write_hijack:
            jml bonus_items_write
            ;# Signature
                db "DSS"
            ;# Version number
                dw 0101
            ;# Shared routine
                dl find_and_queue_gfx
        warnpc $01DF91
    org $01DF91
        bonus_items_write_end:

    org $02FE5D
        bonus_mushroom_write_hijack:
            jml bonus_mushroom_write
        warnpc $02FE67
    org $02FE67
        bonus_mushroom_write_end:
pullpc

    powerups_write:
        tax
        lda.l powerups_gfx_indices,x
        jsl find_and_queue_gfx
        bcs .loaded
        lda #$F0
        sta $0301|!addr,y
        ldx $15E9|!addr
        jml powerups_write_return
    .loaded
        lda.l !dss_tile_buffer
        jml powerups_write_end
        
    bonus_items_init:
        lda.b #!dss_id_bonus_box
        jsl find_and_queue_gfx
        bcs .loaded_box
    .return
        jml bonus_items_init_return2
    .loaded_box
        lda.l !dss_tile_buffer+$00
        sta.l !dss_tile_buffer+$03
        lda.b #!dss_id_fire_flower
        jsl find_and_queue_gfx
        bcc .return
    .loaded_fire_flower
        lda.l !dss_tile_buffer+$00
        sta.l !dss_tile_buffer+$02
        lda.b #!dss_id_mushroom
        jsl find_and_queue_gfx
        bcc .return
    .loaded_mushroom
        lda.l !dss_tile_buffer+$00
        sta.l !dss_tile_buffer+$01
        lda.b #!dss_id_star
        jsl find_and_queue_gfx
        bcc .return
    .loaded_star
        lda !1540,x
        lsr 
        jml bonus_items_init_end

    bonus_items_write:
    .tile_1
        lda.w bonus_items_tilemaps+$00,x
        bpl ..apply_tile
        lda #$F0
        sta $0301|!addr,y
        bra ..skip_tile
    ..apply_tile
        phx
        tax
        lda.l !dss_tile_buffer,x
        plx
        clc
        adc.l bonus_items_offsets+$00,x
        sta $0302|!addr,y
    ..skip_tile
    .tile_2
        lda.w bonus_items_tilemaps+$01,x
        bpl ..apply_tile
        lda #$F0
        sta $0305|!addr,y
        bra ..skip_tile
    ..apply_tile
        phx
        tax
        lda.l !dss_tile_buffer,x
        plx
        clc
        adc.l bonus_items_offsets+$01,x
        sta $0306|!addr,y
    ..skip_tile
    .tile_3
        lda.w bonus_items_tilemaps+$02,x
        bpl ..apply_tile
        lda #$F0
        sta $0309|!addr,y
        bra ..skip_tile
    ..apply_tile
        phx
        tax
        lda.l !dss_tile_buffer,x
        plx
        clc
        adc.l bonus_items_offsets+$02,x
        sta $030A|!addr,y
    ..skip_tile
    .tile_4
        lda.w bonus_items_tilemaps+$03,x
        bpl ..apply_tile
        lda #$F0
        sta $030D|!addr,y
        bra ..skip_tile
    ..apply_tile
        phx
        tax
        lda.l !dss_tile_buffer,x
        plx
        clc
        adc.l bonus_items_offsets+$03,x
        sta $030E|!addr,y
    ..skip_tile
    .box
        lda.l !dss_tile_buffer+$03
        sta $0312|!addr,y
        jml bonus_items_write_end

    bonus_mushroom_write:
        lda.l !dss_tile_buffer+$01
        sta $0202|!addr,y
        lda #$3B
        sta $0203|!addr,y
        jml bonus_mushroom_write_end


    bonus_items_offsets:
        db $10,$11,$FF,$FF          ; 0 - Star (bottom)
        db $00,$01,$10,$11          ; 1 - Star
        db $FF,$FF,$00,$01          ; 2 - Star (top)
        db $10,$11,$FF,$FF          ; 3 - Mushroom (bottom)
        db $00,$01,$10,$11          ; 4 - Mushroom
        db $FF,$FF,$00,$01          ; 5 - Mushroom (top)
        db $10,$11,$FF,$FF          ; 6 - Fireflower (bottom)
        db $00,$01,$10,$11          ; 7 - Fireflower
        db $FF,$FF,$00,$01          ; 8 - Fireflower (top)