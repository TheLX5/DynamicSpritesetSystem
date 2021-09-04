
    pha 
    lda $01DF78+3+2
    sta $00
    lda $01DF78+3+2+1
    sta $01
    lda $01DF78+3+2+2
    sta $02
    pla 
    jml [!dp]