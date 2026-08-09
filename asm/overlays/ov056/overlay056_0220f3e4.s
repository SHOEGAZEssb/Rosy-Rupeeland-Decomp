.text
; Matching fallback for the portable implementation in src/overlays/ov056/overlay056_recovery.c.
.extern func_ov056_0220f348

.global func_ov056_0220f3e4
func_ov056_0220f3e4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov056_0220f348
    ldr r0, [r4, #0x0]
    cmp r0, #0x0
    beq .L_0220f404
    mov r0, r4
    bl func_ov056_0220f348
.L_0220f404:
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov056_0220f3e4, . - func_ov056_0220f3e4
