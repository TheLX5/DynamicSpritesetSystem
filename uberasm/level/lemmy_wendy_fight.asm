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
    ldx.w #lemmy_wendy_fight_vram_destinations_end-lemmy_wendy_fight_vram_destinations-2
-   
    lda.l lemmy_wendy_fight_vram_destinations,x 
    sta.l !dss_vram_dest,x
    dex #2
    bpl -
    sep #$30

    lda.b #lemmy_wendy_fight_vram_destinations_end-lemmy_wendy_fight_vram_destinations
    sta.l !dss_maximum_tiles
    rtl 

lemmy_wendy_fight_vram_destinations:
    db $C0,$C2,$C4,$C6,$C8,$CA,$CC,$CE
    db $E0,$E2,$E4,$E6,$E8,$EA,$EC,$EE
    db $80,$82,$84,$86,$88,$8A,$8C,$8E
    db $A0,$A2,$A4,$A6,$A8,$AA
.end