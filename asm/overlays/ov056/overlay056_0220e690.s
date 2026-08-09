.text
; Matching fallback for the portable implementation in src/overlays/ov056/overlay056_recovery.c.
.extern func_ov056_0220e6b0

.global func_ov056_0220e690
func_ov056_0220e690:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x0]
    cmp r1, #0x0
    beq .L_0220e6a8
    bl func_ov056_0220e6b0
.L_0220e6a8:
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov056_0220e690, . - func_ov056_0220e690
