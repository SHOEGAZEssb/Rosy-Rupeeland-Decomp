.text
; Matching fallback for the portable implementation in src/overlays/ov077/overlay077_recovery.c.

.global func_ov077_022142c8
func_ov077_022142c8:
    ldrh r1, [r0, #0x4e]
    mov r0, #0x1
    cmp r1, #0x81
    cmpne r1, #0x84
    movne r0, #0x0
    bx lr
.size func_ov077_022142c8, . - func_ov077_022142c8
