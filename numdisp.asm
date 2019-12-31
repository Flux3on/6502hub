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
  jmp loop

readKeys:
  lda lastKey
  cmp #key_e
  beq inOne
  cmp #key_d
  beq deOne
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
