includefrom "exgfx_ids.asm"

;#########################################################################
;# Sprite ExGFX ID list for custom sprites
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

.custom_sprites
;.00
    db !dss_id_null
    db !page_0
;.01
    db !dss_id_null
    db !page_0
;.02
    db !dss_id_null
    db !page_0
;.03
    db !dss_id_null
    db !page_0
;.04
    db !dss_id_null
    db !page_0
;.05
    db !dss_id_null
    db !page_0
;.06
    db !dss_id_null
    db !page_0
;.07
    db !dss_id_null
    db !page_0
;.08
    db !dss_id_null
    db !page_0
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
;.93
    db !dss_id_null
    db !page_0
;.94
    db !dss_id_null
    db !page_0
;.95
    db !dss_id_null
    db !page_0
;.96
    db !dss_id_null
    db !page_0
;.97
    db !dss_id_null
    db !page_0
;.98
    db !dss_id_null
    db !page_0
;.99
    db !dss_id_null
    db !page_0
;.9A
    db !dss_id_null
    db !page_0
;.9B
    db !dss_id_null
    db !page_0
;.9C
    db !dss_id_null
    db !page_0
;.9D
    db !dss_id_null
    db !page_0
;.9E
    db !dss_id_null
    db !page_0
;.9F
    db !dss_id_null
    db !page_0
;.A0
    db !dss_id_null
    db !page_0
;.A1
    db !dss_id_null
    db !page_0
;.A2
    db !dss_id_null
    db !page_0
;.A3
    db !dss_id_null
    db !page_0
;.A4
    db !dss_id_null
    db !page_0
;.A5
    db !dss_id_null
    db !page_0
;.A6
    db !dss_id_null
    db !page_0
;.A7
    db !dss_id_null
    db !page_0
;.A8
    db !dss_id_null
    db !page_0
;.A9
    db !dss_id_null
    db !page_0
;.AA
    db !dss_id_null
    db !page_0
;.AB
    db !dss_id_null
    db !page_0
;.AC
    db !dss_id_null
    db !page_0
;.AD
    db !dss_id_null
    db !page_0
;.AE
    db !dss_id_null
    db !page_0
;.AF
    db !dss_id_null
    db !page_0
;.B0
    db !dss_id_null
    db !page_0
;.B1
    db !dss_id_null
    db !page_0
;.B2
    db !dss_id_null
    db !page_0
;.B3
    db !dss_id_null
    db !page_0
;.B4
    db !dss_id_null
    db !page_0
;.B5
    db !dss_id_null
    db !page_0
;.B6
    db !dss_id_null
    db !page_0
;.B7
    db !dss_id_null
    db !page_0
;.B8
    db !dss_id_null
    db !page_0
;.B9
    db !dss_id_null
    db !page_0
;.BA
    db !dss_id_null
    db !page_0
;.BB
    db !dss_id_null
    db !page_0
;.BC
    db !dss_id_null
    db !page_0
;.BD
    db !dss_id_null
    db !page_0
;.BE
    db !dss_id_null
    db !page_0
;.BF
    db !dss_id_null
    db !page_0
;.C0
    db !dss_id_null
    db !page_0
;.C1
    db !dss_id_null
    db !page_0
;.C2
    db !dss_id_null
    db !page_0
;.C3
    db !dss_id_null
    db !page_0
;.C4
    db !dss_id_null
    db !page_0
;.C5
    db !dss_id_null
    db !page_0
;.C6
    db !dss_id_null
    db !page_0
;.C7
    db !dss_id_null
    db !page_0
;.C8
    db !dss_id_null
    db !page_0
;.C9
    db !dss_id_null
    db !page_0
;.CA
    db !dss_id_null
    db !page_0
;.CB
    db !dss_id_null
    db !page_0
;.CC
    db !dss_id_null
    db !page_0
;.CD
    db !dss_id_null
    db !page_0
;.CE
    db !dss_id_null
    db !page_0
;.CF
    db !dss_id_null
    db !page_0
;.D0
    db !dss_id_null
    db !page_0
;.D1
    db !dss_id_null
    db !page_0
;.D2
    db !dss_id_null
    db !page_0
;.D3
    db !dss_id_null
    db !page_0
;.D4
    db !dss_id_null
    db !page_0
;.D5
    db !dss_id_null
    db !page_0
;.D6
    db !dss_id_null
    db !page_0
;.D7
    db !dss_id_null
    db !page_0
;.D8
    db !dss_id_null
    db !page_0
;.D9
    db !dss_id_null
    db !page_0
;.DA
    db !dss_id_null
    db !page_0
;.DB
    db !dss_id_null
    db !page_0
;.DC
    db !dss_id_null
    db !page_0
;.DD
    db !dss_id_null
    db !page_0
;.DE
    db !dss_id_null
    db !page_0
;.DF
    db !dss_id_null
    db !page_0
;.E0
    db !dss_id_null
    db !page_0
;.E1
    db !dss_id_null
    db !page_0
;.E2
    db !dss_id_null
    db !page_0
;.E3
    db !dss_id_null
    db !page_0
;.E4
    db !dss_id_null
    db !page_0
;.E5
    db !dss_id_null
    db !page_0
;.E6
    db !dss_id_null
    db !page_0
;.E7
    db !dss_id_null
    db !page_0
;.E8
    db !dss_id_null
    db !page_0
;.E9
    db !dss_id_null
    db !page_0
;.EA
    db !dss_id_null
    db !page_0
;.EB
    db !dss_id_null
    db !page_0
;.EC
    db !dss_id_null
    db !page_0
;.ED
    db !dss_id_null
    db !page_0
;.EE
    db !dss_id_null
    db !page_0
;.EF
    db !dss_id_null
    db !page_0
;.F0
    db !dss_id_null
    db !page_0
;.F1
    db !dss_id_null
    db !page_0
;.F2
    db !dss_id_null
    db !page_0
;.F3
    db !dss_id_null
    db !page_0
;.F4
    db !dss_id_null
    db !page_0
;.F5
    db !dss_id_null
    db !page_0
;.F6
    db !dss_id_null
    db !page_0
;.F7
    db !dss_id_null
    db !page_0
;.F8
    db !dss_id_null
    db !page_0
;.F9
    db !dss_id_null
    db !page_0
;.FA
    db !dss_id_null
    db !page_0
;.FB
    db !dss_id_null
    db !page_0
;.FC
    db !dss_id_null
    db !page_0
;.FD
    db !dss_id_null
    db !page_0
;.FE
    db !dss_id_null
    db !page_0
;.FF
    db !dss_id_null
    db !page_0