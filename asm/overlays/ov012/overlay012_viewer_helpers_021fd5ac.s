    .text
    .extern Overlay012_SetDisp3dBit4Enabled
    .extern Overlay012_Transform_SetResource
    .extern Overlay012_InitSceneFields
    .extern func_020b0300
    .extern data_ov012_021fe4d0
/* Exact grouped fallback; see src/overlays/ov012/overlay012_viewer_helpers.c. */
    .global Overlay012_UpdateViewerHelpers
Overlay012_UpdateViewerHelpers:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #4
    mov r4, r0
    mov r1, #0
    str r1, [r4, #0x198]
    str r1, [r4, #0x19c]
    str r1, [r4, #0x1ac]
    str r1, [r4, #0x1a8]
    str r1, [r4, #0x1a4]
    mov r0, #2
    str r0, [r4, #0x1a0]
    mov r0, #8
    str r0, [r4, #0x194]
    mov r1, #1
    str r1, [r4, #0x1b0]
    str r1, [r4, #0x1b4]
    str r1, [r4, #0x1b8]
    mov r0, #0x1f
    str r0, [r4, #0x1c0]
    str r1, [r4, #0x1bc]
    ldr r0, [r4, #0x1b8]
    bl Overlay012_SetDisp3dBit4Enabled
    ldr r1, [r4, #0x194]
    mov ip, #0
    orr r0, r1, r1, lsl #5
    orr r0, r0, r1, lsl #0xa
    mov r0, r0, lsl #0x10
    ldr r2, L_021fd638
    mov r0, r0, lsr #0x10
    mov r1, #0x1f
    mov r3, #0x3f
    str ip, [sp]
    bl func_020b0300
    add sp, sp, #4
    ldmia sp!, {r3, r4, pc}
L_021fd638:
    .word 0x00007fff
    .size Overlay012_UpdateViewerHelpers, . - Overlay012_UpdateViewerHelpers

    .global func_ov012_021fd63c
func_ov012_021fd63c:
    mov r1, #0
    str r1, [r0, #0x18c]
    ldr r2, [r0, #0x188]
    mov r1, #0x18
    mul r1, r2, r1
    ldr r2, [r0, #0x7c]
    ldr ip, L_021fd664
    add r0, r0, #0x158
    ldr r1, [r2, r1]
    bx ip
L_021fd664:
    .word Overlay012_Transform_SetResource
    .size func_ov012_021fd63c, . - func_ov012_021fd63c

    .global func_ov012_021fd668
func_ov012_021fd668:
    ldr r0, [r0, #0x50]
    ldrh r0, [r0, #6]
    tst r0, #0x10
    beq L_021fd68c
    ldr r0, [sp]
    add r1, r1, r0
    cmp r1, r3
    movgt r1, r3
    b L_021fd6a4
L_021fd68c:
    tst r0, #0x20
    beq L_021fd6a4
    ldr r0, [sp]
    sub r1, r1, r0
    cmp r1, r2
    movlt r1, r2
L_021fd6a4:
    mov r0, r1
    bx lr
    .size func_ov012_021fd668, . - func_ov012_021fd668

    .global func_ov012_021fd6ac
func_ov012_021fd6ac:
    ldr r0, [r0, #0x50]
    ldrh r0, [r0, #6]
    tst r0, #0x10
    beq L_021fd6d0
    ldr r0, [sp]
    add r1, r1, r0
    cmp r1, r3
    movgt r1, r2
    b L_021fd6e8
L_021fd6d0:
    tst r0, #0x20
    beq L_021fd6e8
    ldr r0, [sp]
    sub r1, r1, r0
    cmp r1, r2
    movlt r1, r3
L_021fd6e8:
    mov r0, r1
    bx lr
    .size func_ov012_021fd6ac, . - func_ov012_021fd6ac

    .global func_ov012_021fd6f0
func_ov012_021fd6f0:
    stmdb sp!, {r3, lr}
    sub sp, sp, #8
    ldr r1, [r0, #0x28]
    cmp r1, #0
    bne L_021fd72c
    ldr r1, L_021fd738
    add r2, sp, #0
    ldr ip, [r1, #8]
    ldr r3, [r1, #0xc]
    str ip, [sp]
    sub r1, r3, #0x48
    str r1, [sp, #4]
    add r0, r0, #0x24
    ldmia r2, {r1, r2}
    bl Overlay012_InitSceneFields
L_021fd72c:
    mov r0, #0
    add sp, sp, #8
    ldmia sp!, {r3, pc}
L_021fd738:
    .word data_ov012_021fe4d0
    .size func_ov012_021fd6f0, . - func_ov012_021fd6f0
