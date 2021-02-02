pushpc
    org $01E19A
        db $4C              ; nuke dynamic podoboo

    org $07F431
        db $35              ; use page 1
pullpc