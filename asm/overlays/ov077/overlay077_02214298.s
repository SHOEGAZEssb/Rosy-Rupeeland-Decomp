.text
; Matching fallback for the portable implementation in src/overlays/ov077/overlay077_recovery.c.

.global func_ov077_02214298
func_ov077_02214298:
    mov r1, r1, lsl #0x10
    ldr r2, [r0, #0x4]
    mov r1, r1, lsr #0x10
    strh r1, [r2, #0x28]
    ldr r0, [r0, #0x8]
    strh r1, [r0, #0x28]
    bx lr
.size func_ov077_02214298, . - func_ov077_02214298
