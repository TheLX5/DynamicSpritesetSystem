;#########################################################################
;# Customization defines

;# Location of the configuration used in the main patch.
    !dss_config = $02D60B

;# Main RAM define
;# Requires at least 1745 (0x6D1) bytes of consecutive free RAM
;# or you could edit the defines below to make some of them not consecutive
    !dss_ram = read3(!dss_config)

;####################################################################
;# RAM defines

;# Holds the maximum amount of tiles used by DSS.
;# Can be modified. Can't be over 64 or bad things will happen.
;# 1 byte
    !dss_maximum_tiles #= !dss_ram+64+32+32+32+32+32+1024+1

;# Map of possible VRAM destinations for sprite tiles
;# FF is treated as invalid.
;# 64 bytes
    !dss_vram_dest #= !dss_ram+64+32+32+32+32+32+1024+1+1+1+256+2+2

load:
    rep #$30
    ldx.w #mode_7_fights_vram_destinations_end-mode_7_fights_vram_destinations-2
-   
    lda.l mode_7_fights_vram_destinations,x 
    sta.l !dss_vram_dest,x
    dex #2
    bpl -
    sep #$30

    lda.b #mode_7_fights_vram_destinations_end-mode_7_fights_vram_destinations
    sta.l !dss_maximum_tiles
    rtl 

mode_7_fights_vram_destinations:
    db $AA,$AE
    db $80,$82,$84,$88,$8A,$8C,$8E
    db $C6
.end