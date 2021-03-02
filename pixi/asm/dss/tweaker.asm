includefrom "dynamic_spritesets.asm"

pushpc
    org $07F3FE                                 ; Tweaker byte 3: lwcfpppg
        db $0B,$09,$07,$05,$0B,$09,$07,$05		; l = don't interact with layer 2
        db $0B,$0B,$09,$09,$05,$17,$32,$05		; w = disable water interaction

        db $05,$1D,$3D,$09,$09,$45,$45,$85		; c = disable cape killing
        db $85,$0B,$09,$01,$13,$15,$09,$4F		; f = disable fireball killing

        db $1C,$24,$0B,$09,$0B,$09,$33,$33		; ppp = palette
        db $FD,$2B,$09,$35,$3B,$3A,$19,$3B		; g = use second graphics page

        db $13,$13,$13,$34,$39,$2A,$15,$F3
        db $FD,$FD,$37,$37,$37,$C7,$31,$05

        db $15,$37,$37,$37,$33,$30,$8B,$85
        db $1D,$3B,$3B,$09,$35,$01,$01,$09

        db $09,$09,$20,$31,$20,$E3,$E3,$E3
        db $E3,$E3,$E3,$E1,$E1,$EB,$EB,$E3

        db $E3,$E3,$E1,$E1,$A3,$A3,$A3,$A3
        db $A3,$E3,$F0,$E3,$F3,$3F,$3F,$0F

        db $35,$0B,$09,$07,$09,$0B,$21,$25
        db $0B,$3B,$3B,$20,$20,$21,$29,$21

        db $21,$01,$20,$21,$21,$20,$F5,$20      ; $80
        db $20,$20,$20,$20,$20,$20,$30,$3B

        db $F3,$0B,$0B,$0B,$0B,$0B,$0B,$0B
        db $0B,$9B,$93,$00,$30,$31,$31,$31

        db $FB,$FB,$BB,$E3,$F3,$35,$35,$39
        db $35,$35,$7D,$07,$37,$37,$3D,$3F

        db $3F,$30,$31,$31,$31,$04,$35,$3B
        db $3B,$37,$7B,$3B,$33,$07,$0B,$11

        db $F5,$F5,$CB,$CD,$F3,$3F,$FF,$20
        db $39
pullpc