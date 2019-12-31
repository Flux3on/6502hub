; Number Display in Skilldrick's 6502 Simulator
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
define color $0E
define blank $00


loop:
  lda #$00
  sta lastKey
  jsr readKeys
  jsr drawDigitOne
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
  rts
