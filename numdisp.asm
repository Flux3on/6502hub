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
  ldy digit_one
  iny
  sty digit_one
  cpy #$0A
  beq oneOverflow
  rts

oneOverflow:
  ldy #$00
  sty digit_one
  rts

deOne:
  ldy digit_one
  dey
  sty digit_one
  cpy #$FF
  beq oneUnderflow
  rts

oneUnderflow:
  ldy #$09
  sty digit_one
  rts

inTwo:
  ldy digit_two
  iny
  sty digit_two
  cpy #$0A
  beq twoOverflow
  rts

twoOverflow:
  ldy #$00
  sty digit_two
  jmp inOne
  rts

deTwo:
  ldy digit_two
  dey
  sty digit_two
  cpy #$FF
  beq twoUnderflow
  rts

twoUnderflow:
  ldy #$09
  sty digit_two
  jmp deOne
  rts

inThree:
  ldy digit_three
  iny
  sty digit_three
  cpy #$0A
  beq threeOverflow
  rts

threeOverflow:
  ldy #$00
  sty digit_three
  jmp inTwo
  rts

deThree:
  ldy digit_three
  dey
  sty digit_three
  cpy #$FF
  beq threeUnderflow
  rts

threeUnderflow:
  ldy #$09
  sty digit_three
  jmp deTwo
  rts

drawZero:
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
  beq drawZero
  rts
