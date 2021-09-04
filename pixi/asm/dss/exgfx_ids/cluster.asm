includefrom "exgfx_ids.asm"

;#########################################################################
;# Sprite ExGFX ID list for cluster sprites
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

.cluster_sprites
;.00 Null
    db !dss_id_null
    db !page_0
;.01 1-Up from bonus game
    db !dss_id_null
    db !page_0
;.02 Null
    db !dss_id_null
    db !page_0
;.03 Boo from boo ceiling
    db !dss_id_boo
    db !page_0
;.04 Boo from boo ring
    db !dss_id_boo
    db !page_0
;.05 Background flame
    db !dss_id_background_flames
    db !page_0
;.06 Fire pillar
    db !dss_id_fire_pillar
    db !page_0
;.07 Reappearing boo
    db !dss_id_boo
    db !page_0
;.08 Swooper bat
    db !dss_id_swooper_bat
    db !page_0

;################################################
;# Custom cluster sprites start here

;.09
    db !dss_id_null
    db !page_0
;.0A
    db !dss_id_null
    db !page_0
;.0B
    db !dss_id_null
    db !page_0
;.0C
    db !dss_id_null
    db !page_0
;.0D
    db !dss_id_null
    db !page_0
;.0E
    db !dss_id_null
    db !page_0
;.0F
    db !dss_id_null
    db !page_0
;.10
    db !dss_id_null
    db !page_0
;.11
    db !dss_id_null
    db !page_0
;.12
    db !dss_id_null
    db !page_0
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