    .text

/* Exact fallbacks; see src/overlays/ov016/overlay016_display_helpers.c. */
    .global func_ov016_021ff04c
    .global Overlay016_ConfigureMainBg3

func_ov016_021ff04c:
    ldr r2, L_021ff064
    ldrh r1, [r2, #0x0]
    bic r1, r1, #0x8000
    orr r0, r1, r0, lsl #0xf
    strh r0, [r2, #0x0]
    bx lr
L_021ff064: .word 0x4000304

    .global Overlay016_ConfigureMainBg3
Overlay016_ConfigureMainBg3:
    stmdb sp!, {r3, lr}
    ldr lr, L_021ff090
    ldrh ip, [lr, #0x0]
    and ip, ip, #0x43
    orr r0, ip, r0, lsl #0xe
    orr r0, r0, r1, lsl #0x7
    orr r0, r0, r2, lsl #0x8
    orr r0, r0, r3, lsl #0x2
    strh r0, [lr, #0x0]
    ldmia sp!, {r3, pc}
L_021ff090: .word 0x400000e

    .size func_ov016_021ff04c, Overlay016_ConfigureMainBg3 - func_ov016_021ff04c
    .size Overlay016_ConfigureMainBg3, . - Overlay016_ConfigureMainBg3
