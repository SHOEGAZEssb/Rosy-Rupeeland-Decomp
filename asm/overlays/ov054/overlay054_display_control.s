.text
; Matching fallback for the portable implementation in src/overlays/ov054/overlay054_recovery.c.

.global func_ov054_0220eb1c
func_ov054_0220eb1c:
    stmdb sp!, {r4, lr}
    ldr lr, .L_0220eb4c
    ldr r4, [sp, #0x8]
    ldrh ip, [lr, #0x0]
    and ip, ip, #0x43
    orr r0, ip, r0, lsl #0xe
    orr r0, r0, r1, lsl #0x7
    orr r0, r0, r2, lsl #0x8
    orr r0, r0, r3, lsl #0x2
    orr r0, r0, r4, lsl #0xd
    strh r0, [lr, #0x0]
    ldmia sp!, {r4, pc}
.L_0220eb4c: .word 0x400000a
.size func_ov054_0220eb1c, . - func_ov054_0220eb1c
