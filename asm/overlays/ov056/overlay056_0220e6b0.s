.text
; Matching fallback for the portable implementation in src/overlays/ov056/overlay056_recovery.c.
.extern func_02003e38

.global func_ov056_0220e6b0
func_ov056_0220e6b0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x0]
    cmp r0, #0x0
    beq .L_0220e6d0
    bl func_02003e38
    mov r0, #0x0
    str r0, [r4, #0x0]
.L_0220e6d0:
    mov r0, #0x0
    str r0, [r4, #0x4]
    ldmia sp!, {r4, pc}
.size func_ov056_0220e6b0, . - func_ov056_0220e6b0
