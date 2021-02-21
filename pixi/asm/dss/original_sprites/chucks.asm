pushpc
    org $02C81A
        chuck_main_gfx_hijack:
            jsl chuck_main_gfx_get_data
            jsr GetDrawInfoBnk2
            jsr chuck_head_gfx
            jsr chuck_body_gfx
            jsr chuck_hand_gfx
            jsr chuck_shovel_gfx
            ldy #$FF
        fix_urchin_gfx_end:
            lda #$04
            jmp $B7A7

        chuck_head_x_offsets:
            db $F8,$F8,$F8,$00,$00,$FE,$00,$00
            db $FA,$00,$00,$00,$00,$00,$00,$FD
            db $FD,$F9,$F6,$F6,$F8,$FE,$FC,$FA
            db $F8,$FA

        chuck_head_y_offsets:
            db $F8,$F9,$F7,$F8,$FC,$F8,$F4,$F5
            db $F5,$FC,$FD,$00,$F9,$F5,$F8,$FA
            db $F6,$F6,$F4,$F4,$F8,$F6,$F6,$F8
            db $F8,$F5

        chuck_head_oam_offsets:
            db $08,$08,$08,$00,$00,$00,$08,$08
            db $08,$00,$08,$08,$00,$00,$00,$00
            db $00,$08,$10,$10,$0C,$0C,$0C,$0C
            db $0C,$0C

        chuck_head_x_flip:
            db $40,$40,$00,$00,$00,$00,$40

        warnpc $02C88C

    org $02C88C
        chuck_head_gfx:

    org $02CA27
        chuck_body_gfx:

    org $02CA9D
        chuck_hand_gfx:
    
    org $02CBA1
        chuck_shovel_gfx:

    org $02C908 
        chuck_return:


    org $02C8F6
        chuck_head_write_hijack:
            jml chuck_head_write
            nop #2
        chuck_head_write_end:
    org $02C8C8
        adc.w chuck_head_oam_offsets,y
    org $02C8CE
        lda.w chuck_head_x_offsets,x
    org $02C8E3
        adc.w chuck_head_y_offsets,x
    org $02C8EE
        lda.w chuck_head_x_flip,x


    org $02CA62
        chuck_body_write_hijack:
            lda $08
            ora $06
            pha 
            eor.w chuck_body_props_1,x
            sta $0303|!addr,y
            pla
            eor.w chuck_body_props_2,x
            sta $0307|!addr,y
            phx
            lda.l chuck_body_tilemap_offsets_1,x
            pha
            lda.w chuck_body_tilemap_1,x
            xba 
            lda.w chuck_body_tilemap_2,x
            tax
            jml chuck_body_write
        warnpc $02CA87
    org $02CA87
        chuck_body_write_end:
    org $02C9BF
        chuck_body_props_1:
    org $02C9D9
        chuck_body_props_2:
    org $02C9F3
        chuck_body_tile_size_1:
    org $02C98B
        chuck_body_tilemap_1:
            ;db $0D,$34,$35,$26,$2D,$28,$40,$42
            ;db $5D,$2D,$64,$64,$64,$64,$E7,$28
            ;db $82,$CB,$23,$20,$0D,$0C,$5D,$BD
            ;db $BD,$5D
            db $07,$0F,$0F,$15,$14,$10,$16,$17
            db $06,$14,$13,$13,$13,$13,$01,$10
            db $04,$06,$0E,$0C,$07,$07,$06,$06
            db $06,$06
        warnpc $02C9A5

    org $02C9A5
        chuck_body_tilemap_2:
            ;db $4E,$0C,$22,$26,$2D,$29,$40,$42
            ;db $AE,$2D,$64,$64,$64,$64,$E8,$29
            ;db $83,$CC,$24,$21,$4E,$A0,$A0,$A2
            ;db $A4,$AE
            db $00,$0C,$22,$15,$14,$11,$16,$17
            db $01,$14,$13,$13,$13,$13,$02,$11
            db $05,$05,$0F,$0D,$00,$02,$02,$03
            db $04,$01
        warnpc $02C9BF


    org $02CAD6
        chuck_hand_clapping_write_hijack:
            phx
            jml chuck_hand_clapping_write
        warnpc $02CADC
    org $02CADC
        chuck_hand_clapping_write_end:
    org $02CA97
        chuck_hand_clapping_tilemap:
            ;db $0C,$44
            db $07,$12


    org $02CB16
        chuck_hand_running_write_hijack:
            jml chuck_hand_running_write
        warnpc $02CB1B
    org $02CB1B
        chuck_hand_running_write_end:


    org $02CB7B
        chuck_hand_baseball_write_hijack:
            jml chuck_hand_baseball_write
        warnpc $02CB80
    org $02CB80
        chuck_hand_baseball_write_end:
    org $02A2A3
        chuck_baseball_write_hijack:
            jml chuck_baseball_write
        warnpc $02A2A8
    org $02A2A8
        chuck_baseball_write_end:
    org $02A2BE
        chuck_baseball_write_return:


    org $02CBEA
        chuck_digging_shovel_write_hijack:
            phx
            jml chuck_digging_shovel_write
        warnpc $02CBF0
    org $02CBF0
        chuck_digging_shovel_write_end:
    org $02CB9B
        chuck_digging_shovel_tilemap:
            ;db $CA,$E2,$A0
            db $06,$00,$03
pullpc

    chuck_main_gfx_get_data:
    .body
        lda.b #!dss_id_chuck_body           ; queue chuck's body
        jsl find_and_queue_gfx
        bcs ..loaded
        bra .abort
    ..loaded
        ldx.b #13-1
    ..loop
        lda !dss_tile_buffer,x
        sta !dss_tile_buffer+$0C,x          ; copy tile numbers to an unused region
        dex #1
        bpl ..loop

    .head
        lda.b #!dss_id_chuck_head           ; queue chuck's head
        jsl find_and_queue_gfx
        bcs ..loaded
        bra .abort
    ..loaded
        lda !dss_tile_buffer+$18
        sta !dss_tile_buffer+$07
        lda !dss_tile_buffer+$00
        sta !dss_tile_buffer+$08             ; copy tile numbers to an unused region
        lda !dss_tile_buffer+$01
        sta !dss_tile_buffer+$09
        lda !dss_tile_buffer+$02
        sta !dss_tile_buffer+$0A
        lda !dss_tile_buffer+$03
        sta !dss_tile_buffer+$0B


    .checks
        ldx $15E9|!addr
        lda !9E,x                           ; check specific sprites to queue even more gfx
        cmp #$97
        beq .puntin_pitchin
        cmp #$98
        beq .puntin_pitchin
        cmp #$46
        beq .diggin
        rtl

    .abort
        pla 
        pla                                 ; destructive return in case no gfx are loaded
        pla
        jml chuck_return

    .diggin
        lda.b #!dss_id_chuck_diggin
        jsl find_and_queue_gfx              ; queue diggin chuck's body
        bcc .abort
        rtl


    .puntin_pitchin
        lda.b #!dss_id_chuck_pitchin_puntin
        jsl find_and_queue_gfx              ; queue puntin and pitchin chuck's body
        bcc .abort
        rtl

    chuck_head_tilemap:
        db $08,$09,$0A,$09,$08,$0B,$0B
        ;db $06,$0A,$0E,$0A,$06,$4B,$4B

    chuck_head_write:
        lda.l chuck_head_tilemap,x
        tax 
        lda.l !dss_tile_buffer,x
        sta $0302|!addr,y
        jml chuck_head_write_end

    chuck_body_write:
        lda !dss_tile_buffer,x
        sta $0306|!addr,y
        xba
        tax
        pla
        clc
        adc !dss_tile_buffer,x
        sta $0302|!addr,y
        plx
        tya
        lsr #2
        tay
        lda.w chuck_body_tile_size_1,x
        sta $0460|!addr,y
        jml chuck_body_write_end
        
    chuck_body_tilemap_offsets_1:
        ;db $0D,$34,$35,$26,$2D,$28,$40,$42
        ;db $5D,$2D,$64,$64,$64,$64,$E7,$28
        ;db $82,$CB,$23,$20,$0D,$0C,$5D,$BD
        ;db $BD,$5D
        db $01,$10,$11,$00,$00,$00,$00,$00
        db $10,$00,$00,$00,$00,$00,$00,$00
        db $00,$01,$00,$00,$01,$00,$11,$10
        db $10,$10


    chuck_hand_clapping_write:
        lda.w chuck_hand_clapping_tilemap,x
        tax
        lda !dss_tile_buffer,x
        sta $0302|!addr,y
        plx 
        jml chuck_hand_clapping_write_end


    chuck_hand_running_write:
        lda.l !dss_tile_buffer+$07
        clc 
        adc #$10
        sta $0302|!addr,y
        jml chuck_hand_running_write_end


    chuck_hand_baseball_write:
        lda.l !dss_tile_buffer+$06
        sta $0302|!addr,y
        jml chuck_hand_baseball_write_end

    chuck_baseball_write:
        lda #!dss_id_chuck_pitchin_puntin
        jsl find_and_queue_gfx
        bcs .loaded
        lda #$F0
        sta $0201|!addr,y
        jml chuck_baseball_write_return
    .loaded
        lda.l !dss_tile_buffer+$06
        sta $0202|!addr,y
        jml chuck_baseball_write_end


    chuck_digging_shovel_write:
        lda.w chuck_digging_shovel_tilemap,x
        tax
        lda.l !dss_tile_buffer,x
        sta $0302|!addr,y
        plx
        jml chuck_digging_shovel_write_end
