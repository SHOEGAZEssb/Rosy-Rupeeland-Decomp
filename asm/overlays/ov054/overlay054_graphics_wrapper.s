.text
; Matching fallback for the portable implementation in src/overlays/ov054/overlay054_recovery.c.
.extern func_ov054_0220ea34

.global func_ov054_0220ec14
func_ov054_0220ec14:
    stmdb sp!, {r3, lr}
    cmp r1, #0x1
    ldmeqia sp!, {r3, pc}
    bl func_ov054_0220ea34
    mov r2, #0x4000000
    ldr r1, [r2, #0x0]
    ldr r0, [r2, #0x0]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    orr r0, r3, #0x2
    orr r0, r1, r0, lsl #0x8
    str r0, [r2, #0x0]
    ldmia sp!, {r3, pc}
.size func_ov054_0220ec14, . - func_ov054_0220ec14
