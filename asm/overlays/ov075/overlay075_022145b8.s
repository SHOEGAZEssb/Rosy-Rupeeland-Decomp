.text
; Matching fallback for the portable implementation in src/overlays/ov075/overlay075_recovery.c.

.global func_ov075_022145b8
func_ov075_022145b8:
    ldrsh r1, [r0, #0xd6]
    mov r0, #0x1
    cmp r1, #0x9
    cmpne r1, #0xa
    movne r0, #0x0
    bx lr
.size func_ov075_022145b8, . - func_ov075_022145b8
