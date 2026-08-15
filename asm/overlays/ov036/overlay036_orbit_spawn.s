.text

/* Exact fallback; see src/overlays/ov036/overlay036_orbit_spawn.c for documented portable C. */

    .extern Presentation_InterpolateLinear
    .extern Heap_Alloc
    .extern func_ov036_02200234
    .extern GraphicsAnimationInstanceManager_CreateInstance
    .extern func_ov036_021ff050
    .extern Presentation_SetPosition
    .extern PresentationList_Append
    .extern func_02091b98
    .extern data_ov036_02206178
    .extern gHeapContext

    .global func_ov036_022009b8
func_ov036_022009b8:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0xc
    mov r9, r1
    ldr r3, [r9, #0x0]
    mov r10, r0
    mov r0, #0x1f
    mov r1, #0x0
    mov r2, #0x6
    bl Presentation_InterpolateLinear
    orr r1, r0, r0, lsl #0x5
    orr r0, r1, r0, lsl #0xa
    mov r4, r0, lsl #0x10
    ldr r1, L_02200b30
    ldr r3, L_02200b34
    mov r0, #0xc4
    mov r2, #0x4
    mov r6, r4, lsr #0x10
    bl Heap_Alloc
    movs r8, r0
    beq L_02200a14
    ldr r1, [r9, #0x0]
    bl func_ov036_02200234
    mov r8, r0
L_02200a14:
    ldr r0, [r10, #0x100]
    add r1, r10, #0xdc
    bl GraphicsAnimationInstanceManager_CreateInstance
    str r0, [r8, #0x9c]
    ldr r0, [r9, #0x0]
    mov r2, #0x0
    and r1, r0, #0x1
    str r2, [sp, #0x0]
    add r0, r0, #0x18
    str r0, [sp, #0x4]
    mov r0, #0x46
    str r0, [sp, #0x8]
    ldr r0, [r8, #0x9c]
    mov r3, r2
    add r1, r1, #0x2
    bl func_ov036_021ff050
    ldr r0, [r8, #0x9c]
    mov r4, #0x1000
    mov r7, #0x0
    strh r6, [r0, #0x4e]
    rsb r4, r4, #0x0
    mov r11, #0x1
    mov r5, #0x46
L_02200a70:
    ldr r0, [r10, #0x100]
    add r1, r10, #0xdc
    bl GraphicsAnimationInstanceManager_CreateInstance
    add r2, r8, r7, lsl #0x2
    str r0, [r2, #0xa0]
    mov r0, #0x0
    str r0, [sp, #0x0]
    ldr r0, [r9, #0x0]
    and r1, r7, #0x1
    add r0, r0, #0x18
    stmib sp, {r0, r5}
    ldr r0, [r2, #0xa0]
    mov r2, #0x0
    mov r3, r2
    bl func_ov036_021ff050
    add r2, r8, r7, lsl #0x2
    ldr r0, [r2, #0xa0]
    strh r6, [r0, #0x4e]
    ldr r0, [r9, #0x0]
    tst r0, #0x1
    beq L_02200adc
    str r11, [r8, #0xb8]
    ldr r1, [r2, #0xa0]
    mov r0, #0x3
    strb r0, [r1, #0x59]
    ldr r0, [r2, #0xa0]
    str r4, [r0, #0x34]
L_02200adc:
    add r7, r7, #0x1
    cmp r7, #0x4
    blt L_02200a70
    ldr r3, [r9, #0x0]
    mov r0, #0x280
    sub r1, r3, #0x1
    mul r2, r1, r0
    mov r1, r3, lsl #0x6
    mov r0, r8
    sub r2, r2, #0x600
    rsb r3, r1, #0x0
    mov r1, #0x0
    bl Presentation_SetPosition
    mov r1, r8
    add r0, r10, #0x11c
    bl PresentationList_Append
    ldr r1, [r9, #0x4]
    add r0, r10, #0xa4
    bl func_02091b98
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_02200b30: .word data_ov036_02206178
L_02200b34: .word gHeapContext
    .size func_ov036_022009b8, .-func_ov036_022009b8

