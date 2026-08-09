.text
; Matching fallback for the portable implementation in src/overlays/ov056/overlay056_recovery.c.
.extern func_020b171c

.global func_ov056_0220f558
func_ov056_0220f558:
    stmdb sp!, {r3, lr}
    ldr r1, [r0, #0x810]
    cmp r1, #0x0
    beq .L_0220f584
    mov r1, #0x0
    str r1, [r0, #0x810]
    ldr r1, [r0, #0xc]
    add r0, r0, #0x10
    mov r1, r1, lsl #0xb
    mov r2, #0x800
    bl func_020b171c
.L_0220f584:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.size func_ov056_0220f558, . - func_ov056_0220f558
