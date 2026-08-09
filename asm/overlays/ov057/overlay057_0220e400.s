.text
; Matching fallback for the portable implementation in src/overlays/ov057/overlay057_recovery.c.
.extern GraphicsResourceSet_Init
.extern data_ov057_0220e7d4
.extern func_0201e250
.extern func_ov057_0220e658

.global func_ov057_0220e400
func_ov057_0220e400:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0201e250
    ldr r1, .L_0220e4d4
    add r0, r4, #0x8
    str r1, [r4, #0x0]
    bl GraphicsResourceSet_Init
    mov r1, #0x0
    str r1, [r4, #0x20]
    mov r0, r4
    str r1, [r4, #0x24]
    bl func_ov057_0220e658
    ldr r0, .L_0220e4d8
    mov r1, #0x0
    str r1, [r0, #0x0]
    str r1, [r4, #0x14]
    ldrsh r2, [r4, #0x18]
    ldr r1, .L_0220e4dc
    mov r0, r4
    bic r2, r2, #0xf
    strh r2, [r4, #0x18]
    ldrsh r2, [r4, #0x18]
    and r2, r2, r1
    orr r2, r2, #0x140
    strh r2, [r4, #0x18]
    ldrsh r2, [r4, #0x1a]
    bic r2, r2, #0xf
    orr r2, r2, #0x1
    strh r2, [r4, #0x1a]
    ldrsh r2, [r4, #0x1a]
    and r2, r2, r1
    orr r2, r2, #0x140
    strh r2, [r4, #0x1a]
    ldrsh r2, [r4, #0x1c]
    bic r2, r2, #0xf
    orr r2, r2, #0x2
    strh r2, [r4, #0x1c]
    ldrsh r2, [r4, #0x1c]
    and r2, r2, r1
    orr r2, r2, #0x140
    strh r2, [r4, #0x1c]
    ldrsh r2, [r4, #0x1e]
    bic r2, r2, #0xf
    orr r2, r2, #0x1
    strh r2, [r4, #0x1e]
    ldrsh r2, [r4, #0x1e]
    and r1, r2, r1
    orr r1, r1, #0x140
    strh r1, [r4, #0x1e]
    ldr r1, [r4, #0x4]
    orr r1, r1, #0x2
    str r1, [r4, #0x4]
    ldmia sp!, {r4, pc}
.L_0220e4d4: .word data_ov057_0220e7d4
.L_0220e4d8: .word 0x4001014
.L_0220e4dc: .word 0xffff000f
.size func_ov057_0220e400, . - func_ov057_0220e400
