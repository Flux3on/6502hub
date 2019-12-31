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
define key_y $79
define key_h $68
define key_u $75
define key_j $6A

; System Vars (Addresses)
define lastKey $FF

; Other Vars (Constants)
define color $0E
define blank $00


loop:
  jsr readKeys
  jmp loop

readKeys:
  lda lastKey
  rts
