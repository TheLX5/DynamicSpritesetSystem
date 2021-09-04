includefrom "dynamic_spritesets.asm"

;#########################################################################
;# Sprite ExGFX ID list
;# 
;# Whenever a sprite is spawned that's new to the frame (i.e spawned from a
;# generator, shooter or any sprite), it will try to load the ExGFX below
;# in the same frame it was spawned, so there won't be any extra delay
;# (+1 frame) when it's supposed to be on screen
;# 
;# You can force only one ExGFX file to be put in queue when said sprite
;# is spawned.
;#
;# This system supports almost every sprite type PIXI supports, which is
;# basically every sprite system with graphics in the game.
;# 

!page_0 = $00
!page_1 = $01

exgfx_ids:
    incsrc "exgfx_ids/original_sprites.asm"
    incsrc "exgfx_ids/custom_sprites.asm"
    incsrc "exgfx_ids/extended.asm"
    incsrc "exgfx_ids/cluster.asm"
    incsrc "exgfx_ids/bounce.asm"
    incsrc "exgfx_ids/minor_extended.asm"
    incsrc "exgfx_ids/smoke.asm"
    incsrc "exgfx_ids/score.asm"
    incsrc "exgfx_ids/spinning_coin.asm"