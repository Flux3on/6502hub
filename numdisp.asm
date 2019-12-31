; Crappy Number Display in Skilldrick's 6502 Simulator
; Labels: 72
; Assembled code size: 700 Bytes
; By Flux3on
; Change Digits: 1st 2nd 3rd
;                E   R   T
;                 D   F   G

; Digit Locations (Addresses)
define digit_one $00
define digit_two $01
define digit_three $02

; ASCII locations on keyboard (Constants)
define key_e $65
define key_d $64
define key_r $72
define key_f $66
define key_t $74
define key_g $67

; System Vars (Addresses)
define lastKey $FF

; Other Vars (Constants)
define color $01
define blank $00


loop:
  lda #$00
  sta lastKey
  jsr readKeys
  jsr drawDigitOne
  jsr drawDigitTwo
  jsr drawDigitThree
  jmp loop

readKeys:
  lda lastKey
  cmp #key_e
  beq inOne
  cmp #key_d
  beq deOne
  cmp #key_r
  beq inTwo
  cmp #key_f
  beq deTwo
  cmp #key_t
  beq inThree
  cmp #key_g
  beq deThree
  rts

inOne:
  ldx digit_one
  inx
  stx digit_one
  cpx #$0A
  beq oneOverflow
  rts

oneOverflow:
  ldx #$00
  stx digit_one
  rts

deOne:
  ldx digit_one
  dex
  stx digit_one
  cpx #$FF
  beq oneUnderflow
  rts

oneUnderflow:
  ldx #$09
  stx digit_one
  rts

inTwo:
  ldx digit_two
  inx
  stx digit_two
  cpx #$0A
  beq twoOverflow
  rts

twoOverflow:
  ldx #$00
  stx digit_two
  jmp inOne
  rts

deTwo:
  ldx digit_two
  dex
  stx digit_two
  cpx #$FF
  beq twoUnderflow
  rts

twoUnderflow:
  ldx #$09
  stx digit_two
  jmp deOne
  rts

inThree:
  ldx digit_three
  inx
  stx digit_three
  cpx #$0A
  beq threeOverflow
  rts

threeOverflow:
  ldx #$00
  stx digit_three
  jmp inTwo
  rts

deThree:
  ldx digit_three
  dex
  stx digit_three
  cpx #$FF
  beq threeUnderflow
  rts

threeUnderflow:
  ldx #$09
  stx digit_three
  jmp deTwo
  rts

drawZero:
  lda #blank
  sta $0221,Y
  sta $0241,Y
  sta $0261,Y
  rts

drawOne:
  lda #blank
  sta $200,Y
  sta $202,Y
  sta $220,Y
  sta $222,Y
  sta $240,Y
  sta $242,Y
  sta $260,Y
  sta $262,Y
  sta $280,Y
  sta $282,Y
  rts

drawTwo:
  lda #blank
  sta $220,Y
  sta $221,Y
  sta $261,Y
  sta $262,Y
  rts

drawThree:
  lda #blank
  sta $220,Y
  sta $221,Y
  sta $260,Y
  sta $261,Y
  rts

drawFour:
  lda #blank
  sta $201,Y
  sta $221,Y
  sta $260,Y
  sta $261,Y
  sta $280,Y
  sta $281,Y
  rts

drawFive:
  lda #blank
  sta $221,Y
  sta $222,Y
  sta $260,Y
  sta $261,Y
  rts

drawSix:
  lda #blank
  sta $221,Y
  sta $222,Y
  sta $261,Y
  rts

drawSeven:
  lda #blank
  sta $220,Y
  sta $221,Y
  sta $240,Y
  sta $241,Y
  sta $260,Y
  sta $261,Y
  sta $280,Y
  sta $281,Y
  rts

drawEight:
  lda #blank
  sta $221,Y
  sta $261,Y
  rts

drawNine:
  lda #blank
  sta $221,Y
  sta $260,Y
  sta $261,Y
  rts

drawDigitOne:
  lda #color
  ldx #$00
dOneRowOne:
  sta $0200,X
  inx
  cpx #$03
  bne dOneRowOne
  ldx #$00
dOneRowTwo:
  sta $0220,X
  inx
  cpx #$03
  bne dOneRowTwo
  ldx #$00
dOneRowThree:
  sta $0240,X
  inx
  cpx #$03
  bne dOneRowThree
  ldx #$00
dOneRowFour:
  sta $0260,X
  inx
  cpx #$03
  bne dOneRowFour
  ldx #$00
dOneRowFive:
  sta $0280,X
  inx
  cpx #$03
  bne dOneRowFive
  ldy #$00
  ldx digit_one
  cpx #$00
  beq SecOneZero
  cpx #$01
  beq SecOneOne
  cpx #$02
  beq SecOneTwo
  cpx #$03
  beq SecOneThree
  cpx #$04
  beq SecOneFour
  cpx #$05
  beq SecOneFive
  cpx #$06
  beq SecOneSix
  cpx #$07
  beq SecOneSeven
  cpx #$08
  beq SecOneEight
  cpx #$09
  beq SecOneNine
  rts

SecOneZero:
  jmp drawZero
SecOneOne:
  jmp drawOne
SecOneTwo:
  jmp drawTwo
SecOneThree:
  jmp drawThree
SecOneFour:
  jmp drawFour
SecOneFive:
  jmp drawFive
SecOneSix:
  jmp drawSix
SecOneSeven:
  jmp drawSeven
SecOneEight:
  jmp drawEight
SecOneNine:
  jmp drawNine

drawDigitTwo:
  lda #color
  ldx #$04
dTwoRowOne:
  sta $0200,X
  inx
  cpx #$07
  bne dTwoRowOne
  ldx #$04
dTwoRowTwo:
  sta $0220,X
  inx
  cpx #$07
  bne dTwoRowTwo
  ldx #$04
dTwoRowThree:
  sta $0240,X
  inx
  cpx #$07
  bne dTwoRowThree
  ldx #$04
dTwoRowFour:
  sta $0260,X
  inx
  cpx #$07
  bne dTwoRowFour
  ldx #$04
dTwoRowFive:
  sta $0280,X
  inx
  cpx #$07
  bne dTwoRowFive
  ldy #$04
  ldx digit_two
  cpx #$00
  beq SecTwoZero
  cpx #$01
  beq SecTwoOne
  cpx #$02
  beq SecTwoTwo
  cpx #$03
  beq SecTwoThree
  cpx #$04
  beq SecTwoFour
  cpx #$05
  beq SecTwoFive
  cpx #$06
  beq SecTwoSix
  cpx #$07
  beq SecTwoSeven
  cpx #$08
  beq SecTwoEight
  cpx #$09
  beq SecTwoNine
  rts

SecTwoZero:
  jmp drawZero
SecTwoOne:
  jmp drawOne
SecTwoTwo:
  jmp drawTwo
SecTwoThree:
  jmp drawThree
SecTwoFour:
  jmp drawFour
SecTwoFive:
  jmp drawFive
SecTwoSix:
  jmp drawSix
SecTwoSeven:
  jmp drawSeven
SecTwoEight:
  jmp drawEight
SecTwoNine:
  jmp drawNine

drawDigitThree:
  lda #color
  ldx #$08
dThreeRowOne:
  sta $0200,X
  inx
  cpx #$0B
  bne dThreeRowOne
  ldx #$08
dThreeRowTwo:
  sta $0220,X
  inx
  cpx #$0B
  bne dThreeRowTwo
  ldx #$08
dThreeRowThree:
  sta $0240,X
  inx
  cpx #$0B
  bne dThreeRowThree
  ldx #$08
dThreeRowFour:
  sta $0260,X
  inx
  cpx #$0B
  bne dThreeRowFour
  ldx #$08
dThreeRowFive:
  sta $0280,X
  inx
  cpx #$0B
  bne dThreeRowFive
  ldy #$08
  ldx digit_three
  cpx #$00
  beq SecThreeZero
  cpx #$01
  beq SecThreeOne
  cpx #$02
  beq SecThreeTwo
  cpx #$03
  beq SecThreeThree
  cpx #$04
  beq SecThreeFour
  cpx #$05
  beq SecThreeFive
  cpx #$06
  beq SecThreeSix
  cpx #$07
  beq SecThreeSeven
  cpx #$08
  beq SecThreeEight
  cpx #$09
  beq SecThreeNine
  rts

SecThreeZero:
  jmp drawZero
SecThreeOne:
  jmp drawOne
SecThreeTwo:
  jmp drawTwo
SecThreeThree:
  jmp drawThree
SecThreeFour:
  jmp drawFour
SecThreeFive:
  jmp drawFive
SecThreeSix:
  jmp drawSix
SecThreeSeven:
  jmp drawSeven
SecThreeEight:
  jmp drawEight
SecThreeNine:
  jmp drawNine
