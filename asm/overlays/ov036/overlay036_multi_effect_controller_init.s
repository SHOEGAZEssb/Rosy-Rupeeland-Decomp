.text

/* Exact fallback; see src/overlays/ov036/overlay036_multi_effect_controller_init.c for documented portable C. */

    .extern func_ov036_021fce00
    .extern func_020720c0
    .extern func_ov036_021fe218
    .extern func_020720e8
    .extern Graphics3DResourceOwner_PrepareResources
    .extern func_02071adc
    .extern Graphics3DResourceOwner_CreateManager
    .extern GraphicsAnimationInstanceManager_CreateInstance
    .extern func_ov036_021ff050
    .extern Heap_Alloc
    .extern func_020955d8
    .extern func_02094bbc
    .extern func_02095274
    .extern func_020948d4
    .extern func_ov036_021fcf34
    .extern func_ov036_021fe9fc
    .extern func_ov036_021fea04
    .extern func_020b0300
    .extern func_02092850
    .extern data_ov036_022060ec
    .extern data_020f4e18
    .extern data_ov036_02206160
    .extern gHeapContext
    .extern data_ov036_02206168


    .global func_ov036_021ff214
func_ov036_021ff214:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0xc
    mov r4, r1
    mov r1, r2
    mov r5, r0
    bl func_ov036_021fce00
    ldr r1, L_021ff590
    add r0, r5, #0xdc
    str r1, [r5, #0x0]
    bl func_020720c0
    add r0, r5, #0x108
    bl func_ov036_021fe218
    add r0, r5, #0x118
    bl func_ov036_021fe218
    add r0, r5, #0x128
    bl func_ov036_021fe218
    ldr r3, L_021ff594
    ldr r1, L_021ff598
    str r3, [sp, #0x0]
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    add r0, r5, #0xdc
    sub r3, r3, #0x1
    bl func_020720e8
    mov r0, r4
    add r1, r5, #0xdc
    bl Graphics3DResourceOwner_PrepareResources
    ldr r3, L_021ff59c
    ldr r1, L_021ff598
    str r3, [sp, #0x0]
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    add r0, r5, #0xcc
    sub r3, r3, #0x1
    bl func_020720e8
    mov r0, r4
    add r1, r5, #0xcc
    bl Graphics3DResourceOwner_PrepareResources
    ldr r0, L_021ff598
    ldr r1, L_021ff5a0
    ldr r0, [r0, #0x0]
    bl func_02071adc
    str r0, [r5, #0xf0]
    ldr r0, L_021ff598
    ldr r1, L_021ff5a4
    ldr r0, [r0, #0x0]
    bl func_02071adc
    str r0, [r5, #0xf4]
    mov r0, r4
    bl Graphics3DResourceOwner_CreateManager
    add r1, r5, #0xdc
    str r0, [r5, #0xe8]
    bl GraphicsAnimationInstanceManager_CreateInstance
    mov r2, #0x0
    str r2, [sp, #0x0]
    mov r1, #0x2
    str r1, [sp, #0x4]
    mov r3, #0x46
    str r3, [sp, #0x8]
    mov r3, r2
    mov r4, r0
    bl func_ov036_021ff050
    ldr r1, L_021ff5a8
    ldr r3, L_021ff5ac
    mov r0, #0xa0
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021ff330
    mov r1, r4
    bl func_020955d8
L_021ff330:
    mov r1, #0x0
    str r0, [r5, #0xec]
    mov r3, r1
    mov r2, #0x1400
    bl func_02094bbc
    ldr r1, [r5, #0xec]
    add r0, r5, #0x108
    bl func_02095274
    ldr r0, [r5, #0xe8]
    add r1, r5, #0xcc
    bl GraphicsAnimationInstanceManager_CreateInstance
    mov r1, #0x0
    str r1, [sp, #0x0]
    mov r2, #0x1
    str r2, [sp, #0x4]
    mov r2, #0x46
    str r2, [sp, #0x8]
    mov r2, r1
    mov r3, r1
    mov r4, r0
    bl func_ov036_021ff050
    mov r0, #0x1
    strb r0, [r4, #0x5b]
    ldr r1, L_021ff5a8
    ldr r3, L_021ff5ac
    mov r0, #0xa0
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021ff3b0
    mov r1, r4
    bl func_020955d8
L_021ff3b0:
    str r0, [r5, #0xd8]
    mov r1, r0
    add r0, r5, #0x108
    bl func_02095274
    mov r1, #0x0
    ldr r0, [r5, #0xd8]
    mov r3, r1
    mov r2, #0x300
    bl func_02094bbc
    ldr r0, [r5, #0xd8]
    mov r1, #0x4000
    add r0, r0, #0x6c
    bl func_020948d4
    ldr r1, [r5, #0x4]
    ldr r0, L_021ff5b0
    ldr r3, L_021ff5ac
    cmp r1, r0
    mov r4, #0x0
    ldr r1, L_021ff5b4
    mov r0, #0xc4
    mov r2, #0x4
    moveq r4, #0x1
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021ff424
    ldr r1, [r5, #0xf4]
    mov r2, r4
    mov r3, #0x8
    bl func_ov036_021fcf34
L_021ff424:
    str r0, [r5, #0xfc]
    mov r1, r0
    add r0, r5, #0x118
    bl func_02095274
    ldr r0, [r5, #0xfc]
    mov r1, #0x800
    add r0, r0, #0x6c
    bl func_020948d4
    ldr r1, L_021ff5b4
    ldr r3, L_021ff5ac
    mov r0, #0xc4
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021ff470
    ldr r1, [r5, #0xf0]
    mov r2, #0x2
    mov r3, #0x8
    bl func_ov036_021fcf34
L_021ff470:
    str r0, [r5, #0xf8]
    mov r1, r0
    add r0, r5, #0x118
    bl func_02095274
    ldr r0, [r5, #0xf8]
    mov r1, #0x800
    add r0, r0, #0x6c
    bl func_020948d4
    ldr r1, L_021ff5b4
    ldr r3, L_021ff5ac
    mov r0, #0xc4
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021ff4bc
    ldr r1, [r5, #0xf0]
    mov r2, #0x1
    mov r3, #0x8
    bl func_ov036_021fcf34
L_021ff4bc:
    str r0, [r5, #0x100]
    mov r1, r0
    add r0, r5, #0x118
    bl func_02095274
    ldr r0, [r5, #0x100]
    mov r1, #0x800
    add r0, r0, #0x6c
    bl func_020948d4
    ldr r4, [r5, #0x100]
    ldr r1, L_021ff5b4
    ldrh r2, [r4, #0x98]
    ldr r3, L_021ff5ac
    mov r0, #0xc4
    orr r2, r2, #0x1
    strh r2, [r4, #0x98]
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021ff518
    ldr r1, [r5, #0xf0]
    mov r2, #0x3
    mov r3, #0x0
    bl func_ov036_021fcf34
L_021ff518:
    str r0, [r5, #0x104]
    mov r1, r0
    add r0, r5, #0x118
    bl func_02095274
    ldr r0, [r5, #0x104]
    mov r1, #0x800
    add r0, r0, #0x6c
    bl func_020948d4
    add r0, r5, #0xc
    mov r1, #0x0
    mov r2, #0x3c00
    mov r3, #0x1400
    bl func_ov036_021fe9fc
    mov r1, #0x0
    add r0, r5, #0xc
    mov r2, r1
    mov r3, r1
    bl func_ov036_021fea04
    mov r0, #0x0
    str r0, [sp, #0x0]
    ldr r2, L_021ff5b8
    mov r0, #0x1c80
    mov r1, #0x1f
    mov r3, #0x3f
    bl func_020b0300
    mov r0, #0x1c80
    bl func_02092850
    mov r0, r5
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, pc}
L_021ff590: .word data_ov036_022060ec
L_021ff594: .word 0x6005
L_021ff598: .word data_020f4e18
L_021ff59c: .word 0x60c2
L_021ff5a0: .word 0x5007
L_021ff5a4: .word 0x5008
L_021ff5a8: .word data_ov036_02206160
L_021ff5ac: .word gHeapContext
L_021ff5b0: .word 0x25a
L_021ff5b4: .word data_ov036_02206168
L_021ff5b8: .word 0x7fff
    .size func_ov036_021ff214, .-func_ov036_021ff214

