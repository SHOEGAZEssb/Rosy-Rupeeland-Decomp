.text
; Matching fallback for the portable implementation in src/overlays/ov056/overlay056_recovery.c.

.global func_ov056_0220e828
func_ov056_0220e828:
    stmdb sp!, {r3, lr}
    ldr lr, .L_0220e850
    ldrh ip, [lr, #0x0]
    and ip, ip, #0x43
    orr r0, ip, r0, lsl #0xe
    orr r0, r0, r1, lsl #0x7
    orr r0, r0, r2, lsl #0x8
    orr r0, r0, r3, lsl #0x2
    strh r0, [lr, #0x0]
    ldmia sp!, {r3, pc}
.L_0220e850: .word 0x400100e
.size func_ov056_0220e828, . - func_ov056_0220e828
