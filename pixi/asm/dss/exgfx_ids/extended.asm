includefrom "exgfx_ids.asm"

;#########################################################################
;# Sprite ExGFX ID list for extended sprites
;# 
;# Whenever a sprite is spawned that's new to the frame (i.e spawned from a
;# generator, shooter or any sprite), it will try to load the ExGFX below
;# in the same frame it was spawned, so there won't be any extra delay
;# (+1 frame) when it's supposed to be on screen
;# 
;# You can force only one ExGFX file to be put in queue when said sprite
;# is spawned.
;#
;# The second byte in each entry determines the page used for the ExGFX
;# select either !page_0 or !page_1, which will depend on the sprite.

.extended_sprites
;.00 Null
    db !dss_id_null
    db !page_0
;.01 Smoke puff
    db !dss_id_null
    db !page_0
;.02 Reznor fireball
    db !dss_id_reznor_fireball
    db !page_0
;.03 Hopping flame's flame
    db !dss_id_hopping_flame
    db !page_0
;.04 Hammer
    db !dss_id_hammer_projectile
    db !page_0
;.05 Player fireball
    db !dss_id_null
    db !page_0
;.06 Bone
    db !dss_id_bone_projectile
    db !page_0
;.07 Lava splash
    db !dss_id_null
    db !page_0
;.08 Torpedo ted arm
    db !dss_id_torpedo_ted_hand
    db !page_0
;.09 Null
    db !dss_id_null
    db !page_0
;.0A Smiling coin
    db !dss_id_smiling_coin
    db !page_0
;.0B Piranha plant fireball
    db !dss_id_null
    db !page_0
;.0C Lava lotus projectile
    db !dss_id_volcano_lotus
    db !page_0
;.0D Baseball
    db !dss_id_chuck_pitchin_puntin
    db !page_0
;.0E Wiggler flower
    db !dss_id_misc_tiles_2
    db !page_0
;.0F Trail of smoke
    db !dss_id_null
    db !page_0
;.10 Spinjump stars
    db !dss_id_null
    db !page_0
;.11 Yoshi fireballs
    db !dss_id_yoshi_fireball
    db !page_0
;.12 Water bubble
    db !dss_id_null
    db !page_0

;################################################
;# Custom extended sprites start here

;.13
    db !dss_id_null
    db !page_0
;.14
    db !dss_id_null
    db !page_0
;.15
    db !dss_id_null
    db !page_0
;.16
    db !dss_id_null
    db !page_0
;.17
    db !dss_id_null
    db !page_0
;.18
    db !dss_id_null
    db !page_0
;.19
    db !dss_id_null
    db !page_0
;.1A
    db !dss_id_null
    db !page_0
;.1B
    db !dss_id_null
    db !page_0
;.1C
    db !dss_id_null
    db !page_0
;.1D
    db !dss_id_null
    db !page_0
;.1E
    db !dss_id_null
    db !page_0
;.1F
    db !dss_id_null
    db !page_0
;.20
    db !dss_id_null
    db !page_0
;.21
    db !dss_id_null
    db !page_0
;.22
    db !dss_id_null
    db !page_0
;.23
    db !dss_id_null
    db !page_0
;.24
    db !dss_id_null
    db !page_0
;.25
    db !dss_id_null
    db !page_0
;.26
    db !dss_id_null
    db !page_0
;.27
    db !dss_id_null
    db !page_0
;.28
    db !dss_id_null
    db !page_0
;.29
    db !dss_id_null
    db !page_0
;.2A
    db !dss_id_null
    db !page_0
;.2B
    db !dss_id_null
    db !page_0
;.2C
    db !dss_id_null
    db !page_0
;.2D
    db !dss_id_null
    db !page_0
;.2E
    db !dss_id_null
    db !page_0
;.2F
    db !dss_id_null
    db !page_0
;.30
    db !dss_id_null
    db !page_0
;.31
    db !dss_id_null
    db !page_0
;.32
    db !dss_id_null
    db !page_0
;.33
    db !dss_id_null
    db !page_0
;.34
    db !dss_id_null
    db !page_0
;.35
    db !dss_id_null
    db !page_0
;.36
    db !dss_id_null
    db !page_0
;.37
    db !dss_id_null
    db !page_0
;.38
    db !dss_id_null
    db !page_0
;.39
    db !dss_id_null
    db !page_0
;.3A
    db !dss_id_null
    db !page_0
;.3B
    db !dss_id_null
    db !page_0
;.3C
    db !dss_id_null
    db !page_0
;.3D
    db !dss_id_null
    db !page_0
;.3E
    db !dss_id_null
    db !page_0
;.3F
    db !dss_id_null
    db !page_0
;.40
    db !dss_id_null
    db !page_0
;.41
    db !dss_id_null
    db !page_0
;.42
    db !dss_id_null
    db !page_0
;.43
    db !dss_id_null
    db !page_0
;.44
    db !dss_id_null
    db !page_0
;.45
    db !dss_id_null
    db !page_0
;.46
    db !dss_id_null
    db !page_0
;.47
    db !dss_id_null
    db !page_0
;.48
    db !dss_id_null
    db !page_0
;.49
    db !dss_id_null
    db !page_0
;.4A
    db !dss_id_null
    db !page_0
;.4B
    db !dss_id_null
    db !page_0
;.4C
    db !dss_id_null
    db !page_0
;.4D
    db !dss_id_null
    db !page_0
;.4E
    db !dss_id_null
    db !page_0
;.4F
    db !dss_id_null
    db !page_0
;.50
    db !dss_id_null
    db !page_0
;.51
    db !dss_id_null
    db !page_0
;.52
    db !dss_id_null
    db !page_0
;.53
    db !dss_id_null
    db !page_0
;.54
    db !dss_id_null
    db !page_0
;.55
    db !dss_id_null
    db !page_0
;.56
    db !dss_id_null
    db !page_0
;.57
    db !dss_id_null
    db !page_0
;.58
    db !dss_id_null
    db !page_0
;.59
    db !dss_id_null
    db !page_0
;.5A
    db !dss_id_null
    db !page_0
;.5B
    db !dss_id_null
    db !page_0
;.5C
    db !dss_id_null
    db !page_0
;.5D
    db !dss_id_null
    db !page_0
;.5E
    db !dss_id_null
    db !page_0
;.5F
    db !dss_id_null
    db !page_0
;.60
    db !dss_id_null
    db !page_0
;.61
    db !dss_id_null
    db !page_0
;.62
    db !dss_id_null
    db !page_0
;.63
    db !dss_id_null
    db !page_0
;.64
    db !dss_id_null
    db !page_0
;.65
    db !dss_id_null
    db !page_0
;.66
    db !dss_id_null
    db !page_0
;.67
    db !dss_id_null
    db !page_0
;.68
    db !dss_id_null
    db !page_0
;.69
    db !dss_id_null
    db !page_0
;.6A
    db !dss_id_null
    db !page_0
;.6B
    db !dss_id_null
    db !page_0
;.6C
    db !dss_id_null
    db !page_0
;.6D
    db !dss_id_null
    db !page_0
;.6E
    db !dss_id_null
    db !page_0
;.6F
    db !dss_id_null
    db !page_0
;.70
    db !dss_id_null
    db !page_0
;.71
    db !dss_id_null
    db !page_0
;.72
    db !dss_id_null
    db !page_0
;.73
    db !dss_id_null
    db !page_0
;.74
    db !dss_id_null
    db !page_0
;.75
    db !dss_id_null
    db !page_0
;.76
    db !dss_id_null
    db !page_0
;.77
    db !dss_id_null
    db !page_0
;.78
    db !dss_id_null
    db !page_0
;.79
    db !dss_id_null
    db !page_0
;.7A
    db !dss_id_null
    db !page_0
;.7B
    db !dss_id_null
    db !page_0
;.7C
    db !dss_id_null
    db !page_0
;.7D
    db !dss_id_null
    db !page_0
;.7E
    db !dss_id_null
    db !page_0
;.7F
    db !dss_id_null
    db !page_0
;.80
    db !dss_id_null
    db !page_0
;.81
    db !dss_id_null
    db !page_0
;.82
    db !dss_id_null
    db !page_0
;.83
    db !dss_id_null
    db !page_0
;.84
    db !dss_id_null
    db !page_0
;.85
    db !dss_id_null
    db !page_0
;.86
    db !dss_id_null
    db !page_0
;.87
    db !dss_id_null
    db !page_0
;.88
    db !dss_id_null
    db !page_0
;.89
    db !dss_id_null
    db !page_0
;.8A
    db !dss_id_null
    db !page_0
;.8B
    db !dss_id_null
    db !page_0
;.8C
    db !dss_id_null
    db !page_0
;.8D
    db !dss_id_null
    db !page_0
;.8E
    db !dss_id_null
    db !page_0
;.8F
    db !dss_id_null
    db !page_0
;.90
    db !dss_id_null
    db !page_0
;.91
    db !dss_id_null
    db !page_0
;.92
    db !dss_id_null
    db !page_0