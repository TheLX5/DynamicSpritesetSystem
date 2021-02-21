pushpc
    org $038B3D
        bowser_statue_init_hijack:
            lda.b #!dss_id_bowser_statue
            jsl find_and_queue_gfx
            bcs .loaded
            rts
        .loaded
            jsr GetDrawInfoBnk3
            jml bowser_statue_init
        warnpc $038B4D
    org $038B4D
        bowser_statue_init_end:

    org $038B84
        bowser_statue_write_hijack:
            jml bowser_statue_write
        warnpc $038B8A
    org $038B8A
        bowser_statue_write_end:

    org $038B2E
        bowser_statue_tilemap:
            ;db $56,$30,$41                          ; Normal (last tile unused)
            ;db $56,$30,$35                          ; Jumping
            db $03,$00,$01                          ; Normal (last tile unused)
            db $03,$00,$02                          ; Jumping

    
    org $038F1B
        statue_fireball_init_hijack:
            lda.b #!dss_id_bowser_statue_flame
            jsl find_and_queue_gfx
            bcs .loaded
            rts
        .loaded
            jsr GetDrawInfoBnk3
            jml statue_fireball_init
        warnpc $038F2C
    org $038F2C
        statue_fireball_init_end:

    org $038F46
        statue_fireball_write_hijack:
            jsl statue_fireball_write
        warnpc $038F4A

    org $038F0B
        statue_fireball_tilemap:
            ;db $32,$50
            ;db $33,$34
            ;db $32,$50
            ;db $33,$34
            db $00,$01
            db $10,$11
            db $00,$01
            db $10,$11
        warnpc $038F13
pullpc

    statue_fireball_write:
        tax
        lda.w statue_fireball_tilemap,x
        clc
        adc.l !dss_tile_buffer+$00
        rtl

    statue_fireball_init:
        lda !157C,x
        asl 
        sta $02
        lda $14
        lsr 
        and #$03
        asl
        sta $03
        jml statue_fireball_init_end

    bowser_statue_init:
        lda !1602,x
        sta $04
        eor #$01
        dec
        sta $03
        lda !15F6,x
        jml bowser_statue_init_end

    bowser_statue_write:
        lda.w bowser_statue_tilemap,x
        tax 
        lda !dss_tile_buffer,x
        sta $0302|!addr,y
        jml bowser_statue_write_end
