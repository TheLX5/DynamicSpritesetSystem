pushpc 

    org $029F79
        yoshi_fireball_write_hijack:
            jml yoshi_fireball_write
        warnpc $029F7F
    org $029F7F
        yoshi_fireball_write_end:
    org $029F98
        yoshi_fireball_write_return:

pullpc 

    yoshi_fireball_write:  
        php
        lda #!dss_id_yoshi_fireball
        jsl find_and_queue_gfx
        bcs .loaded
        lda #$F0
        sta $0201|!addr,y
        plp
        jml yoshi_fireball_write_return 
    .loaded
        plp
        lda !dss_tile_buffer+$00
        bcc .anim
        lda !dss_tile_buffer+$01
    .anim
        jml yoshi_fireball_write_end