includeonce

find_and_queue_gfx_page_0:
find_and_queue_gfx:

.check_null
    cmp #!dss_id_null
    bne .init
..premature_return
    clc
    rtl

.init
    phy
    phx
    php
    phb
    pea $4040                       ; set data bank $40 for easy access purposes
    plb
    plb
    sep #$10

.search_gfx
    ldx #$00
..loop
    cmp.w !dss_list,x               ; search if the gfx is already loaded
    bne ..next
    ldy.w !dss_ex_list,x
    beq .found_gfx
..next
    inx 
    cpx #$20
    bne ..loop
    bra .setup_gfx_queue
    
.found_gfx
    inc.w !dss_list_usage,x         ; increase gfx reference count
    lda.b #!dss_time_to_unmark_gfx
    sta.w !dss_list_timer,x

    lda.w !dss_list_gfx_loaded,x
    bne ..tiles_in_vram
    rep #$20
    txa
    asl
    tay
    lda.w !dss_list_queue_index,y
    sec 
    sbc.w #!dss_queue_tiles*4
    sec
    sbc.w !dss_gfx_queue_index_nmi
    sep #$20
    beq ..tiles_in_vram
    bmi ..tiles_in_vram
    jmp .abort_queue

..tiles_in_vram
    lda #$01
    sta.w !dss_list_gfx_loaded,x

    rep #$20
    txa                             ; get correct index for the array location in the other array
    asl #5
    adc.w #!dss_tile_buffer_complete
    sta $0D
    sep #$20

    lda.b #!dss_tile_buffer_complete/$10000
    sta $0F                         ; unused, but could be useful for someone else...?

    ldy.w !dss_gfx_size,x
    dey
    sty $0C

    lda.w !dss_ex_list,x
    sta $0B
    lda.w !dss_list,x
    sta $0A
    ldy #$00
    tyx
..loop
    lda $0A
    cmp.w !dss_map,x
    bne ..next_tile
    lda $0B
    cmp.w !dss_ex_map,x
    bne ..next_tile
    lda.w !dss_vram_dest,x
    sta.w !dss_tile_buffer,y
    sta ($0D),y
    iny
    dec $0C 
    bmi ..tiles_loaded
..next_tile
    inx
    bra ..loop

..tiles_loaded
    plb
    plp
    plx
    ply
    sec
    rtl

.setup_gfx_queue                    ; no gfx loaded, proceed to load it
    tax
    lda.l exgfx_lenght_page_0,x            ; check if the current gfx has a valid tile lenght
    beq .abort_queue
    lda.w !dss_maximum_tiles        ; check if there's enough space to upload graphics
    sec 
    sbc.w !dss_loaded_tiles
    cmp.l exgfx_lenght_page_0,x            ; if there aren't enough free tiles, abort filling up the queue
    bcs .get_unused_gfx_slot
.abort_queue
    plb
    plp
    plx
    ply
    clc
    rtl

.get_unused_gfx_slot
    phx
    ldy #$00
..loop
    lda.w !dss_list,y               ; search for the first unused gfx slot
    cmp #$FF                        ; $FF = free gfx slot
    bne ..next 
    lda.w !dss_ex_list,y
    cmp #$FF
    beq .fill_data
..next
    iny 
    cpy.b #32
    bcc ..loop
    plx
    bra .abort_queue                ; end the routine and don't fill up the queue if there aren't any free gfx slots

.fill_data
    plx
    txa
    sta.w !dss_list,y               ; save exgfx id into list
    lda #$00
    sta.w !dss_ex_list,y

    lda.b #!dss_time_to_unmark_gfx
    sta.w !dss_list_timer,y

    lda.l exgfx_lenght_page_0,x            ; add up tile numbers
    sta.w !dss_gfx_size,y
    phy
    clc 
    adc.w !dss_loaded_tiles
    sta.w !dss_loaded_tiles
    
.decompress_gfx
    phx

    pea $4000
    plb

    rep #$20
    txa 
    and #$00FF
    ora.l !dss_exgfx_page_0         ; prepare for decompression on snes side
    sta $313E                       ; $313E = exgfx num
    lda.l !dss_ram_buffer_index
    and #$0007
    tax 
    lda #$0041
    sta $313C
    lda.l buffer_locations,x
    xba
    and #$FF00
    sta $313A                       ; $313A = decompression buffer
    sep #$20

    %invoke_snes(gfx_decompression) ; decompress exgfx file
    
    plb

    lda.w !dss_ram_buffer_index
    and #$07
    tax                             ; grab the correct offset
    lda.l buffer_locations,x
    sta $07
    stz $06
    inc.w !dss_ram_buffer_index     ; and increase the buffer index

.find_free_tiles
    ply                             ; Y = ExGFX ID
    plx                             ; X = List index
    sty $01 
    stx $02

    lda !dss_gfx_size,x             ; loop Z times
    dec
    sta $03
    sta $08
    stz $09

    rep #$20
    txa                             ; get correct index for the array location in the other array
    asl #5
    adc.w #!dss_tile_buffer_complete
    sta $0D
    sep #$20

    lda.b #!dss_tile_buffer_complete/$10000
    sta $0F                         ; unused, but could be useful for someone else...?

    ldy #$00
    tyx
..loop
    lda.w !dss_map,x
    cmp #$FF                        ; check if tile is unused
    bne ...next
    lda.w !dss_ex_map,x
    cmp #$FF
    beq ..store_tile
...next
    inx                             ; keep searching if it's used
    bra ..loop

..store_tile
    lda $01                         ; save exgfx id to the tile usage map
    sta.w !dss_map,x
    lda #$00
    sta.w !dss_ex_map,x
    lda.w !dss_vram_dest,x          ; load proper tile number to an array
    sta.w !dss_tile_buffer,y
    sta ($0D),y                     ; also save it to the array of arrays
    iny                             ; increase pointer to the array of tiles
    inx
    dec $03                         ; loop until we're done copying tile numbers, shouldn't be over 32 times
    bpl ..loop

.queue_tiles
    rep #$20
    ldx.w !dss_gfx_queue_index_game ; get last unused index in queue buffer
    ldy #$00
..loop
    lda.w !dss_tile_buffer,y        ; calculate tile column in vram
    and #$00FF
    asl #4
    ora #$7000                      ; OR $7000 to get the actual tile vram address
    sta.w !dss_gfx_queue_vram,x

    tya 
    and #$0007                      ; grab loop number and multiply it by 32
    xba 
    lsr #2
    sta $00
    tya 
    and #$00F8
    xba 
    lsr #1
    ora $00
    clc
    adc $06                         ; add frame index
    sta.w !dss_gfx_queue_ram,x

    txa
    clc
    adc #$0004
    sta.w !dss_gfx_queue_index_game
    tax
    iny                             ; increase queue index by 4 and tile index by 1
    dec $08                         ; decrease loop index by 1
    bpl ..loop

    lda $02
    and #$00FF
    asl                             ; save index to a ram
    tax
    lda.w !dss_gfx_queue_index_game
    sta.w !dss_list_queue_index,x

    sep #$20

    ldx $02
    stz.w !dss_list_gfx_loaded,x

.predictor
    rep #$20
    txa
    asl
    tay
    lda.w !dss_list_queue_index,y
    sec 
    sbc.w #!dss_queue_tiles*4
    sec
    sbc.w !dss_gfx_queue_index_nmi
    sep #$20
    beq ..tiles_uploaded_next_frame
    bmi ..tiles_uploaded_next_frame
    bra .queue_end

..tiles_uploaded_next_frame
    lda #$01
    sta.w !dss_list_gfx_loaded,x
    plb
    plp
    plx
    ply
    sec
    rtl

.queue_end
    plb
    plp
    plx
    ply
    clc
    rtl







find_and_queue_gfx_page_1:

.check_null
    cmp #!dss_id_null
    bne .init
..premature_return
    clc
    rtl

.init
    phy
    phx
    php
    phb
    pea $4040                       ; set data bank $40 for easy access purposes
    plb
    plb
    sep #$10

.search_gfx
    ldx #$00
..loop
    cmp.w !dss_list,x               ; search if the gfx is already loaded
    bne ..next
    ldy.w !dss_ex_list,x
    cpy #$01
    beq .found_gfx
..next
    inx 
    cpx #$20
    bne ..loop
    bra .setup_gfx_queue
    
.found_gfx
    inc.w !dss_list_usage,x         ; increase gfx reference count
    lda.b #!dss_time_to_unmark_gfx
    sta.w !dss_list_timer,x

    lda.w !dss_list_gfx_loaded,x
    bne ..tiles_in_vram
    rep #$20
    txa
    asl
    tay
    lda.w !dss_list_queue_index,y
    sec 
    sbc.w #!dss_queue_tiles*4
    sec
    sbc.w !dss_gfx_queue_index_nmi
    sep #$20
    beq ..tiles_in_vram
    bmi ..tiles_in_vram
    jmp .abort_queue

..tiles_in_vram
    lda #$01
    sta.w !dss_list_gfx_loaded,x

    rep #$20
    txa                             ; get correct index for the array location in the other array
    asl #5
    adc.w #!dss_tile_buffer_complete
    sta $0D
    sep #$20

    lda.b #!dss_tile_buffer_complete/$10000
    sta $0F                         ; unused, but could be useful for someone else...?

    ldy.w !dss_gfx_size,x
    dey
    sty $0C

    lda.w !dss_ex_list,x
    sta $0B
    lda.w !dss_list,x
    sta $0A
    ldy #$00
    tyx
..loop
    lda $0A
    cmp.w !dss_map,x
    bne ..next_tile
    lda $0B
    cmp.w !dss_ex_map,x
    bne ..next_tile
    lda.w !dss_vram_dest,x
    sta.w !dss_tile_buffer,y
    sta ($0D),y
    iny
    dec $0C 
    bmi ..tiles_loaded
..next_tile
    inx
    bra ..loop

..tiles_loaded
    plb
    plp
    plx
    ply
    sec
    rtl

.setup_gfx_queue                    ; no gfx loaded, proceed to load it
    tax
    lda.l exgfx_lenght_page_1,x            ; check if the current gfx has a valid tile lenght
    beq .abort_queue
    lda.w !dss_maximum_tiles        ; check if there's enough space to upload graphics
    sec 
    sbc.w !dss_loaded_tiles
    cmp.l exgfx_lenght_page_1,x            ; if there aren't enough free tiles, abort filling up the queue
    bcs .get_unused_gfx_slot
.abort_queue
    plb
    plp
    plx
    ply
    clc
    rtl

.get_unused_gfx_slot
    phx
    ldy #$00
..loop
    lda.w !dss_list,y               ; search for the first unused gfx slot
    cmp #$FF                        ; $FF = free gfx slot
    bne ..next 
    lda.w !dss_ex_list,y
    cmp #$FF
    beq .fill_data
..next
    iny 
    cpy.b #32
    bcc ..loop
    plx
    bra .abort_queue                ; end the routine and don't fill up the queue if there aren't any free gfx slots

.fill_data
    plx
    txa
    sta.w !dss_list,y               ; save exgfx id into list
    lda #$01
    sta.w !dss_ex_list,y

    lda.b #!dss_time_to_unmark_gfx
    sta.w !dss_list_timer,y

    lda.l exgfx_lenght_page_1,x            ; add up tile numbers
    sta.w !dss_gfx_size,y
    phy
    clc 
    adc.w !dss_loaded_tiles
    sta.w !dss_loaded_tiles
    
.decompress_gfx
    phx

    pea $4000
    plb

    rep #$20
    txa 
    and #$00FF
    ora.l !dss_exgfx_page_1         ; prepare for decompression on snes side
    sta $313E                       ; $313E = exgfx num
    lda.l !dss_ram_buffer_index
    and #$0007
    tax 
    lda #$0041
    sta $313C
    lda.l buffer_locations,x
    xba
    and #$FF00
    sta $313A                       ; $313A = decompression buffer
    sep #$20

    %invoke_snes(gfx_decompression) ; decompress exgfx file
    
    plb

    lda.w !dss_ram_buffer_index
    and #$07
    tax                             ; grab the correct offset
    lda.l buffer_locations,x
    sta $07
    stz $06
    inc.w !dss_ram_buffer_index     ; and increase the buffer index

.find_free_tiles
    ply                             ; Y = ExGFX ID
    plx                             ; X = List index
    sty $01 
    stx $02

    lda !dss_gfx_size,x             ; loop Z times
    dec
    sta $03
    sta $08
    stz $09

    rep #$20
    txa                             ; get correct index for the array location in the other array
    asl #5
    adc.w #!dss_tile_buffer_complete
    sta $0D
    sep #$20

    lda.b #!dss_tile_buffer_complete/$10000
    sta $0F                         ; unused, but could be useful for someone else...?

    ldy #$00
    tyx
..loop
    lda.w !dss_map,x
    cmp #$FF                        ; check if tile is unused
    bne ...next
    lda.w !dss_ex_map,x
    cmp #$FF
    beq ..store_tile
...next
    inx                             ; keep searching if it's used
    bra ..loop

..store_tile
    lda $01                         ; save exgfx id to the tile usage map
    sta.w !dss_map,x
    lda #$01
    sta.w !dss_ex_map,x
    lda.w !dss_vram_dest,x          ; load proper tile number to an array
    sta.w !dss_tile_buffer,y
    sta ($0D),y                     ; also save it to the array of arrays
    iny                             ; increase pointer to the array of tiles
    inx
    dec $03                         ; loop until we're done copying tile numbers, shouldn't be over 32 times
    bpl ..loop

.queue_tiles
    rep #$20
    ldx.w !dss_gfx_queue_index_game ; get last unused index in queue buffer
    ldy #$00
..loop
    lda.w !dss_tile_buffer,y        ; calculate tile column in vram
    and #$00FF
    asl #4
    ora #$7000                      ; OR $7000 to get the actual tile vram address
    sta.w !dss_gfx_queue_vram,x

    tya 
    and #$0007                      ; grab loop number and multiply it by 32
    xba 
    lsr #2
    sta $00
    tya 
    and #$00F8
    xba 
    lsr #1
    ora $00
    clc
    adc $06                         ; add frame index
    sta.w !dss_gfx_queue_ram,x

    txa
    clc
    adc #$0004
    sta.w !dss_gfx_queue_index_game
    tax
    iny                             ; increase queue index by 4 and tile index by 1
    dec $08                         ; decrease loop index by 1
    bpl ..loop

    lda $02
    and #$00FF
    asl                             ; save index to a ram
    tax
    lda.w !dss_gfx_queue_index_game
    sta.w !dss_list_queue_index,x

    sep #$20

    ldx $02
    stz.w !dss_list_gfx_loaded,x

.predictor
    rep #$20
    txa
    asl
    tay
    lda.w !dss_list_queue_index,y
    sec 
    sbc.w #!dss_queue_tiles*4
    sec
    sbc.w !dss_gfx_queue_index_nmi
    sep #$20
    beq ..tiles_uploaded_next_frame
    bmi ..tiles_uploaded_next_frame
    bra .queue_end

..tiles_uploaded_next_frame
    lda #$01
    sta.w !dss_list_gfx_loaded,x
    plb
    plp
    plx
    ply
    sec
    rtl

.queue_end
    plb
    plp
    plx
    ply
    clc
    rtl




buffer_locations:
    db $20,$2C,$38,$44
    db $50,$5C,$68,$74

gfx_decompression:
    rep #$20
    lda $313A
    sta $00
    ldx $313C
    stx $02
    lda $313E
    jsl $0FF900
    sep #$20
    rtl

;#########################################################################
;# Late game routines

late_game_routines:

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


.bounce
    ldx.b #!BounceSize-1
..loop
    lda !bounce_num,x
    beq ..next
    cmp.l !dss_bounce_sprite_copy,x
    sta.l !dss_bounce_sprite_copy,x
    beq ..next
    rep #$30
    and #$00FF
    asl 
    tay 
    lda.w exgfx_ids_bounce_sprites,y
    cmp #$0100
    sep #$30
    bcs ..queue_1
..queue_0
    jsl find_and_queue_gfx
    bra ..next
..queue_1
    jsl find_and_queue_gfx_page_1
..next
    dex
    bpl ..loop




.regular
    ldx.b #!SprSize-1
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
    rep #$30
    and #$00FF
    asl 
    tay 
    lda.w exgfx_ids_original_sprites,y
    cmp #$0100
    sep #$30
    bcs ..queue_1
    bra ..queue_0
..custom
    lda !7FAB9E,x
    cmp.l !dss_custom_sprite_copy,x
    sta.l !dss_custom_sprite_copy,x
    beq ..next 
    rep #$30
    and #$00FF
    asl 
    tay 
    lda.w exgfx_ids_custom_sprites,y
    cmp #$0100
    sep #$30
    bcs ..queue_1
..queue_0
    jsl find_and_queue_gfx
    bra ..next
..queue_1
    jsl find_and_queue_gfx_page_1
..next 
    dex 
    bpl ..loop




.extended
    ldx.b #!ExtendedSize+2-1
..loop
    lda !extended_num,x
    beq ..next
    cmp.l !dss_extended_sprite_copy,x
    sta.l !dss_extended_sprite_copy,x
    beq ..next
    rep #$30
    and #$00FF
    asl 
    tay 
    lda.w exgfx_ids_extended_sprites,y
    cmp #$0100
    sep #$30
    bcs ..queue_1
..queue_0
    jsl find_and_queue_gfx
    bra ..next
..queue_1
    jsl find_and_queue_gfx_page_1
..next
    dex 
    bpl ..loop


.score
    ldx.b #!ScoreSize-1
..loop
    lda !score_num,x
    beq ..next
    cmp.l !dss_score_sprite_copy,x
    sta.l !dss_score_sprite_copy,x
    beq ..next
    rep #$30
    and #$00FF
    asl 
    tay 
    lda.w exgfx_ids_score_sprites,y
    cmp #$0100
    sep #$30
    bcs ..queue_1
..queue_0
    jsl find_and_queue_gfx
    bra ..next
..queue_1
    jsl find_and_queue_gfx_page_1
..next
    dex
    bpl ..loop
    


.minor_extended
    ldx.b #!MinorExtendedSize-1
..loop
    lda !minor_extended_num,x
    beq ..next
    cmp.l !dss_minor_extended_sprite_copy,x
    sta.l !dss_minor_extended_sprite_copy,x
    beq ..next
    rep #$30
    and #$00FF
    asl 
    tay 
    lda.w exgfx_ids_minor_extended_sprites,y
    cmp #$0100
    sep #$30
    bcs ..queue_1
..queue_0
    jsl find_and_queue_gfx
    bra ..next
..queue_1
    jsl find_and_queue_gfx_page_1
..next
    dex
    bpl ..loop




.smoke
    ldx.b #!SmokeSize-1
..loop
    lda !smoke_num,x
    beq ..next
    cmp.l !dss_smoke_sprite_copy,x
    sta.l !dss_smoke_sprite_copy,x
    beq ..next
    rep #$30
    and #$00FF
    asl 
    tay 
    lda.w exgfx_ids_smoke_sprites,y
    cmp #$0100
    sep #$30
    bcs ..queue_1
..queue_0
    jsl find_and_queue_gfx
    bra ..next
..queue_1
    jsl find_and_queue_gfx_page_1
..next
    dex
    bpl ..loop




.spinning
    ldx.b #!SpinningCoinSize-1
..loop
    lda !spinning_coin_num,x
    beq ..next
    cmp.l !dss_spinning_coin_sprite_copy,x
    sta.l !dss_spinning_coin_sprite_copy,x
    beq ..next
    rep #$30
    and #$00FF
    asl 
    tay 
    lda.w exgfx_ids_spinning_coin_sprites,y
    cmp #$0100
    sep #$30
    bcs ..queue_1
..queue_0
    jsl find_and_queue_gfx
    bra ..next
..queue_1
    jsl find_and_queue_gfx_page_1
..next
    dex
    bpl ..loop




.cluster
    lda $18B8|!addr
    beq ..skip
    ldx.b #!ClusterSize-1
..loop
    lda !cluster_num,x
    beq ..next
    cmp.l !dss_cluster_sprite_copy,x
    sta.l !dss_cluster_sprite_copy,x
    beq ..next
    rep #$30
    and #$00FF
    asl 
    tay 
    lda.w exgfx_ids_cluster_sprites,y
    cmp #$0100
    sep #$30
    bcs ..queue_1
..queue_0
    jsl find_and_queue_gfx
    bra ..next
..queue_1
    jsl find_and_queue_gfx_page_1
..next 
    dex
    bpl ..loop
..skip


    plb


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
    lda.w !dss_ex_list,x
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
    sta $0A
    lda !dss_ex_list,x
    sta $0B

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
    cmp $0A
    bne ..next
    lda.w !dss_ex_map,x
    cmp $0B
    bne ..next
    lda #$FF
    sta.w !dss_map,x                    ; clear map data
    lda #$FF
    sta.w !dss_ex_map,x

..next
    lda #$FF
    sta ($0D),y                         ; clear tile data

    iny                                 ; loop until every slot has been searched/cleared
    cpy #$20
    bcc ..loop

    plx

    lda #$FF
    sta.w !dss_list,x
    sta.w !dss_ex_list,x
    stz.w !dss_list_timer,x
    stz.w !dss_gfx_size,x
    stz.w !dss_list_gfx_loaded,x
    stz.w !dss_list_queue_index,x

    jmp .skip_list_slot
