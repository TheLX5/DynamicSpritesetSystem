pushpc

    org $018DE1
        goomba_wings_tilemap:
            db !big_wing_tile,!big_wing_tile
            db !small_wing_tile,!small_wing_tile
    org $019E1C
        koopa_wings_tilemap:
            db !small_wing_tile,!big_wing_tile
            db !small_wing_tile,!big_wing_tile
    org $02BB17
        yoshi_wings_tilemap:
            db !small_wing_tile,!big_wing_tile
            db !small_wing_tile,!big_wing_tile
    org $02DC1F
        hammer_bro_platform_tilemap:
            db !turn_block_tile,!turn_block_tile,!big_wing_tile,!big_wing_tile
            db !turn_block_tile,!turn_block_tile,!small_wing_tile,!small_wing_tile
    org $03868A
        flying_grey_turnblocks_tilemap:
            db !turn_block_tile,!turn_block_tile,!turn_block_tile,!big_wing_tile,!big_wing_tile
            db !turn_block_tile,!turn_block_tile,!turn_block_tile,!small_wing_tile,!small_wing_tile
    org $029E82
        lava_splash_tilemap:
            db !lava_particle_tiny_tile,!lava_particle_small_tile
            db !lava_particle_medium_tile,!lava_particle_large_tile
    org $028F2B
        podoboo_lava_trail_tilemap:
            db !lava_particle_tiny_tile,!lava_particle_small_tile
            db !lava_particle_medium_tile,!lava_particle_large_tile
    org $029C94
        spin_jump_star_tilemap:
            db !spinjump_star_tile
    org $07F21A
        bonus_star_formation_tile:
            db !spinjump_star_tile
    org $07F24E
        bonus_star_formation_tilemap:
            db !glitter_tiny_tile
            db !glitter_tiny_tile
            db !glitter_medium_tile
            db !glitter_large_tile

    org $0291F1
        bounce_block_tilemap:
            db !turn_block_tile
            db !note_block_tile
            db !question_block_tile
            db !turn_block_tile
            db !glass_block_tile
            db !on_off_block_tile
            db !turn_block_tile
    org $028789
        bounce_block_props:
            db $00
            db $02
            db $00
            db $00
            db $00
            db $06
            db $00
            db $04
            db $0A

    org $028ECC
        small_star_tilemap:
            db !glitter_tiny_tile,!glitter_medium_tile,!glitter_large_tile
            db !sparkle_small_tile,!sparkle_medium_tile,!sparkle_large_tile
    
    org $028B84
        broken_brick_tilemap:
            db !broken_brick_1_tile,!broken_brick_2_tile
            db !broken_brick_1_tile,!broken_brick_2_tile
            db !broken_brick_1_tile,!broken_brick_2_tile
            db !broken_brick_1_tile,!broken_brick_2_tile

    org $028EB2
        yoshi_egg_piece_tilemap:
            db !yoshi_egg_tile
    org $028EBC
        yoshi_egg_piece_props:
            db $02

    org $01F08B
        yoshi_throat_tilemap:
            db !yoshi_throat_tile
    org $01F097
        yoshi_throat_props:
            db $00

    org $029F7A
        yoshi_fireball_tilemap_1:
            db !yoshi_fire_1_tile
    org $029F7E
        yoshi_fireball_tilemap_2:
            db !yoshi_fire_2_tile
    org $029F8B
        yoshi_fireball_prop:
            db $34

    org $029F5C
        water_bubble_tilemap:
            db !water_bubble_tile
    org $028114
        bob_omb_explosion_tilemap:
            db !explosion_tile

    org $01C653
        coin_large_tilemap:
            db !coin_large_tile
    org $01C66D
        coin_small_tilemap:
            db !coin_rotating_tile
            db !coin_slim_tile
            db !coin_rotating_tile

    org $029A4B
            sta $0201|!addr,y
        spinning_coin_large_tilemap:
            lda.b #!coin_large_tile
    org $029A6E
        spinning_coin_small_tilemap:
            db !coin_rotating_tile
            db !coin_slim_tile
            db !coin_rotating_tile
    org $01E976
        lakitu_cloud_face_tilemap:
            db !cloud_face_tile
    org $01E97B
        lakitu_cloud_face_prop:
            db $38

    org $01F48C
        yoshi_tongue_tip_tilemap:
            db !yoshi_tongue_tip_tile
    org $01F488
        yoshi_tongue_body_tilemap:
            db !yoshi_tongue_body_tile
    org $01F494
        yoshi_tongue_props:
            db $08
pullpc

