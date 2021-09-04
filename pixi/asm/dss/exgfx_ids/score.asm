includefrom "exgfx_ids.asm"

;#########################################################################
;# Sprite ExGFX ID list for score sprites
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

.score_sprites
;.00 Null
    db !dss_id_null
    db !page_0
;.01 10 points
    db !dss_id_null 
    db !page_0
;.02 20 points
    db !dss_id_null 
    db !page_0
;.03 40 points
    db !dss_id_null 
    db !page_0
;.04 80 points
    db !dss_id_null 
    db !page_0
;.05 100 points
    db !dss_id_null 
    db !page_0
;.06 200 points
    db !dss_id_null 
    db !page_0
;.07 400 points
    db !dss_id_null 
    db !page_0
;.08 800 points
    db !dss_id_null 
    db !page_0
;.09 1000 points
    db !dss_id_null
    db !page_0
;.0A 2000 points
    db !dss_id_boo
    db !page_0
;.0B 4000 points
    db !dss_id_null
    db !page_0
;.0C 8000 points
    db !dss_id_null
    db !page_0
;.0D 1-Up
    db !dss_id_null
    db !page_0
;.0E 2-Up
    db !dss_id_null
    db !page_0
;.0F 3-Up
    db !dss_id_null
    db !page_0
;.10 5-Up
    db !dss_id_null
    db !page_0
;.11 5 coins
    db !dss_id_null
    db !page_0
;.12 10 coins
    db !dss_id_null
    db !page_0
;.13 15 coins
    db !dss_id_null
    db !page_0
;.14 20 coins
    db !dss_id_null
    db !page_0
;.15 25 coins
    db !dss_id_null
    db !page_0

;################################################
;# Custom score sprites start here

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