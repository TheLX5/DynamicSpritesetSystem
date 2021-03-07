;#########################################################################
;# Customization defines

;# Location of the configuration used in the main patch.
    !dss_config = $02D60B

;# Starting ExGFX ID for the dynamic spritesets
    !dss_exgfx = read2(!dss_config+3)

;# How many tiles from the queue will be uploaded per frame
    !dss_queue_tiles = read1(!dss_config+5)

;# How many frames are needed to mark a GFX as unused
    !dss_time_to_unmark_gfx = read1(!dss_config+6)

;# Main RAM define
;# Requires at least 1745 (0x6D1) bytes of consecutive free RAM
;# or you could edit the defines below to make some of them not consecutive
    !dss_ram = read3(!dss_config)

;####################################################################
;# RAM defines

;# Map of used 16x16 tiles in SP3-SP4.
;# Each entry has an 8-bit ID, useful to quickly compare data
;# 64 bytes
    !dss_map #= !dss_ram

;# List of IDs of the currently loaded GFX files.
;# FF = Invalid GFX
;# 32 bytes
    !dss_list #= !dss_map+64

;# Timer to mark as unused each GFX file
;# Each GFX is marked as unused after 16 frames of being unused
;# This is customizable in a global basis
;# 32 bytes
    !dss_list_timer #= !dss_list+32

;# Amount of tiles used by each loaded GFX
;# 32 bytes
    !dss_gfx_size #= !dss_list_timer+32

;# ExGFX usage map
;# How many times each GFX was searched within a frame, if zero, the timer will start to tick down.
;# 32 bytes
    !dss_list_usage #= !dss_gfx_size+32

;# Array containing tile number for the latest loaded/searched ExGFX file
;# 32 bytes
    !dss_tile_buffer #= !dss_list_usage+32

;# Array of arrays containing tile numbers for each GFX loaded
;# 1024 bytes
    !dss_tile_buffer_complete #= !dss_tile_buffer+32

;# Index used to select one of the eight possible buffers to decompress RAM to
;# 1 byte
    !dss_ram_buffer_index #= !dss_tile_buffer_complete+1024

;# Holds the maximum amount of tiles used by DSS.
;# Can be modified. Can't be over 64 or bad things will happen.
;# 1 byte
    !dss_maximum_tiles #= !dss_ram_buffer_index+1

;# Holds the current amount of tiles used by DSS
;# It can't exceed !dss_maximum_tiles
;# 1 byte
    !dss_loaded_tiles #= !dss_maximum_tiles+1

;# Queue of pending graphics to be uploaded to VRAM
;# The values are supposed to be VRAM locations for each 16x16 tile needed to be uploaded to VRAM
;# Up to 64 tiles can be put in queue, but only a certain amount will be uploaded each frame which
;# is determined by !dss_queue_tiles
;# Format:
;#      Byte 1-2: VRAM destination
;#      Byte 3-4: RAM GFX buffer location
;# 256 bytes
    !dss_gfx_queue #= !dss_loaded_tiles+1
    !dss_gfx_queue_vram #= !dss_gfx_queue
    !dss_gfx_queue_ram #= !dss_gfx_queue+2

;# Index for the GFX upload queue. 
    !dss_gfx_queue_index_nmi #= !dss_gfx_queue+256
    !dss_gfx_queue_index_game #= !dss_gfx_queue_index_nmi+2

;# Map of possible VRAM destinations for sprite tiles
;# FF is treated as invalid.
;# 64 bytes
    !dss_vram_dest #= !dss_gfx_queue_index_game+2

;# 16-bit table which contains the last queue index written to for the current
;# GFX.
;# 64 bytes
    !dss_list_queue_index = !dss_vram_dest+64

;# List of flags for each item in the GFX list to determine wheter the GFX has been loaded
;# or not
;# 32 bytes
    !dss_list_gfx_loaded = !dss_list_queue_index+64

;# Copy of the regular sprite number table ($9E)
;# 22 bytes
    !dss_regular_sprite_copy = !dss_list_gfx_loaded+64

;# Copy of the custom sprite number table ($7FAB10)
;# 22 bytes
    !dss_custom_sprite_copy = !dss_regular_sprite_copy+22

;# Copy of the extended sprite number table ($170B)
;# 10 bytes
    !dss_extended_sprite_copy = !dss_custom_sprite_copy+22

;# Copy of the cluster sprite table ($1892)
;# 20 bytes
    !dss_cluster_sprite_copy = !dss_extended_sprite_copy+10

;# Copy of the bounce sprite table ($1699)
;# 4 bytes
    !dss_bounce_sprite_copy = !dss_cluster_sprite_copy+20

;# Page of ExGFX that will be used for decompressing graphics.
;# The default value is !dss_exgfx
;# 2 bytes
    !dss_exgfx_page = !dss_bounce_sprite_copy+4

;####################################################################
;# Macros

macro dss_write_tile()
    lda !dss_gfx_queue_vram,x       ; force end if there's no gfx in the queue (vram dest = $0000)
    bne ?continue_upload
    jmp queue_end
?continue_upload:
    sta $2116
    lda !dss_gfx_queue_ram,x
    sta $22
    lda #$0040
    sta $25
    sty $420B

    lda !dss_gfx_queue_vram,x
    clc
    adc #$0100
    sta $2116
    lda !dss_gfx_queue_ram,x
    clc 
    adc #$0200
    sta $22
    lda #$0040
    sta $25
    sty $420B

    lda #$0000                      ; mark slot as unused
    sta !dss_gfx_queue_vram,x

    lda !dss_gfx_queue_index_nmi
    clc 
    adc #$0004                      ; update index
    sta !dss_gfx_queue_index_nmi
    tax
endmacro

;####################################################################
;# GFX upload routine

queue:
    lda !dss_gfx_queue_index_nmi    ; get index of the next graphics ready to be uploaded to vram
    tax
    lda !dss_gfx_queue_vram+1,x     ; if the next entry in the queue is blank, skip the entire routine
    bne .start_queue
    rtl

.start_queue
    rep #$20
    lda #$4300
    tcd                             ; small optimization: change dp to $4300

    lda #$1801
    sta $20                         ; setup some regs
    ldy #$80
    sty $2115
    ldy #$41
    sty $24
    ldy #$04

    !i = 0
while !i < !dss_queue_tiles
    %dss_write_tile()
    !i #= !i+1
endif

queue_end:
    lda #$3000                      ; restore dp
    tcd
    sep #$20
    rtl

;####################################################################
;# Init routine
;# Initializes RAM with default values

init:
    pea $0040
    plb
    rep #$30


    lda.w #!dss_exgfx
    sta.w !dss_exgfx_page
    stz.w !dss_gfx_queue_index_nmi
    stz.w !dss_gfx_queue_index_game
    stz.w !dss_ram_buffer_index

    lda.w #0064
    sta.w !dss_maximum_tiles

    lda #$FFFF
    ldx.w #32-2
-   
    sta.w !dss_map,x
    sta.w !dss_map+32,x
    sta.w !dss_list,x
    stz.w !dss_gfx_size,x
    stz.w !dss_list_usage,x
    stz.w !dss_tile_buffer,x
    stz.w !dss_list_gfx_loaded,x
    stz.w !dss_list_queue_index,x
    dex #2
    bpl -

    ldx.w #256-2
-   
    stz.w !dss_gfx_queue,x
    sta.w !dss_tile_buffer_complete,x
    sta.w !dss_tile_buffer_complete+256,x
    sta.w !dss_tile_buffer_complete+512,x
    sta.w !dss_tile_buffer_complete+768,x
    dex #2
    bpl -

    ldx.w #default_vram_destinations_end-default_vram_destinations-2
-   
    lda.l default_vram_destinations,x 
    sta.w !dss_vram_dest,x
    dex #2
    bpl -

    ldx.w #22-2
-   
    stz.w !dss_regular_sprite_copy,x
    stz.w !dss_custom_sprite_copy,x
    dex #2
    bpl -

    ldx.w #10-2
-   
    stz.w !dss_extended_sprite_copy,x
    stz.w !dss_cluster_sprite_copy,x
    stz.w !dss_cluster_sprite_copy+10,x
    dex #2
    bpl -

    stz.w !dss_bounce_sprite_copy,x
    stz.w !dss_bounce_sprite_copy+2,x 

    plb
    sep #$30

    rtl


default_vram_destinations:
    db $00,$02,$04,$06,$08,$0A,$0C,$0E
    db $20,$22,$24,$26,$28,$2A,$2C,$2E
    db $40,$42,$44,$46,$48,$4A,$4C,$4E
    db $60,$62,$64,$66,$68,$6A,$6C,$6E
    db $80,$82,$84,$86,$88,$8A,$8C,$8E
    db $A0,$A2,$A4,$A6,$A8,$AA,$AC,$AE
    db $C0,$C2,$C4,$C6,$C8,$CA,$CC,$CE
    db $E0,$E2,$E4,$E6,$E8,$EA,$EC,$EE
.end
