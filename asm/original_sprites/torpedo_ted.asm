pushpc
    org $02B8F7
        torpedo_ted_init_hijack:
            lda.b #!dss_id_torpedo_ted
            jsl find_and_queue_gfx
            bcs .loaded
            rts
        .loaded
            jsr GetDrawInfoBnk2
            jml torpedo_ted_init
        warnpc $02B908
    org $02B908
        torpedo_ted_init_end:

    org $02B92B
        torpedo_ted_write_hijack:
            lda.l !dss_tile_buffer+$00
            sta $0302|!addr,y
            ldx $15E9|!addr
            lda !1540,x
            cmp #$01
            lda.l !dss_tile_buffer+$01
            bcs torpedo_ted_write_end
            jml torpedo_ted_write
        warnpc $02B944
    org $02B944
        torpedo_ted_write_end:


    org $029E62
        torpedo_ted_arm_hijack:
            lda #!dss_id_torpedo_ted_hand
            jsl find_and_queue_gfx
            bcs .loaded
            lda #$F0
            sta $0201|!addr,y
            pla
            rts
        .loaded
            jml torpedo_ted_arm_write
        warnpc $029E78
    org $029E78
        torpedo_ted_arm_end:
pullpc

    torpedo_ted_arm_write:
            pla
            cmp #$01
            lda.l !dss_tile_buffer+$00
            bcc .write
            lda.l !dss_tile_buffer+$01
        .write
            sta $0202|!addr,y
            lda #$13
            sta $0203|!addr,y
            jml torpedo_ted_arm_end

    torpedo_ted_init:
        lda $01
        sta $0301|!addr,y
        sta $0305|!addr,y
        lda !15F6,x
        ora $64
        jml torpedo_ted_init_end

    torpedo_ted_write:
        lda $14
        lsr #2
        lda.l !dss_tile_buffer+$02
        bcc .animate
        lda.l !dss_tile_buffer+$01
    .animate
        jml torpedo_ted_write_end