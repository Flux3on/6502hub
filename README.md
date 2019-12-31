# 6502hub
Repository for all of my 6502 ASM works.


Feel free to modify and assemble them for any of them for your specific computer. My programs are built with [Skilldrick's](https://github.com/skilldrick) 6502 Simulator.

## numdisp.asm
Funny story actually, I had a block of code like this:
```Assembly
lda #$00
sta lastKey
jsr readKeys
```

And pressing keys to change the numbers was LAUGHABLY slow. It should have been like this all along:

```Assembly
jsr readKeys
lda #$00
sta lastKey
```
