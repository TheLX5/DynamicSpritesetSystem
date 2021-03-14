pushpc
    org $019C7F
        shared_sprite_offset:
            db $09,$09,$10,$09,$00,$00,$00,$00
            db $00,$00,$00,$00,$00,$37,$00,$25
            db $25,$5A,$00,$4B,$4E,$8A,$8A,$8A
            db $8A,$56,$3A,$46,$47,$69,$6B,$73
            db $00,$00,$80,$80,$80,$80,$8E,$90
            db $00,$00,$3A,$F6,$94,$95,$63,$9A
            db $A6,$AA,$AE,$B2,$C2,$C4,$D5,$D9
            db $D7,$D7,$E6,$E6,$E6,$E2,$99,$17
            db $29,$E6,$E6,$E6,$00,$E8,$00,$8A
            db $E8,$00,$C3,$EA,$7F,$EA,$EA,$3A
            db $3A,$FA,$71,$7F

    org $02E10D
        piranha_plant_propeller:
            lda #$0B

    org $01A1EF
        jml stunned_bobomb

    org $01A222
        shared_stunned:


    org $019B83
        shared_sprite_tilemap:                       ;$019B83    | Various tilemaps for sprites. Indexed by the value from $019C7F + $1602 (*2 if 16x32, *4 if 4 8x8s).                  
           .koopa
                ;db $82,$A0,$82,$A2,$84,$A4              ;$019B83 - Koopa (2-byte)
                db $00,$02,$00,$03,$01,$04

            .koopa_shell
                ;db $8C,$8A,$8E                          ;$019B86 - Shell (1-byte, but indexed from above)
                db $01,$00,$02

            .shelless_koopa
                ;db $C8,$CA,$CA,$CE,$CC,$86,$4E          ;$019B8C - Shell-less Koopa (fourth byte unused)
                db $00,$01,$01,$00,$02,$03,$04

            .shelless_blue_koopa
                ;db $E0,$E2,$E2,$CE,$E4,$E0,$E0          ;$019B93 - Shell-less blue Koopa (fourth byte unused)
                db $00,$01,$01,$00,$02,$00,$00

            .paragoomba
                ;db $A3,$A3,$B3,$B3,$E9,$E8,$F9,$F8      ;$019B9A - Para-goomba
                ;db $E8,$E9,$F8,$F9,$E2,$E6
                db $04,$04,$06,$06,$01,$00,$03,$02
                db $00,$01,$02,$03,$00,$01

            .goomba
                ;db $AA,$A8,$A8,$AA                      ;$019BA8 - Goomba
                db $01,$00,$00,$01

            .parabobomb
                ;db $A2,$A2,$B2,$B2,$C3,$C2,$D3,$D2      ;$019BAC - Para-bomb
                ;db $C2,$C3,$D2,$D3,$E2,$E6
                db $04,$04,$06,$06,$01,$00,$03,$02
                db $00,$01,$02,$03,$00,$01


            .bobomb
                ;db $CA,$CC,$CA                          ;$019BBA - Bob-omb
                db $00,$01,$00

            .piranha_plant
                ;db $AC,$CE,$AE,$CE,$83,$83,$C4,$C4      ;$019BBD - Classic / Jumping Piranha Plant
                ;db $83,$83,$C5,$C5
                db $00,$00,$01,$00,$02,$02,$03,$03
                db $02,$02,$01,$01

            .football
                ;db $8A                                  ;$019BC9 - Football
                db $00

            .bullet_bill
                ;db $A6,$A4,$A6,$A8                      ;$019BCA - Bullet Bill
                db $00,$01,$02,$03

            .spiny
                ;db $80,$82,$80                          ;$019BCE - Spiny
                db $00,$01,$00

            .spiny_egg
                ;db $84,$84,$84,$84,$94,$94,$94,$94      ;$019BD1 - Spiny egg (4-byte)
                db $08,$08,$08,$08,$0A,$0A,$0A,$0A

            .null_1
                ;db $A0,$B0,$A0,$D0                      ;$019BD9 - ???
                db $A0,$B0,$A0,$D0

            .buzzy_beetle
                ;db $82,$80,$82                          ;$019BDD - Buzzy Beetle
                db $01,$00,$01

            .null_2
                ;db $00,$00,$00                          ;$019BE0 - ???
                db $00,$00,$00

            .buzzy_beetle_shell
                ;db $86,$84,$88                          ;$019BE3 - Buzzy Beetle shell
                db $03,$02,$04

            .spike_top
                ;db $EC,$8C,$A8,$AA,$8E,$AC              ;$019BE6 - Spike Top
                db $01,$00,$02,$03,$04,$05

            .hopping_flame
                ;db $AE,$8E                              ;$019BEC - Hopping Flame
                db $01,$00

            .lakitu
                ;db $EC,$EE,$CE,$EE,$A8,$EE              ;$019BEE - Lakitu
                db $00,$03,$02,$03,$01,$03

            .moving_hole
                ;db $40,$40                              ;$019BF4 - Moving Ledge Hole?
                db $40,$40

            .magikoopa
                ;db $A0,$C0,$A0,$C0,$A4,$C4,$A4,$C4      ;$019BF6 - Magikoopa
                ;db $A0,$C0,$A0,$C0
                db $00,$02,$00,$02,$01,$04,$01,$04
                db $00,$02,$00,$02

            .throw_block
                ;db $40                                  ;$019C02 - Throwblock / exploding turnblock
                db $00

            .net_koopa
                ;db $07,$27,$4C,$29,$4E,$2B,$82,$A0      ;$019C03 - Climbing Koopa
                ;db $84,$A4
                db $00,$03,$01,$04,$02,$05,$00,$02
                db $01,$04

            .cheep_cheep
                ;db $67,$69,$88,$CE                      ;$019C0D - Fish
                db $00,$01,$02,$03

            .null_3
                ;db $8E,$AE                              ;$019C11 - ???
                db $8E,$AE

            .thwimp
                ;db $A2,$A2,$B2,$B2                      ;$019C13 - Thwimp (4-byte)
                db $00,$00,$02,$02

            .yoshi_eggs
                ;db $00                                  ;$019C17 - Stunned Yoshi Egg
                db $00

            .null_4
                ;db $40,$44,$42,$2C,$42                  ;$019C18 - ???
                db $40,$44,$42,$2C,$42

            .springboard
                ;db $28,$28,$28,$28,$4C,$4C,$4C,$4C      ;$019C1D - Springboard (4-byte)
                ;db $83,$83,$6F,$6F
                db $00,$00,$00,$00,$01,$01,$01,$01
                db $03,$03,$02,$02

            .null_5
                ;db $AC,$BC,$AC,$A6                      ;$019C29 - ???
                db $AC,$BC,$AC,$A6

            .bony_beetle
                ;db $8C,$AA,$86,$84                      ;$019C2D - Bony Beetle
                db $01,$00,$02,$03

            .null_6
                ;db $DC,$EC,$DE,$EE                      ;$019C31 - ???
                db $DC,$EC,$DE,$EE

            .podoboo
                ;db $06,$06,$16,$16,$07,$07,$17,$17      ;$019C35 - Podoboo (4-byte)
                ;db $16,$16,$06,$06,$17,$17,$07,$07
                db $00,$00,$02,$02,$01,$01,$03,$03
                db $02,$02,$00,$00,$03,$03,$01,$01

            .null_7
                ;db $84,$86                              ;$019C45 - [Unused]
                db $84

            .goal_question_sphere
                db $00
            
            .yoshi
                db $00,$00,$00,$0E,$2A,$24,$02,$06      ;$019C47 - Yoshi
                db $0A,$20,$22,$28,$26,$2E,$40,$42
                db $0C

            .null_8
                ;db $04,$2B                              ;$019C58 - [Unused]
                db $04,$2B

            .eerie
                ;db $6A,$ED                              ;$019C5A - Eerie
                db $00,$01

            .boo
                ;db $88,$8C,$A8,$8E,$AA,$AE,$8C,$88      ;$019C5C - Boo
                ;db $A8
                db $00,$01,$03,$02,$04,$05,$01,$00
                db $03

            .rip_van_fish
                ;db $AE,$AC,$8C,$8E                      ;$019C65 - Rip Van Fish
                db $03,$02,$00,$01

            .vertical_dolphin
                ;db $CE,$EE                              ;$019C69 - Vertical Dolphin
                db $00,$01

            .chuck_rock
                ;db $C4,$C6                              ;$019C6B - Diggin' Chuck's Rock
                db $00,$01

            .monty_mole
                ;db $82,$84,$86                          ;$019C6D - Monty Mole
                db $00,$01,$02

            .monty_mole_dirt
                ;db $8C                                  ;$019C70 - Ledge-dwelling Monty Mole's Dirt, ? Sphere
                db $03

            .monty_mole_ground
                ;db $CE,$CE,$88,$89,$CE,$CE,$89,$88      ;$019C71 - Ground-dwelling Monty Mole's Dirt (4-byte)
                db $10,$11,$12,$13,$11,$10,$13,$12

            .sumo_bro_lightning
                ;db $F3,$CE,$F3,$CE                      ;$019C79 - Sumo Bros. Lightning
                db $00,$01,$00,$01

            .ninji
                ;db $A7,$A9                              ;$019C7D - Ninji
                db $00,$01

    org $019D0B
        first_shared_gfx_hijack:
            jml first_shared_gfx_init
        warnpc $019D10

    org $019D10
        first_shared_gfx_init_end:

    org $019D5E
        first_shared_gfx_return:

    org $019D38
        first_shared_gfx_write_hijack:
            jml first_shared_gfx_write
        warnpc $019D3C

    org $019D3C
        first_shared_gfx_write_end:



    org $019D8F
        second_shared_gfx_hijack_1:
            pei ($00)
            pei ($02)
            jml second_shared_gfx_1
        warnpc $019D9B

    org $019D9B
        second_shared_gfx_1_end:

    org $019DF3
        second_shared_gfx_hijack_2:
            pei ($00)
            pei ($02)
            jml second_shared_gfx_2
        warnpc $019DFF

    org $019DFF
        second_shared_gfx_2_end:

    org $019DD8
        second_shared_gfx_return:


    org $019F0F
        third_shared_gfx_hijack:
            jsr GetDrawInfoBnk1
            pei ($00)
            ldy !9E,x
            cpy #$36
            beq .end2
            lda !1602,x
            cmp #$FF
            beq .original
            clc
            adc.w shared_sprite_offset,y
            tax
            lda.l shared_sprite_gfx,x
            cmp #$FF 
            beq .original
            cpy #$54
            bcs .original
            jsl find_and_queue_gfx
            bcs .loaded
        .end2
            ldx $15E9|!addr
            pla 
            pla 
            rts
        .loaded
            jml third_shared_gfx
        .original
            jml third_shared_gfx_original

        warnpc $019F48

    org $019F48
        third_shared_gfx_end:
pullpc

;################################################
;# Main GFX code

    stunned_bobomb:
        tax 
        lda.l !dss_tile_buffer,x
        ldx $15E9|!addr
        jml shared_stunned

    first_shared_gfx_init:
        adc.w shared_sprite_offset,y
        pha 
        pei ($00)
        tax
        lda.l shared_sprite_gfx,x
        cmp #$FF
        beq .original
        jsl find_and_queue_gfx
        stz $06
        ldx $15E9|!addr
        bcs .loaded
        pla 
        pla 
        pla 
        jml first_shared_gfx_return
    .original
        inc $06
    .loaded
        pla
        sta $00
        pla 
        sta $01
        pla 
        sta $02
        jml first_shared_gfx_init_end
    
    first_shared_gfx_write:
        tax
        lda.w shared_sprite_tilemap,x
        sta $08
        lsr #2
        tax
        lda $06
        bne .original
        lda.l !dss_tile_buffer,x 
        sta $07
        lda $08
        and #$03
        tax 
        lda.l .offsets,x
        clc
        adc $07
    .original
        jml first_shared_gfx_write_end

    .offsets
        db $00,$01,$10,$11



    second_shared_gfx_1:
        lda.l shared_sprite_gfx,x
        cmp #$FF 
        beq .original
        jsl find_and_queue_gfx
        bcs .loaded
        rep #$20
        pla 
        sta $02
        pla 
        sta $00
        sep #$20
        ldx $15E9|!addr
        jml second_shared_gfx_return
    .loaded
        phx
        lda.l shared_sprite_tilemap,x
        tax 
        lda.l !dss_tile_buffer,x
        sta $0302|!addr,y
        plx
        lda.l shared_sprite_tilemap+1,x
        tax 
        lda.l !dss_tile_buffer,x
    .back
        sta $0306|!addr,y
        rep #$20
        pla 
        sta $02
        pla 
        sta $00
        sep #$20
        ldx $15E9|!addr
        jml second_shared_gfx_1_end
    .original
        lda.l shared_sprite_tilemap,x
        sta $0302|!addr,y
        lda.l shared_sprite_tilemap+1,x
        bra .back

    second_shared_gfx_2:
        lda.l shared_sprite_gfx,x
        cmp #$FF 
        beq .original
        jsl find_and_queue_gfx
        bcs .loaded
        rep #$20
        pla 
        sta $02
        pla 
        sta $00
        sep #$20
        ldx $15E9|!addr
        jml second_shared_gfx_return
    .loaded
        phx
        lda.l shared_sprite_tilemap,x
        tax 
        lda.l !dss_tile_buffer,x
        sta $0306|!addr,y
        plx
        lda.l shared_sprite_tilemap+1,x
        tax 
        lda.l !dss_tile_buffer,x
    .back
        sta $0302|!addr,y
        rep #$20
        pla 
        sta $02
        pla 
        sta $00
        sep #$20
        ldx $15E9|!addr
        jml second_shared_gfx_2_end
    .original
        lda.l shared_sprite_tilemap,x
        sta $0306|!addr,y
        lda.l shared_sprite_tilemap+1,x
        bra .back


    third_shared_gfx_original:
        lda.l shared_sprite_tilemap,x

    third_shared_gfx_return:
        ldx $15E9|!addr
        ldy !15EA,x
        sta $0302|!addr,y
        pla 
        sta $0300|!addr,y
        pla 
        sta $0301|!addr,y
        lda !157C,x
        lsr 
        lda #$00
        ora !15F6,x
        bcs .flip
        eor #$40
    .flip
        ora $04
        ora $64
        jml third_shared_gfx_end

    third_shared_gfx:
        lda.l shared_sprite_tilemap,x
        tax 
        lda.l !dss_tile_buffer,x
        jmp third_shared_gfx_return

    shared_sprite_gfx:                        ;$019B83    | Various tilemaps for sprites. Indexed by the value from $019C7F + $1602 (*2 if 16x32, *4 if 4 8x8s).
        .koopa
            ;db $82,$A0,$82,$A2,$84,$A4              ;$019B83 - Koopa (2-byte)
            db !dss_id_koopa, !dss_id_koopa, !dss_id_koopa
            db !dss_id_koopa, !dss_id_koopa, !dss_id_koopa

        .koopa_shell
            ;db $8C,$8A,$8E                          ;$019B86 - Shell (1-byte, but indexed from above)
            db !dss_id_koopa_shell, !dss_id_koopa_shell, !dss_id_koopa_shell

        .shelless_koopa
            ;db $C8,$CA,$CA,$CE,$CC,$86,$4E          ;$019B8C - Shell-less Koopa (fourth byte unused)
            db !dss_id_shelless_koopa, !dss_id_shelless_koopa, !dss_id_shelless_koopa, !dss_id_shelless_koopa
            db !dss_id_shelless_koopa, !dss_id_shelless_koopa, !dss_id_shelless_koopa

        .shelless_blue_koopa
            ;db $E0,$E2,$E2,$CE,$E4,$E0,$E0          ;$019B93 - Shell-less blue Koopa (fourth byte unused)
            db !dss_id_shelless_blue_koopa, !dss_id_shelless_blue_koopa, !dss_id_shelless_blue_koopa, !dss_id_shelless_blue_koopa
            db !dss_id_shelless_blue_koopa, !dss_id_shelless_blue_koopa, !dss_id_shelless_blue_koopa

        .paragoomba
            ;db $A3,$A3,$B3,$B3,$E9,$E8,$F9,$F8      ;$019B9A - Para-goomba
            ;db $E8,$E9,$F8,$F9,$E2,$E6
            db !dss_id_paragoomba, !dss_id_paragoomba, !dss_id_paragoomba, !dss_id_paragoomba
            db !dss_id_paragoomba, !dss_id_paragoomba, !dss_id_paragoomba, !dss_id_paragoomba
            db !dss_id_paragoomba, !dss_id_paragoomba, !dss_id_paragoomba, !dss_id_paragoomba
            db !dss_id_parachute, !dss_id_parachute

        .goomba
            ;db $AA,$A8,$A8,$AA                      ;$019BA8 - Goomba
            db !dss_id_goomba, !dss_id_goomba, !dss_id_goomba, !dss_id_goomba

        .parabobomb
            ;db $A2,$A2,$B2,$B2,$C3,$C2,$D3,$D2      ;$019BAC - Para-bomb
            ;db $C2,$C3,$D2,$D3,$E2,$E6
            db !dss_id_parabobomb, !dss_id_parabobomb, !dss_id_parabobomb, !dss_id_parabobomb
            db !dss_id_parabobomb, !dss_id_parabobomb, !dss_id_parabobomb, !dss_id_parabobomb
            db !dss_id_parabobomb, !dss_id_parabobomb, !dss_id_parabobomb, !dss_id_parabobomb
            db !dss_id_parachute, !dss_id_parachute

        .bobomb
            ;db $CA,$CC,$CA                          ;$019BBA - Bob-omb
            db !dss_id_bobomb, !dss_id_bobomb, !dss_id_bobomb

        .piranha_plant
            ;db $AC,$CE,$AE,$CE,$83,$83,$C4,$C4      ;$019BBD - Classic / Jumping Piranha Plant
            ;db $83,$83,$C5,$C5
            db !dss_id_piranha_plant, !dss_id_piranha_plant_stem, !dss_id_piranha_plant, !dss_id_piranha_plant_stem
            db !dss_id_misc_tiles_1, !dss_id_misc_tiles_1, !dss_id_misc_tiles_1, !dss_id_misc_tiles_1
            db !dss_id_misc_tiles_1, !dss_id_misc_tiles_1, !dss_id_misc_tiles_1, !dss_id_misc_tiles_1

        .football
            ;db $8A                                  ;$019BC9 - Football
            db !dss_id_football

        .bullet_bill
            ;db $A6,$A4,$A6,$A8                      ;$019BCA - Bullet Bill
            db !dss_id_bullet_bill, !dss_id_bullet_bill, !dss_id_bullet_bill, !dss_id_bullet_bill

        .spiny
            ;db $80,$82,$80                          ;$019BCE - Spiny
            db !dss_id_spiny, !dss_id_spiny, !dss_id_spiny

        .spiny_egg
            ;db $84,$84,$84,$84,$94,$94,$94,$94      ;$019BD1 - Spiny egg (4-byte)
            db !dss_id_spiny, !dss_id_spiny, !dss_id_spiny, !dss_id_spiny
            db !dss_id_spiny, !dss_id_spiny, !dss_id_spiny, !dss_id_spiny

        .null_1
            ;db $A0,$B0,$A0,$D0                      ;$019BD9 - ???
            db !dss_id_null, !dss_id_null, !dss_id_null, !dss_id_null

        .buzzy_beetle
            ;db $82,$80,$82                          ;$019BDD - Buzzy Beetle
            db !dss_id_buzzy_beetle, !dss_id_buzzy_beetle, !dss_id_buzzy_beetle

        .null_2
            ;db $00,$00,$00                          ;$019BE0 - ???
            db !dss_id_null, !dss_id_null, !dss_id_null

        .buzzy_beetle_shell
            ;db $86,$84,$88                          ;$019BE3 - Buzzy Beetle shell
            db !dss_id_buzzy_beetle, !dss_id_buzzy_beetle, !dss_id_buzzy_beetle

        .spike_top
            ;db $EC,$8C,$A8,$AA,$8E,$AC              ;$019BE6 - Spike Top
            db !dss_id_spike_top, !dss_id_spike_top, !dss_id_spike_top, !dss_id_spike_top
            db !dss_id_spike_top, !dss_id_spike_top

        .hopping_flame
            ;db $AE,$8E                              ;$019BEC - Hopping Flame
            db !dss_id_hopping_flame, !dss_id_hopping_flame

        .lakitu
            ;db $EC,$EE,$CE,$EE,$A8,$EE              ;$019BEE - Lakitu
            db !dss_id_lakitu, !dss_id_lakitu, !dss_id_lakitu, !dss_id_lakitu
            db !dss_id_lakitu, !dss_id_lakitu

        .moving_hole
            ;db $40,$40                              ;$019BF4 - Moving Ledge Hole?
            db !dss_id_null, !dss_id_null

        .magikoopa
            ;db $A0,$C0,$A0,$C0,$A4,$C4,$A4,$C4      ;$019BF6 - Magikoopa
            ;db $A0,$C0,$A0,$C0
            db !dss_id_magikoopa, !dss_id_magikoopa, !dss_id_magikoopa, !dss_id_magikoopa
            db !dss_id_magikoopa, !dss_id_magikoopa, !dss_id_magikoopa, !dss_id_magikoopa
            db !dss_id_magikoopa, !dss_id_magikoopa, !dss_id_magikoopa, !dss_id_magikoopa

        .throw_block
            ;db $40                                  ;$019C02 - Throwblock / exploding turnblock
            db !dss_id_turn_block

        .net_koopa
            ;db $07,$27,$4C,$29,$4E,$2B,$82,$A0      ;$019C03 - Climbing Koopa
            ;db $84,$A4
            db !dss_id_net_koopa, !dss_id_net_koopa, !dss_id_net_koopa, !dss_id_net_koopa
            db !dss_id_net_koopa, !dss_id_net_koopa, !dss_id_koopa, !dss_id_koopa
            db !dss_id_koopa, !dss_id_koopa

        .cheep_cheep
            ;db $67,$69,$88,$CE                      ;$019C0D - Fish
            db !dss_id_cheep_cheep, !dss_id_cheep_cheep, !dss_id_cheep_cheep, !dss_id_cheep_cheep

        .null_3
            ;db $8E,$AE                              ;$019C11 - ???
            db !dss_id_null, !dss_id_null

        .thwimp
            ;db $A2,$A2,$B2,$B2                      ;$019C13 - Thwimp (4-byte)
            db !dss_id_thwimp, !dss_id_thwimp, !dss_id_thwimp, !dss_id_thwimp

        .yoshi_egg_stunned
            ;db $00                                  ;$019C17 - Yoshi Egg
            db !dss_id_yoshi_eggs
        .null_4
            ;db $40,$44,$42,$2C,$42                  ;$019C18 - ???
            db !dss_id_null, !dss_id_null, !dss_id_null
            db !dss_id_null, !dss_id_null

        .springboard
            ;db $28,$28,$28,$28,$4C,$4C,$4C,$4C      ;$019C1D - Springboard (4-byte)
            ;db $83,$83,$6F,$6F
            db !dss_id_springboard, !dss_id_springboard, !dss_id_springboard, !dss_id_springboard
            db !dss_id_springboard, !dss_id_springboard, !dss_id_springboard, !dss_id_springboard
            db !dss_id_springboard, !dss_id_springboard, !dss_id_springboard, !dss_id_springboard

        .null_5
            ;db $AC,$BC,$AC,$A6                      ;$019C29 - ???
            db !dss_id_null, !dss_id_null, !dss_id_null, !dss_id_null

        .bony_beetle
            ;db $8C,$AA,$86,$84                      ;$019C2D - Bony Beetle
            db !dss_id_bony_beetle, !dss_id_bony_beetle, !dss_id_bony_beetle, !dss_id_bony_beetle

        .null_6
            ;db $DC,$EC,$DE,$EE                      ;$019C31 - ???
            db !dss_id_null, !dss_id_null, !dss_id_null, !dss_id_null

        .podoboo
            ;db $06,$06,$16,$16,$07,$07,$17,$17      ;$019C35 - Podoboo (4-byte)
            ;db $16,$16,$06,$06,$17,$17,$07,$07
            db !dss_id_podoboo, !dss_id_podoboo, !dss_id_podoboo, !dss_id_podoboo
            db !dss_id_podoboo, !dss_id_podoboo, !dss_id_podoboo, !dss_id_podoboo
            db !dss_id_podoboo, !dss_id_podoboo, !dss_id_podoboo, !dss_id_podoboo
            db !dss_id_podoboo, !dss_id_podoboo, !dss_id_podoboo, !dss_id_podoboo

        .null_7
            ;db $84,$86                              ;$019C45 - [Unused]
            db !dss_id_null

        .goal_question_sphere
            db !dss_id_goal_question_sphere
        
        .yoshi
            ;db $00,$00,$00,$0E,$2A,$24,$02,$06      ;$019C47 - Yoshi
            ;db $0A,$20,$22,$28,$26,$2E,$40,$42
            ;db $0C
            db !dss_id_null, !dss_id_null, !dss_id_null, !dss_id_null
            db !dss_id_null, !dss_id_null, !dss_id_null, !dss_id_null
            db !dss_id_null, !dss_id_null, !dss_id_null, !dss_id_null
            db !dss_id_null, !dss_id_null, !dss_id_null, !dss_id_null
            db !dss_id_null

        .null_8
            ;db $04,$2B                              ;$019C58 - [Unused]
            db !dss_id_null, !dss_id_null

        .eerie
            ;db $6A,$ED                              ;$019C5A - Eerie
            db !dss_id_eerie, !dss_id_eerie

        .boo
            ;db $88,$8C,$A8,$8E,$AA,$AE,$8C,$88      ;$019C5C - Boo
            ;db $A8
            db !dss_id_boo, !dss_id_boo, !dss_id_boo, !dss_id_boo
            db !dss_id_boo, !dss_id_boo, !dss_id_boo, !dss_id_boo
            db !dss_id_boo

        .rip_van_fish
            ;db $AE,$AC,$8C,$8E                      ;$019C65 - Rip Van Fish
            db !dss_id_rip_van_fish, !dss_id_rip_van_fish, !dss_id_rip_van_fish, !dss_id_rip_van_fish

        .vertical_dolphin
            ;db $CE,$EE                              ;$019C69 - Vertical Dolphin
            db !dss_id_vertical_dolphin, !dss_id_vertical_dolphin

        .chuck_rock
            ;db $C4,$C6                              ;$019C6B - Diggin' Chuck's Rock
            db !dss_id_chuck_rock, !dss_id_chuck_rock

        .monty_mole
            ;db $82,$84,$86                          ;$019C6D - Monty Mole
            db !dss_id_monty_mole, !dss_id_monty_mole, !dss_id_monty_mole

        .monty_mole_dirt
            ;db $8C                                  ;$019C70 - Ledge-dwelling Monty Mole's Dirt, ? Sphere
            db !dss_id_monty_mole

        .monty_mole_ground
            ;db $CE,$CE,$88,$89,$CE,$CE,$89,$88      ;$019C71 - Ground-dwelling Monty Mole's Dirt (4-byte)
            db !dss_id_monty_mole, !dss_id_monty_mole, !dss_id_monty_mole, !dss_id_monty_mole
            db !dss_id_monty_mole, !dss_id_monty_mole, !dss_id_monty_mole, !dss_id_monty_mole

        .sumo_bro_lightning
            ;db $F3,$CE,$F3,$CE                      ;$019C79 - Sumo Bros. Lightning
            db !dss_id_sumo_bro_lightning, !dss_id_sumo_bro_lightning, !dss_id_sumo_bro_lightning, !dss_id_sumo_bro_lightning

        .ninji
            ;db $A7,$A9                              ;$019C7D - Ninji
            db !dss_id_ninji, !dss_id_ninji
