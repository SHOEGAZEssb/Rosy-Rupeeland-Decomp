.text
; Matching fallback for the portable implementation in src/overlays/ov051/overlay051_main_scene_recovery.c.

.global func_ov051_0220dbc4
func_ov051_0220dbc4:
    stmdb sp!, {r3, lr}
    ldr lr, .L_0220dbec
    ldrh ip, [lr, #0x0]
    and ip, ip, #0x43
    orr r0, ip, r0, lsl #0xe
    orr r0, r0, r3, lsl #0x2
    orr r0, r0, r2, lsl #0x8
    orr r0, r0, r1, lsl #0xd
    strh r0, [lr, #0x0]
    ldmia sp!, {r3, pc}
.L_0220dbec: .word 0x400000c
.size func_ov051_0220dbc4, . - func_ov051_0220dbc4
