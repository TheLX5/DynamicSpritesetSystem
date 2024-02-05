;>sa1 init,end

init:
    jml dynamic_spriteset_init

late_game_routines = $01DF78+3+2+3+3

end:
    lda.l late_game_routines
    sta $00
    lda.l late_game_routines+1
    sta $01
    lda.l late_game_routines+2
    sta $02
    jml [!dp]
