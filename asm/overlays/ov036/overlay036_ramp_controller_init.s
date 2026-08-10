.text

/* Exact fallback; see src/overlays/ov036/overlay036_ramp_controller_init.c for documented portable C. */

    .extern func_ov036_021fce00
    .extern GraphicsResourceSetVariant_Init
    .extern func_ov036_021fe218
    .extern func_02091b6c
    .extern GraphicsResourceSetVariant_Load
    .extern Graphics3DResourceOwner_PrepareResources
    .extern Graphics3DResourceOwner_CreateManager
    .extern GraphicsAnimationInstanceManager_CreateInstance
    .extern func_ov036_021ff050
    .extern Heap_Alloc
    .extern func_020955d8
    .extern func_02095274
    .extern func_02094bbc
    .extern func_020948d4
    .extern func_ov036_02201710
    .extern func_ov036_021fe9fc
    .extern func_ov036_021fea04
    .extern func_020b0300
    .extern func_02092850
    .extern func_02091bac
    .extern func_02091b98
    .extern data_ov036_02206028
    .extern data_020f4e18
    .extern data_ov036_02206160
    .extern gHeapContext

    .global func_ov036_0220102c
func_ov036_0220102c:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0xc
    mov r4, r1
    mov r1, r2
    mov r5, r0
    bl func_ov036_021fce00
    ldr r1, L_02201324
    add r0, r5, #0xdc
    str r1, [r5, #0x0]
    bl GraphicsResourceSetVariant_Init
    add r0, r5, #0xe8
    bl GraphicsResourceSetVariant_Init
    add r0, r5, #0xf4
    bl GraphicsResourceSetVariant_Init
    add r0, r5, #0x100
    bl GraphicsResourceSetVariant_Init
    add r0, r5, #0x10c
    bl GraphicsResourceSetVariant_Init
    add r0, r5, #0x148
    bl func_ov036_021fe218
    add r0, r5, #0x158
    bl func_ov036_021fe218
    add r0, r5, #0x168
    bl func_02091b6c
    add r0, r5, #0x184
    bl func_02091b6c
    ldr r3, L_02201328
    add r0, r5, #0xdc
    str r3, [sp, #0x0]
    ldr r1, L_0220132c
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    sub r3, r3, #0x1
    bl GraphicsResourceSetVariant_Load
    mov r0, r4
    add r1, r5, #0xdc
    bl Graphics3DResourceOwner_PrepareResources
    ldr r3, L_02201330
    add r0, r5, #0xe8
    str r3, [sp, #0x0]
    ldr r1, L_0220132c
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    sub r3, r3, #0x1
    bl GraphicsResourceSetVariant_Load
    mov r0, r4
    add r1, r5, #0xe8
    bl Graphics3DResourceOwner_PrepareResources
    ldr r3, L_02201334
    add r0, r5, #0xf4
    str r3, [sp, #0x0]
    ldr r1, L_0220132c
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    sub r3, r3, #0x1
    bl GraphicsResourceSetVariant_Load
    mov r0, r4
    add r1, r5, #0xf4
    bl Graphics3DResourceOwner_PrepareResources
    ldr r3, L_02201338
    add r0, r5, #0x100
    str r3, [sp, #0x0]
    ldr r1, L_0220132c
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    sub r3, r3, #0x1
    bl GraphicsResourceSetVariant_Load
    mov r0, r4
    add r1, r5, #0x100
    bl Graphics3DResourceOwner_PrepareResources
    ldr r3, L_0220133c
    ldr r0, L_0220132c
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x2
    add r0, r5, #0x10c
    sub r3, r3, #0x1
    bl GraphicsResourceSetVariant_Load
    mov r0, r4
    add r1, r5, #0x10c
    bl Graphics3DResourceOwner_PrepareResources
    ldr r3, L_02201340
    ldr r1, L_0220132c
    str r3, [sp, #0x0]
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    add r0, r5, #0xcc
    sub r3, r3, #0x1
    bl GraphicsResourceSetVariant_Load
    mov r0, r4
    add r1, r5, #0xcc
    bl Graphics3DResourceOwner_PrepareResources
    mov r0, r4
    bl Graphics3DResourceOwner_CreateManager
    add r1, r5, #0xe8
    str r0, [r5, #0x118]
    bl GraphicsAnimationInstanceManager_CreateInstance
    mov r1, #0x0
    str r1, [sp, #0x0]
    mov r2, #0x9
    str r2, [sp, #0x4]
    mov r2, #0x42
    str r2, [sp, #0x8]
    mov r2, r1
    mov r3, r1
    mov r4, r0
    bl func_ov036_021ff050
    ldr r1, L_02201344
    ldr r3, L_02201348
    mov r0, #0xa0
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_022011fc
    mov r1, r4
    bl func_020955d8
L_022011fc:
    str r0, [r5, #0x11c]
    mov r1, r0
    add r0, r5, #0x148
    bl func_02095274
    ldr r0, [r5, #0x118]
    add r1, r5, #0xcc
    bl GraphicsAnimationInstanceManager_CreateInstance
    mov r1, #0x0
    str r1, [sp, #0x0]
    mov r4, #0x1
    str r4, [sp, #0x4]
    mov r4, #0x46
    str r4, [sp, #0x8]
    mov r2, r1
    mov r3, r1
    mov r4, r0
    bl func_ov036_021ff050
    ldr r1, L_02201344
    ldr r3, L_02201348
    mov r0, #0xa0
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_02201264
    mov r1, r4
    bl func_020955d8
L_02201264:
    str r0, [r5, #0xd8]
    mov r1, r0
    add r0, r5, #0x148
    bl func_02095274
    mov r1, #0x0
    ldr r0, [r5, #0xd8]
    mov r2, r1
    mov r3, r1
    bl func_02094bbc
    ldr r0, [r5, #0xd8]
    mov r1, #0x29
    add r0, r0, #0x6c
    bl func_020948d4
    mov r0, r5
    bl func_ov036_02201710
    mov r1, #0x0
    add r0, r5, #0xc
    mov r2, r1
    mov r3, #0x2800
    bl func_ov036_021fe9fc
    mov r1, #0x0
    add r0, r5, #0xc
    mov r2, r1
    mov r3, r1
    bl func_ov036_021fea04
    mov r0, #0x0
    ldr r2, L_0220134c
    mov r1, #0x1f
    mov r3, #0x3f
    str r0, [sp, #0x0]
    bl func_020b0300
    mov r0, #0x0
    bl func_02092850
    mov r0, #0xf0
    str r0, [sp, #0x0]
    add r0, r5, #0x168
    mov r1, #0x1
    mov r2, #0x0
    mov r3, #0x1000
    bl func_02091bac
    add r0, r5, #0x184
    mov r1, #0x78
    bl func_02091b98
    mov r0, #0x1
    str r0, [r5, #0x1a0]
    mov r0, r5
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, pc}
L_02201324: .word data_ov036_02206028
L_02201328: .word 0x6005
L_0220132c: .word data_020f4e18
L_02201330: .word 0x605f
L_02201334: .word 0x6062
L_02201338: .word 0x6065
L_0220133c: .word 0x60bf
L_02201340: .word 0x60c8
L_02201344: .word data_ov036_02206160
L_02201348: .word gHeapContext
L_0220134c: .word 0x7fff
    .size func_ov036_0220102c, .-func_ov036_0220102c

