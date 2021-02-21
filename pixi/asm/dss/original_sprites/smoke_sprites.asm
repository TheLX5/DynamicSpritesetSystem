;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Smoke Image Consistency-ifier
;; by Sonikku
;; SMW has several types of smoke images which are all used in different scenarios:
;; -- "Spin Jump" smoke is used when a sprite dies via a Spin Jump. It's a slow animation lasting 31 (x1F) frames.
;; -- "Blaster" smoke is used by Bullet Bill blasters, Torpedo Teds, and some others. It's a moderately fast animation lasting 27 (x1B) frames.
;; -- "Fireball" smoke is used when a fireball impacts a sprite or wall. It's a very fast animation lasting 15 (x0F) frames.
;; -- "Yoshi Stomp" smoke is used when a Yellow Yoshi has a shell in its mouth, or if any other Yoshi has a Yellow shell. It's an mildly slow animation lasting 21 (x15) frames.
;; 
;; Bizarrely, the Reznor boss room has its own smoke image variant. Its changes solely involve OAM slots, however.
;; 
;; This patch will allow any of the smoke types to use the *other* smoke type's animation.
;; This will update the timing of the various smoke images according to which one is selected for stock SMW only. External resources would need to have the smoke image's timer
;; be adjusted manually.
;; For your reference:
;;;; - Images using "Spin Jump" smoke type should be set to #$1F.
;;;; - Images using "Blaster" smoke type should be set to #$1B.
;;;; - Images using "Fireball" smoke type should be set to #$0F.
;;;; - Images using "Yoshi" smoke type should be set to #$15.
;;;; If set above these values, the image will simply clamp its timer to fit the lifetime of the animation.
;;;; Hex edits below will adjust all instances in SMW to xFF so that clamping can automatically take place regardless of the animation shown.

;; Valid values for smoke types are "Spin", "Blast", "Fire", "Yoshi".
;; Valid values for smoke palettes are "!Pal[8-F]".

    !SpinSmokeType =	Spin	; type of smoke to use for spin jump kills
    !SpinSmokePal =		!Pal9
    !SpinSmokePage =	$00

    !BlasterSmokeType =	Blast	; type of smoke to use for bullet bill blasters/cape pickups/etc.
    !BlasterSmokePal =	!Pal9
    !BlasterSmokePage =	$00

    !ReznorSmokeType =	Blast	; type of smoke to use for bridge destruction images in Reznor boss rooms
    !ReznorSmokePal =	!Pal9
    !ReznorSmokePage =	$00

    !FireSmokeType =	Fire	; type of smoke to use when a fireball impacts something or when Mario breaks an extended sprite projectile with the Cape
    !FireSmokePal =		!Pal9
    !FireSmokePage =	$00

    !YoshiSmokeType =	Yoshi	; type of smoke to use when ground pounding with a yellow Yoshi/Koopa shell.
    !YoshiSmokePal =	!Pal9
    !YoshiSmokePage =	$00

    !LakituSmokeType =	Spin	; type of smoke to use when a Lakitu cloud evaporates.
    !LakituSmokePal =	!Pal9
    !LakituSmokePage =	$00

    !install_Spinsmoke =	$00
    !install_Firesmoke =	$00
    !install_Blastsmoke =	$00
    !install_Yoshismoke =	$00

    !Pal8 =			$00
    !Pal9 =			$02
    !PalA =			$04
    !PalB =			$06
    !PalC =			$08
    !PalD =			$0A
    !PalE =			$0C
    !PalF =			$0E

    macro GetSmokeType(type)
        !install_<type>smoke = $01
        autoclean JSL SmokePuffs_<type>
    endmacro
    macro GetSmokeType2(type)
        !install_<type>smoke = $01
        JSL SmokePuffs_<type>
    endmacro

pushpc

    org $019A5D	; spin jump smoke
        PHY
        LDA !1540,x
        %GetSmokeType(!SpinSmokeType)
        BCC +
        DEC
        STA !1540,x
    +	PLY
        PHX
        LDX #!SpinSmokePal+(!SpinSmokePage&1)
        JSL SetOAM
        PLX
        RTS
        NOP #2

    org $02971E	; blaster smoke (reznor boss room)
        PHY
        LDA $17CC|!addr,x
        %GetSmokeType(!ReznorSmokeType)
        BCC +
        DEC
        STA $17CC|!addr,x
    +	PLY
        PHX
        LDX #!ReznorSmokePal+(!ReznorSmokePage&1)
        JSL SetOAM
        PLX
        BRA $12 : NOP #18

    org $029767	; blaster smoke
        PHY
        LDA $17CC|!addr,x
        %GetSmokeType(!BlasterSmokeType)
        BCC +
        DEC
        STA $17CC|!addr,x
    +	PLY
        PHX
        LDX #!BlasterSmokePal+(!BlasterSmokePage&1)
        JSL SetOAMExt
        PLX
        BRA $12 : NOP #18

    org $02A386	; fireball smoke
        PHY
        LDA $176F|!addr,x
        %GetSmokeType(!FireSmokeType)
        BCC +
        DEC
        STA $176F|!addr,x
    +	PLY
        PHX
        LDX #!FireSmokePal+(!FireSmokePage&1)
        JSL SetOAMExt
        PLX
        BRA $0B : NOP #11

    org $029C44	; yoshi smoke
        PHY
        LDA $176F|!addr,x
        %GetSmokeType(!YoshiSmokeType)
        BCC +
        DEC
        STA $176F|!addr,x
    +	PLY
        PHX
        LDX #!YoshiSmokePal+(!YoshiSmokePage&1)
        JSL SetOAMExt
        PLX
        BRA $0A
        NOP #10

    org $01E8D2	; set up values for lakitu cloud
        autoclean JML SetupLakituCloud
    org $01E91E	; lakitu cloud
        LDA $8A
        STA $0302|!addr,y
        LDA $8B
        STA $0303|!addr,y
        BRA $10
        NOP #16

    ;; since each smoke type "clamps" the max value, we will set all smoke images *above* the max!!!

    org $01BDB3	; (default: $1B) magikoopa magic hit object
        db $FF
    org $01C5DA	; (default: $1B) mario cape animation
        db $FF
    org $02B4F7	; (default: $1B) generic shooter smoke
        db $FF
    org $02B99F	; (default: $0F) torpedo ted
        db $0F
    org $01D3EF	; (default: $0F) fireball impacting a sprite
        db $FF
    org $01FD3C	; (default: $0F) something koopa kid-related?
        db $FF
    org $029C2E	; (default: $15) yoshi ground pound
        db $FF
    org $02A04B	; (default: $0F) fireball impacting a wall
        db $FF
    org $02A4DF	; (default: $07) cape/invincible mario killing extended sprite
        db $07
    org $01E7C1	; (default: $1F) lakitu cloud disappearing
        db $FF

pullpc


SetupLakituCloud:
	PHY
	LDA !1540,x
	%GetSmokeType2(!LakituSmokeType)
	STA $8A
	LDA !1540,x
	BEQ .not_dead
	LDA $8A
	BCC +
	DEC
	STA !1540,x
+	PLY
	LDA $02
	STA $8A
	BRA +
.not_dead
	PLY
	LDA #$60	; tile of lakitu cloud's smoke puff
	STA $8A
+	LDA $03
	ORA #!LakituSmokePal
	STA $8B
	LDA #$F8
	STA $0C
	JML $01E8D6|!bank


SmokePuffs:
if !install_Spinsmoke
;; "spinjump smoke"-style smoke puff
.Spin	PHB
	PHK
	PLB
	PHY
	STZ $0F
	CMP #$1F
	BCC +
	LDA #$1F
	STA $0F
+	TAY
	LSR : LSR : LSR
	AND #$03
	PHX
	TAX
	LDA .spinsmoke_tilemap,x
	STA $02
	STA $03
	AND #$30
	ORA $64
	STA $03
	PLX
if !install_Yoshismoke
	JMP Return
else
	BRA Return
endif
.spinsmoke_tilemap
	db !smoke_tiny_tile,!smoke_small_tile,!smoke_large_tile,!smoke_medium_tile
endif
if !install_Firesmoke
;; "fireball smoke"-style smoke puff
.Fire	PHB
	PHK
	PLB
	PHY
	STZ $0F
	CMP #$0F
	BCC +
	LDA #$0F
	STA $0F
+	TAY
	LSR : LSR
	PHX
	TAX
	LDA .firesmoke_tilemap,x
	STA $02

	LDA $14
	LSR : LSR
	AND #$03
	TAX
	LDA .firesmoke_flip,x
	ORA $64
	STA $03
	PLX
	BRA Return
.firesmoke_tilemap
	db !smoke_tiny_tile,!smoke_small_tile,!smoke_large_tile,!smoke_medium_tile
.firesmoke_flip
	db $00,$40,$C0,$80
endif
if !install_Blastsmoke
;; "blaster smoke"-style smoke puff
.Blast	PHB
	PHK
	PLB
	PHY
	STZ $0F
	CMP #$1B
	BCC +
	LDA #$1B
	STA $0F
+	TAY
	CMP #$08
	LDA #$00
	BCS +
	ASL : ASL
	ASL : ASL
	AND #$40
+	ORA $64
	STA $03
	TYA
	LSR : LSR
	PHX
	TAX
	LDA .blast_tilemap,x
	STA $02
	PLX
	BRA Return
.blast_tilemap
	db !smoke_tiny_tile,!smoke_tiny_tile,!smoke_medium_tile,!smoke_medium_tile
    db !smoke_large_tile,!smoke_medium_tile,!smoke_large_tile
endif
if !install_Yoshismoke
;; "yoshi ground pound smoke"-style smoke puff
.Yoshi	PHB
	PHK
	PLB
	PHY
	STZ $0F
	CMP #$15
	BCC +
	LDA #$15
	STA $0F
+	TAY
	LSR
	PHX
	TAX
	LDA .yoshi_tilemap,x
	STA $02
	LDA $14
	ASL : ASL : ASL : ASL
	AND #$C0
	ORA #$30
	ORA $64
	STA $03
	PLX
	BRA Return
.yoshi_tilemap
    db !smoke_tiny_tile,!smoke_small_tile,!smoke_medium_tile,!smoke_large_tile
    db !smoke_large_tile,!smoke_large_tile,!smoke_large_tile,!smoke_large_tile
    db !smoke_large_tile,!smoke_large_tile,!smoke_large_tile

+	CLC
endif
Return:
	LDA $0F
	BNE +
	CLC
	BRA ++
+	LDA $0F
	SEC
++	PLY
	PLB
	RTL
SetOAM:
	PHB
	PHK
	PLB
	LDA $02
	STA $0302|!addr,y
	TXA
	ORA $03
	ORA $64
	STA $0303|!addr,y
	PHY
	TYA
	LSR : LSR
	TAY 
	LDA #$02
	STA $0460|!addr,y
	PLY
	PLB
	RTL
SetOAMExt:
	PHB
	PHK
	PLB
	LDA $02
	STA $0202|!addr,y
	TXA
	ORA $03
	ORA $64
	STA $0203|!addr,y
	PHY
	TYA
	LSR : LSR
	TAY 
	LDA #$02
	STA $0420|!addr,y
	PLY
	PLB
	RTL