    .text
/* Exact fallback; see src/overlays/ov018/overlay018_display_setup.c. */
    .extern GXS_SetGraphicsMode
    .extern data_021052fc
    .extern data_ov018_021ffcd0
    .extern func_02005058
    .extern func_0200875c
    .extern GamePhaseRuntime_GetAuxiliaryOverlayObject
    .extern func_0202839c
    .extern func_020afaec
    .extern func_020afd0c
    .extern func_020afd28
    .extern func_ov018_021fe5f8
    .extern func_ov056_0220f0ac
.global func_ov018_021fd5d0
func_ov018_021fd5d0:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x24
    mov r2, #0x0
    mov r1, #0x1000
    mov r4, r0
    str r1, [sp, #0x14]
    str r1, [sp, #0x20]
    str r2, [sp, #0x18]
    str r2, [sp, #0x1c]
    str r2, [sp, #0x0]
    ldr r0, L_021fd6ac
    add r1, sp, #0x14
    mov r3, r2
    str r2, [sp, #0x4]
    bl func_020afd28
    mov r0, #0x5
    bl GXS_SetGraphicsMode
    ldr r5, L_021fd6b0
    ldr r0, L_021fd6b4
    ldrh r3, [r5, #0x0]
    ldr r2, L_021fd6b8
    mov r1, #0x0
    and r3, r3, #0x43
    orr r3, r3, #0x480
    orr r3, r3, #0x4000
    strh r3, [r5, #0x0]
    ldr r0, [r0, #0x0]
    str r2, [sp, #0x8]
    add r0, r0, #0x3000
    str r1, [sp, #0xc]
    str r1, [sp, #0x10]
    ldr r1, [r0, #0xbc]
    add r0, sp, #0x8
    ldr r1, [r1, #0x0]
    bl func_0202839c
    ldr r0, L_021fd6b4
    ldr r0, [r0, #0x0]
    bl GamePhaseRuntime_GetAuxiliaryOverlayObject
    mov r5, r0
    bl func_020afaec
    mov r1, r0
    ldr ip, [r4, #0x5c]
    ldr r3, [sp, #0xc]
    mov r2, #0x1e0
    mla r2, r3, r2, ip
    ldr lr, [r4, #0x60]
    ldr ip, [sp, #0x10]
    mov r3, #0x160
    mla r3, ip, r3, lr
    mov r0, r5
    bl func_ov056_0220f0ac
    mov r0, r4
    bl func_ov018_021fe5f8
    add sp, sp, #0x24
    ldmia sp!, {r4, r5, pc}
L_021fd6ac: .word 0x4001020
L_021fd6b0: .word 0x400100c
L_021fd6b4: .word data_021052fc
L_021fd6b8: .word data_ov018_021ffcd0
    .size func_ov018_021fd5d0, . - func_ov018_021fd5d0

    .global func_ov018_021fd6bc
func_ov018_021fd6bc:
    bx lr
    .size func_ov018_021fd6bc, . - func_ov018_021fd6bc

    .global func_ov018_021fd6c0
func_ov018_021fd6c0:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    ldr r3, L_021fd738
    mov r1, #0x15
    ldrh r2, [r3, #0x0]
    ldr r4, L_021fd73c
    mov lr, #0x0
    orr r2, r2, #0x8000
    strh r2, [r3, #0x0]
    str r1, [r0, #0x4c]
    ldrh r2, [r4, #0x0]
    add r0, r4, #0x48
    mov r1, #0x1
    and r2, r2, #0x43
    orr r2, r2, #0x3800
    strh r2, [r4, #0x0]
    str lr, [r4, #0x8]
    ldrh ip, [r4, #0x0]
    mov r2, #0x3e
    mov r3, #0x10
    bic ip, ip, #0x3
    strh ip, [r4, #0x0]
    ldrh ip, [r4, #0x4]
    bic ip, ip, #0x3
    orr ip, ip, #0x3
    strh ip, [r4, #0x4]
    str lr, [sp, #0x0]
    bl func_020afd0c
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
L_021fd738: .word 0x4000304
L_021fd73c: .word 0x4001008
    .size func_ov018_021fd6c0, . - func_ov018_021fd6c0

    .global func_ov018_021fd740
func_ov018_021fd740:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x10
    ldr r1, L_021fd784
    mov r4, r0
    ldr r1, [r1, #0x0]
    add r0, sp, #0x0
    bl func_0200875c
    ldr r1, [sp, #0x4]
    add r0, sp, #0x0
    mov r1, r1, asr #0xc
    str r1, [r4, #0x5c]
    ldr r1, [sp, #0x8]
    mov r1, r1, asr #0xc
    str r1, [r4, #0x60]
    bl func_02005058
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
L_021fd784: .word data_021052fc
    .size func_ov018_021fd740, . - func_ov018_021fd740
