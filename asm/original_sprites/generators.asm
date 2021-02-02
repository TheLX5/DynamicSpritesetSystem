pushpc
    org $02B003
        generator_load_hijack:
            jml generator_load
        warnpc $02B007
    org $02B007
        generator_load_end:
    org $02B02A
        generator_load_return:
pullpc

    generator_load:
        ldx $18B9|!addr
        lda.l .gfx1-1,x
        cmp.b #!dss_id_null
        beq .skip
        jsl find_and_queue_gfx 
        lda.l .gfx2-1,x
        cmp.b #!dss_id_null
        beq .skip
        jsl find_and_queue_gfx 
        lda.l .gfx3-1,x
        cmp.b #!dss_id_null
        beq .skip
        jsl find_and_queue_gfx 
    .skip
        txa
        jml generator_load_end

    .gfx1
        db !dss_id_eerie
        db !dss_id_parachute
        db !dss_id_parachute
        db !dss_id_parachute
        db !dss_id_horizontal_dolphin
        db !dss_id_horizontal_dolphin
        db !dss_id_cheep_cheep
        db !dss_id_null
        db !dss_id_super_koopa
        db !dss_id_bubble
        db !dss_id_bullet_bill
        db !dss_id_bullet_bill
        db !dss_id_bullet_bill
        db !dss_id_bowser_statue_flame
        db !dss_id_null
    
    .gfx2
        db !dss_id_null
        db !dss_id_paragoomba
        db !dss_id_parabobomb
        db !dss_id_paragoomba
        db !dss_id_null
        db !dss_id_null
        db !dss_id_null
        db !dss_id_null
        db !dss_id_null
        db !dss_id_goomba
        db !dss_id_null
        db !dss_id_null
        db !dss_id_null
        db !dss_id_null
        db !dss_id_null

    .gfx3
        db !dss_id_null
        db !dss_id_null
        db !dss_id_null
        db !dss_id_parabobomb
        db !dss_id_null
        db !dss_id_null
        db !dss_id_null
        db !dss_id_null
        db !dss_id_null
        db !dss_id_cheep_cheep
        db !dss_id_null
        db !dss_id_null
        db !dss_id_null
        db !dss_id_null
        db !dss_id_null