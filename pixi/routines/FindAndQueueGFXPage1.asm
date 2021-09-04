
    pha 
    lda $01DF78+3+2+3
    sta $00
    lda $01DF78+3+2+3+1
    sta $01
    lda $01DF78+3+2+3+2
    sta $02
    pla 
    jml [!dp]