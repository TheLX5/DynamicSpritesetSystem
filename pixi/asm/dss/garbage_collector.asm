includefrom "dynamic_spritesets.asm"

;#########################################################################
;# Dynamic Spriteset's late game routines
;# 
;# This file handles any routine that needs to run VERY late into the game.
;# The system uses it to mark tiles as unused and load graphics of recently
;# spawned sprites.

pushpc
    org $00A2EE
        autoclean jml late_game_routines
        nop
pullpc

late_game_routines:
    sta $1C

    %invoke_sa1(late_game_wrapper)

    jml $0097B9                         ; jump back to a reliable JMP $8494 in bank 0

late_game_wrapper:
    jsl fill_sprites
    jml garbage_collector


;#########################################################################
;# Load sprite GFXs
;# 
;# This routine checks if a sprite was spawned during this frame and queues
;# its ExGFX if it's not loaded to avoid an extra frame of delay on recently
;# generated sprites.

fill_sprites:
    phb
    phk
    plb
.regular
    ldx.b #22-1
..loop
    lda !14C8,x
    beq ..next 
    lda !7FAB10,x
    and #$08
    bne ..custom
..regular
    lda !9E,x
    cmp.l !dss_regular_sprite_copy,x
    sta.l !dss_regular_sprite_copy,x
    beq ..next 
    tay 
    lda.w exgfx_ids_original_sprites,y
    bra ..queue
..custom
    lda !7FAB10,x
    cmp.l !dss_custom_sprite_copy,x
    sta.l !dss_custom_sprite_copy,x
    beq ..next 
    tay 
    lda.w exgfx_ids_custom_sprites,y
..queue
    jsl find_and_queue_gfx
..next 
    dex 
    bpl ..loop

.extended
    ldx.b #10-1
..loop
    lda $170B|!addr,x
    beq ..next
    cmp.l !dss_extended_sprite_copy,x
    sta.l !dss_extended_sprite_copy,x
    beq ..next
    tay 
    lda.w exgfx_ids_extended_sprites,y
    jsl find_and_queue_gfx
..next
    dex 
    bpl ..loop

.cluster
    lda $18B8|!addr
    beq ..skip
    ldx.b #20-1
..loop
    lda $1892|!addr,x
    beq ..next
    cmp.l !dss_cluster_sprite_copy,x
    sta.l !dss_cluster_sprite_copy,x
    beq ..next
    tay
    lda.w exgfx_ids_cluster_sprites,y
    jsl find_and_queue_gfx
..next 
    dex
    bpl ..loop
..skip
    plb
    rtl


;#########################################################################
;# Garbage collector
;#
;# Marks tiles and GFX as unused when there's no sprite trying to use them
;# after a determined amount of frames (!dss_time_to_unmark_gfx)
;#
;# To protect any GFX file you should call "find_and_queue_gfx" with the
;# desired GFX file at least once during the frame.
;# UberASM, LevelASM or sprite code should be enough.

garbage_collector:

    pea $0040
    plb
    ldx.b #0
.loop_list
    lda.w !dss_list,x                   ; check if GFX is even loaded/in queue
    cmp #$FF 
    beq .skip_list_slot

    lda.w !dss_list_usage,x             ; check if GFX is being used
    bne .skip_list_slot
    lda.w !dss_list_timer,x             ; decrease timer if not being used
    dec 
    bmi .unmark                         ; if negative/zero, unmark the current file
    sta.w !dss_list_timer,x

.skip_list_slot
    stz.w !dss_list_usage,x             ; reset usage each frame

    inx
    cpx #$20                            ; loop until there are no more slots to check
    bcc .loop_list

    plb
    rtl


.unmark
    lda.w !dss_loaded_tiles             
    sec                                 ; substract tiles loaded
    sbc.w !dss_gfx_size,x
    sta.w !dss_loaded_tiles

    rep #$20
    txa
    asl #5                              ; get index to array of arrays
    adc.w #!dss_tile_buffer_complete
    sta $0D
    sep #$20

    lda !dss_list,x                     ; get GFX file
    sta $0F

    phx
    ldy #$00
    tyx
..loop
    lda ($0D),y
    cmp #$FF
    beq ..next
    ldx #$00
...loop_vram
    cmp.w !dss_vram_dest,x
    beq ..found_offset
    inx 
    bra ...loop_vram
..found_offset
    lda.w !dss_map,x                    ; failsafe: check if gfx num is the same as the one in the map
    cmp $0F
    bne ..next
    lda #$FF
    sta.w !dss_map,x                    ; clear map data
..next
    lda #$FF
    sta ($0D),y                         ; clear tile data

    iny                                 ; loop until every slot has been searched/cleared
    cpy #$20
    bcc ..loop

    plx

    lda #$FF
    sta.w !dss_list,x
    stz.w !dss_list_timer,x
    stz.w !dss_gfx_size,x
    stz.w !dss_list_gfx_loaded,x
    stz.w !dss_list_queue_index,x

    jmp .skip_list_slot

