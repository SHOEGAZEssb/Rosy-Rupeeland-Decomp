.text
; Matching fallback for the portable implementation in src/overlays/ov055/overlay055_recovery.c.
.extern func_02074110
.extern func_ov055_0220e8a0

.global func_ov055_0220efe0
func_ov055_0220efe0:
    stmdb sp!, {r4, lr}
    cmp r1, #0x0
    beq .L_0220eff8
    ldr r0, [r0, #0x24]
    bl func_ov055_0220e8a0
    ldmia sp!, {r4, pc}
.L_0220eff8:
    ldr r4, [r0, #0x24]
    ldr r0, [r4, #0x24]
    bl func_02074110
    ldr r0, [r4, #0x28]
    bl func_02074110
    ldmia sp!, {r4, pc}
.size func_ov055_0220efe0, . - func_ov055_0220efe0
