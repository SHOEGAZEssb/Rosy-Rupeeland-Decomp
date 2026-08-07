    .text

    ; Exact matching fallback; see the documented portable reconstruction in
    ; src/overlays/ov011/overlay011_sub_bg1_control.c.
    .global func_ov011_021fd374
func_ov011_021fd374:
    stmdb sp!, {r4, lr}
    ldr lr, L_021fd3a4
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
L_021fd3a4: .word 0x400100a
    .size func_ov011_021fd374, . - func_ov011_021fd374
