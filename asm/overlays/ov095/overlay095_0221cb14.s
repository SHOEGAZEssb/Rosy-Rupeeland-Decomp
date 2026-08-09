.text
; Matching fallback for the portable implementation in src/overlays/ov095/overlay095_recovery.c.

.global func_ov095_0221cb14
func_ov095_0221cb14:
    add r0, r0, #0x100
    ldrh r0, [r0, #0xf0]
    mov r0, r0, lsl #0x11
    mov r0, r0, lsr #0x11
    cmp r0, #0x2
    moveq r0, #0x1
    movne r0, #0x0
    bx lr
.size func_ov095_0221cb14, . - func_ov095_0221cb14
