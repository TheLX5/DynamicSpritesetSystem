;#########################################################################
;# Rex

;################################################
;# Hijack(s)

pushpc
org $039692
    rex_gfx_init_hijack:
        jml rex_gfx_init
        nop #2
    rex_gfx_init_return:
        jsr GetDrawInfoBnk3

org $0396C3
    rex_write_edit_hijack:
        jml rex_write_edit
        nop #2
    rex_write_edit_return:
pullpc

;################################################
;# Main GFX code


rex_gfx_init:
    lda.b #!dss_id_rex
    jsl find_and_queue_gfx
    bcs .loaded
    jml $0396F5
.loaded
    lda !1602,x
    asl
    sta $03
    jml rex_gfx_init_return

rex_write_edit:
    lda.l rex_tiles,x
    tax
    lda.l !dss_tile_buffer,x
    cpx #$05
    bne .store_tile
    tax
    lda $01,s
    cmp #$00
    beq .store_tile_2
    txa 
    clc 
    adc #$10
    tax
.store_tile_2
    txa
.store_tile
    sta $0302|!addr,y
    jml rex_write_edit_return

rex_tiles:                      ; Tile numbers for each of the Rex's animation frames.
    db $00,$01,$00,$02          ; Walking A/B
    db $00,$01                  ; Half-smushed trasition
    db $04,$04,$03,$03          ; Half-smushed walking A/B
    db $05,$05                  ; Fully-smushed
