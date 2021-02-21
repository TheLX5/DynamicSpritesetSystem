pushpc
    org $01B2DF
        brown_checker_platform_hijack:
            lda #!dss_id_brown_platform
            ldy !1602,x
            beq .brown_platform
            lda #!dss_id_checkerboard_platform
        .brown_platform
            jsl find_and_queue_gfx
            bcs .loaded
            rts
        .loaded
            jsr GetDrawInfoBnk1
            lda !1602,x
            sta $01

        .y_pos
            lda !D8,x
            sec 
            sbc $1C
            sta $0301|!addr,y
            sta $0305|!addr,y
            sta $0309|!addr,y
            ldx $01
            beq ..short
        ..large
            sta $030D|!addr,y
            sta $0311|!addr,y
        ..short

        .props
            ldx $15E9|!addr
            lda $64
            ora !15F6,x
            sta $0303|!addr,y
            sta $0307|!addr,y
            sta $030B|!addr,y
            sta $030F|!addr,y
            sta $0313|!addr,y
            
        .x_pos
            lda !E4,x
            sec 
            sbc $1A
            sta $0300|!addr,y
            clc 
            adc #$10
            sta $0304|!addr,y
            clc
            adc #$10
            sta $0308|!addr,y
            ldx $01
            beq ..short
        ..large
            clc
            adc #$10
            sta $030C|!addr,y
            clc
            adc #$10
            sta $0310|!addr,y
        ..short

        .tiles
            lda !dss_tile_buffer+$00
            sta $0302|!addr,y
            lda !dss_tile_buffer+$01
            sta $0306|!addr,y
            sta $030A|!addr,y
            sta $030E|!addr,y
            lda !dss_tile_buffer+$02
            sta $0312|!addr,y
            ldx $01
            bne ..large 
        ..short 
            sta $030A|!addr,y
        ..large

        .finish
            ldx $15E9|!addr
            lda #$04
            ldy $01
            bne ..large
        ..short
            lda #$02
        ..large
            ldy #$02
            jmp FinishOAMWriteRt

        warnpc $01B380



    org $01B395
        orange_rock_platform_init_hijack:
            lda !9E,x
            cmp #$5B
            lda.b #!dss_id_orange_platform
            bcs .orange
        .rock
            lda.b #!dss_id_rock_platform
        .orange
            jsl find_and_queue_gfx
            bcs .loaded
            rts
        .loaded
            jsr GetDrawInfoBnk1
            jml orange_rock_platform_init
        warnpc $01B3B3
    org $01B3B3
        orange_rock_platform_init_end:

    org $01B3FC
        orange_rock_platform_write_hijack:
            jml orange_rock_platform_write
        warnpc $01B400
    org $01B400
        orange_rock_platform_write_end:

    org $01B428
        orange_rock_platform_write_2_hijack:
           lda !dss_tile_buffer+$00
           sta $0312|!addr,y
           lda !dss_tile_buffer+$02
           sta $030E|!addr,y
           bra orange_rock_platform_write_2_end
        warnpc $01B444
    org $01B444
        orange_rock_platform_write_2_end:

    org $01B383
        orange_rock_platform_tilemap:
            db $00,$02,$01,$03,$01,$03,$01,$02          ; orange
            db $00
            db $00,$02,$01,$03,$01,$03,$01,$02          ; rock
            db $00
        warnpc $01B395



    org $01C7CE
        swinging_brown_platform_init_hijack:
            jml swinging_brown_platform_init
        warnpc $01C7D4
    org $01C7D4
        swinging_brown_platform_init_end:
    org $01C9B6
        swinging_brown_platform_init_return:

    org $01C7E9
        swinging_brown_platform_outer_chain_write_hijack:
            jml swinging_brown_platform_outer_chain_write
    org $01C7EE
        swinging_brown_platform_outer_chain_write_end:

    org $01C8C4
        swinging_brown_platform_chain_2_write_hijack:
            jml swinging_brown_platform_chain_2_write
    org $01C8C8
        swinging_brown_platform_chain_2_write_end:

    org $01C870
        swinging_brown_platform_chain_write_hijack:
            jml swinging_brown_platform_chain_write
    org $01C875
        swinging_brown_platform_chain_write_end:

    org $01C8F7
        swinging_brown_platform_write_hijack:
            jml swinging_brown_platform_write
    org $01C8FC
        swinging_brown_platform_write_end:

    org $01C9BB
        swinging_brown_platform_tilemap:
            db $00,$01,$01,$02


    org $03873A 
        grey_lava_platform_write_hijack:
            lda.b #!dss_id_rock_platform
            jsl find_and_queue_gfx
            bcs .loaded
            rts 
        .loaded
            jsr GetDrawInfoBnk3
            phx
            ldx #$02
        .loop
            lda $00
            sta $0300|!addr,y
            clc
            adc #$10
            sta $00
            jsl grey_lava_platform_write
            iny #4
            dex 
            bpl .loop
            plx
            ldy #$02
            lda #$02
            jsl FinishOAMWrite
            rts 
        warnpc $03876D

    org $038734
        grey_lava_platform_tilemap:
            db $00,$01,$00
    org $038737
        grey_lava_platform_props:

    org $038492
        falling_grey_platform_write_hijack:
            lda.b #!dss_id_brown_platform
            jsl find_and_queue_gfx
            bcs .loaded
            rts 
        .loaded 
            jsr GetDrawInfoBnk3
            phx
            ldx #$03
        .loop
            lda $00
            clc 
            adc.w falling_grey_platform_x_disp,x
            sta $0300|!addr,y
            lda $01
            jsl falling_grey_platform_write
            iny #4
            dex 
            bpl .loop
            plx 
            ldy #$02
            lda #$03
            jsl FinishOAMWrite
            rts
        warnpc $0384C3

    org $03848A
        falling_grey_platform_x_disp:
    org $03848E
        falling_grey_platform_tilemap:
            db $00,$01,$01,$02


    org $02E57E
        mushroom_scale_write_hijack:
            lda.b #!dss_id_mushroom_scale
            jsl find_and_queue_gfx
            bcs .loaded
            rts 
        .loaded
            jsr GetDrawInfoBnk2
            lda $00
            sec 
            sbc #$08
            sta $0300|!addr,y
            clc 
            adc #$10
            sta $0304|!addr,y 
            lda $01
            dec 
            sta $0301|!addr,y
            sta $0305|!addr,y
            jsl mushroom_scale_write
            lda #$01
            ldy #$02
            jmp $B7A7
        warnpc $02E5B1

pullpc

    mushroom_scale_write:
        lda !dss_tile_buffer
        sta $0302|!addr,y
        sta $0306|!addr,y
        lda !15F6,x
        ora $64
        sta $0303|!addr,y
        ora #$40
        sta $0307|!addr,y
        rtl 

    falling_grey_platform_write:
        sta $0301|!addr,y
        lda.w falling_grey_platform_tilemap,x
        phx 
        tax
        lda.l !dss_tile_buffer,x 
        plx 
        sta $0302|!addr,y
        lda #$03
        ora $64
        sta $0303|!addr,y
        rtl 


    grey_lava_platform_write:
        lda $01 
        sta $0301|!addr,y
        phx
        lda.w grey_lava_platform_tilemap,x
        tax 
        lda.l !dss_tile_buffer,x
        plx
        sta $0302|!addr,y
        lda.w grey_lava_platform_props,x
        ora $64
        sta $0303|!addr,y
        rtl 


    swinging_brown_platform_init:
        lda.b #!dss_id_brown_platform_chain
        jsl find_and_queue_gfx
        bcs .loaded_chain
        jml swinging_brown_platform_init_return
    .loaded_chain
        lda !dss_tile_buffer+$00
        sta !dss_tile_buffer+$03
        lda.b #!dss_id_brown_platform
        jsl find_and_queue_gfx
        bcs .loaded_platform
        jml swinging_brown_platform_init_return
    .loaded_platform
        ldy !15EA,x
        lda $14BA|!addr
        jml swinging_brown_platform_init_end

    swinging_brown_platform_outer_chain_write:
        lda !dss_tile_buffer+$03
        sta $0302|!addr,y
        jml swinging_brown_platform_outer_chain_write_end

    swinging_brown_platform_chain_2_write:
        sta $09
        lda !dss_tile_buffer+$03
        jml swinging_brown_platform_chain_2_write_end

    swinging_brown_platform_chain_write:
        lda !dss_tile_buffer+$03
        sta $0302|!addr,y
        jml swinging_brown_platform_chain_write_end

    swinging_brown_platform_write:
        phx 
        tax 
        lda !dss_tile_buffer,x
        sta $0302|!addr,y
        plx 
        lda #$31
        jml swinging_brown_platform_write_end

    orange_rock_platform_init:
        stz $00
        lda !9E,x
        cmp #$5E
        bne .normal
        inc $00
    .normal
        lda !D8,x
        sec 
        sbc $1C
        sta $0301|!addr,y
        sta $0309|!addr,y
        sta $0311|!addr,y
        jml orange_rock_platform_init_end

    orange_rock_platform_write:
        pha
        phx
        lda orange_rock_platform_tilemap,x
        tax 
        lda !dss_tile_buffer,x
        plx
        jml orange_rock_platform_write_end