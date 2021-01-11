if !pass == 0

    org $01BDD6
        jml magikoopa_load_hand_hijack

    org $01BDDB 
        magikoopa_load_hand_end:


else

    magikoopa_load_hand_hijack:
        lda #!dss_id_magikoopa_magic
        jsl find_and_queue_gfx
        lda #$01
        sta !15D0,x
        jml magikoopa_load_hand_end

endif