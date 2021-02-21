pushpc
    org $01BDD6
        magikoopa_wand_init_hijack:
            jml magikoopa_wand_init
        warnpc $01BDDB
    org $01BDDB 
        magikoopa_wand_init_end:

    org $01BD82
        magikoopa_magic_write_hijack:
            lda #!dss_id_magikoopa_magic
            jsl find_and_queue_gfx
            jml magikoopa_magic_write
        warnpc $01BD8E 
    org $01BD8E 
        magikoopa_magic_write_end:

    org $01BDA2
        magikoopa_magic_write_return:

    org $01BF04
        magikoopa_wand_write_hijack:
            jml magikoopa_wand_write
        warnpc $01BF09
    org $01BF09
        magikoopa_wand_write_end:
pullpc

    magikoopa_wand_init:
        lda #!dss_id_magikoopa_magic
        jsl find_and_queue_gfx
        lda #$01
        sta !15D0,x
        jml magikoopa_wand_init_end

    magikoopa_wand_write:
        lda #!dss_id_magikoopa_magic
        jsl find_and_queue_gfx
        lda !dss_tile_buffer+$00
        sta $030A|!addr,y
        jml magikoopa_wand_write_end

    magikoopa_magic_write:
        bcs .loaded
        lda #$F0
        sta $0301|!addr,y
        sta $0305|!addr,y
        sta $030B|!addr,y
        jml magikoopa_magic_write_return
    .loaded
        lda !dss_tile_buffer+$00
        inc 
        sta $0302|!addr,y
        clc
        adc #$0F
        sta $0306|!addr,y
        inc 
        sta $030A|!addr,y
        jml magikoopa_magic_write_end