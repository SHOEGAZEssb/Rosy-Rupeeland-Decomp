.text
; Matching fallback for the portable implementation in src/overlays/ov054/overlay054_recovery.c.
.extern func_020ae024

.global func_ov054_0220ec4c
func_ov054_0220ec4c:
    stmdb sp!, {r3, lr}
    ldmib r1, {r2, ip}
    ldr r1, [r0, #0x4]
    ldr r3, [r0, #0x8]
    sub r1, r2, r1
    sub r0, ip, r3
    bl func_020ae024
    ldmia sp!, {r3, pc}
.size func_ov054_0220ec4c, . - func_ov054_0220ec4c
