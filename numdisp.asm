; Number Display in Skilldrick's 6502 Simulator
; By Flux3on
; Change Digits: 1st 2nd 3rd 4th 5th
;                E   R   T   Y   U
;                 D   F   G   H   J

; Digit Locations (Addresses)
define digit_one   $10
define digit_two   $11
define digit_three $12
define digit_four  $13
define digit_five  $14

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
