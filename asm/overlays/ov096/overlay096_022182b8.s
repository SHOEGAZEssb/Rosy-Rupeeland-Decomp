.text
; Matching fallback for the portable implementation in src/overlays/ov096/overlay096_recovery.c.

.global func_ov096_022182b8
func_ov096_022182b8:
    ldrsh r1, [r0, #0xd6]
    mov r0, #0x1
    cmp r1, #0x9
    cmpne r1, #0xa
    movne r0, #0x0
    bx lr
.size func_ov096_022182b8, . - func_ov096_022182b8
