includefrom "exgfx_ids.asm"

;#########################################################################
;# Sprite ExGFX ID list for bounce sprites
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

.bounce_sprites
;.00 Null
    db !dss_id_null
    db !page_0
;.01 Turn block
    db !dss_id_turn_block
    db !page_0
;.02 Note block
    db !dss_id_note_block
    db !page_0
;.03 Question block
    db !dss_id_question_block
    db !page_0
;.04 Sideways bouncing block
    db !dss_id_turn_block
    db !page_0
;.05 Glass block
    db !dss_id_glass_block
    db !page_0
;.06 ON/OFF block
    db !dss_id_on_off_bounce_block
    db !page_0
;.07 Turn block (turning)
    db !dss_id_turn_block
    db !page_0

;################################################
;# Custom bounce sprites start here

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