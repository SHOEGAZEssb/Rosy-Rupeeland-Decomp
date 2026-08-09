.text
; Matching fallback for the portable implementation in src/overlays/ov097/overlay097_recovery.c.
.extern func_02033f4c
.extern func_020befec

.global func_ov097_02219760
func_ov097_02219760:
    stmdb sp!, {r3, lr}
    ldr r1, [r0, #0x2b0]
    cmp r1, #0x0
    beq .L_02219784
    bl func_02033f4c
    mov r0, r0, lsl #0x3
    mov r1, #0x9
    bl func_020befec
    ldmia sp!, {r3, pc}
.L_02219784:
    bl func_02033f4c
    ldmia sp!, {r3, pc}
.size func_ov097_02219760, . - func_ov097_02219760
