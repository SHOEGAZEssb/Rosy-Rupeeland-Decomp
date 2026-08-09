.text
; Matching fallback for the portable implementation in src/overlays/ov071/overlay071_recovery.c.

.global func_ov071_022113cc
func_ov071_022113cc:
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r3, r1, lsl #0x10
    mov r1, r2, lsl #0x10
    ldr r2, .L_022113f8
    orr r0, r3, r0, lsr #0x10
    str r0, [r2, #0x0]
    mov r0, r1, lsr #0x10
    str r0, [r2, #0x0]
    bx lr
.L_022113f8: .word 0x400048c
.size func_ov071_022113cc, . - func_ov071_022113cc
