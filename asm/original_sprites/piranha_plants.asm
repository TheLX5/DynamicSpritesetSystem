pushpc

    org $018E87
        piranha_plant_write_hijack:
            jsr .gdi
            jml piranha_plant_write
        .gdi
            jsr GetDrawInfoBnk1
        .return
            rts 
        warnpc $018E98
    org $018E98
        piranha_plant_write_end:

pullpc

    piranha_plant_write:
        pei ($00)
        lda #!dss_id_piranha_plant_stem
        jsl find_and_queue_gfx
        bcs .loaded_stem
    .return 
        pla 
        pla 
        pla 
        jml piranha_plant_write_end
    .loaded_stem
        lda !dss_tile_buffer+$00
        sta !dss_tile_buffer+$02
        lda #!dss_id_piranha_plant
        jsl find_and_queue_gfx
        bcc .return

        rep #$20
        pla 
        sta $00
        sep #$20

        lda !157C,x
        sta $02

        lda !15F6,x 
        bpl .not_flipped
    .flipped 
        lda !1602,x
        tax 
        lda !dss_tile_buffer,x
        sta $0306|!addr,y
        lda !dss_tile_buffer+$02
        sta $0302|!addr,y
        bra .shared

    .not_flipped 
        lda !1602,x
        tax 
        lda !dss_tile_buffer,x
        sta $0302|!addr,y
        lda !dss_tile_buffer+$02
        sta $0306|!addr,y

    .shared 
        ldx $15E9|!addr
        lda $01
        sta $0301|!addr,y
        clc 
        adc #$10
        sta $0305|!addr,y
        lda $00
        sta $0300|!addr,y
        sta $0304|!addr,y
        lda $02
        lsr 
        lda !15F6,x
        bcs .no_x_flip
        ora #$40
    .no_x_flip
        ora $64
        pha 
        lda !9E,x 
        cmp #$2A
        beq .flip_colors
        pla 
        sta $0303|!addr,y
        and #$F1
        ora #$0A
        sta $0307|!addr,y
        bra +
    .flip_colors 
        pla
        sta $0307|!addr,y
        and #$F1
        ora #$0A
        sta $0303|!addr,y
    +   

        ldy #$02
        lda #$01
        jsl FinishOAMWrite
        pla 
        jml piranha_plant_write_end