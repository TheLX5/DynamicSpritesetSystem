includefrom "exgfx_ids.asm"

;#########################################################################
;# Sprite ExGFX ID list for spinning coin sprites
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

.spinning_coin_sprites
;.00 Null
    db !dss_id_null
    db !page_0
;.01 Regular coin
    db !dss_id_null 
    db !page_0

;################################################
;# Custom spinning coin sprites start here

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