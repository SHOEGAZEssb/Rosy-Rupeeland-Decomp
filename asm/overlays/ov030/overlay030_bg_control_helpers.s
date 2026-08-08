.text

/* Exact fallback; see src/overlays/ov030/overlay030_display_setup.c for documented portable C. */



    .global func_ov030_021fe3e0
func_ov030_021fe3e0:
    stmdb sp!, {r4, lr}
    ldr lr, L_021fe410
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
L_021fe410: .word 0x4000008
.size func_ov030_021fe3e0, .-func_ov030_021fe3e0
    .global func_ov030_021fe414
func_ov030_021fe414:
    stmdb sp!, {r4, lr}
    ldr lr, L_021fe444
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
L_021fe444: .word 0x400000a
.size func_ov030_021fe414, .-func_ov030_021fe414
