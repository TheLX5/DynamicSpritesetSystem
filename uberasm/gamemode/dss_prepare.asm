;>sa1 init,end

init:
    jml dynamic_spriteset_init

late_game_routines = $01DF78+3+2+3+3

end:
    jml read3(late_game_routines)
