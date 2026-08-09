.text
; Matching fallback for the portable implementation in src/overlays/ov092/overlay092_recovery.c.

.global func_ov092_022183b8
func_ov092_022183b8:
    add r0, r0, #0x200
    ldrsh r1, [r0, #0x9c]
    mov r0, #0x1
    cmp r1, #0x0
    cmpne r1, #0x63
    movne r0, #0x0
    bx lr
.size func_ov092_022183b8, . - func_ov092_022183b8
