.text

/* Exact fallback; see src/overlays/ov035/overlay035_quaternary_scene_constructor.c for documented portable C. */

    .extern func_ov035_021fce00
    .extern func_020720c0
    .extern Graphics3DLightSet_Init
    .extern func_ov035_021fdce8
    .extern func_020720e8
    .extern Graphics3DResourceOwner_PrepareResources
    .extern func_02071adc
    .extern Graphics3DResourceOwner_CreateManager
    .extern GraphicsAnimationInstanceManager_CreateInstance
    .extern Heap_Alloc
    .extern func_020955d8
    .extern func_02095274
    .extern func_02094bbc
    .extern func_ov035_021fcf34
    .extern func_020948d4
    .extern func_02094ad4
    .extern func_020948e4
    .extern func_ov035_021fdd70
    .extern func_ov035_021fdd78
    .extern func_ov035_021ffec4
    .extern func_020b0300
    .extern func_02092850
    .extern data_ov035_02203c78
    .extern data_020f4e18
    .extern data_ov035_02203d20
    .extern data_ov035_02203d48
    .extern data_ov035_02203d58
    .extern gHeapContext

    .global func_ov035_021fff38
func_ov035_021fff38:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x10
    mov r5, r1
    mov r1, r2
    mov r6, r0
    bl func_ov035_021fce00
    ldr r1, L_02200400
    add r0, r6, #0xdc
    str r1, [r6, #0x0]
    bl func_020720c0
    add r0, r6, #0xe8
    bl func_020720c0
    add r0, r6, #0xf4
    bl func_020720c0
    add r0, r6, #0x120
    bl Graphics3DLightSet_Init
    add r0, r6, #0x160
    bl func_ov035_021fdce8
    add r0, r6, #0x170
    bl func_ov035_021fdce8
    mov r0, #0x1
    str r0, [r6, #0xc0]
    ldr r3, L_02200404
    add r0, r6, #0xdc
    str r3, [sp, #0x0]
    ldr r1, L_02200408
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    sub r3, r3, #0x1
    bl func_020720e8
    mov r0, r5
    add r1, r6, #0xdc
    bl Graphics3DResourceOwner_PrepareResources
    ldr r3, L_0220040c
    add r0, r6, #0xe8
    str r3, [sp, #0x0]
    ldr r1, L_02200408
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    sub r3, r3, #0x1
    bl func_020720e8
    mov r0, r5
    add r1, r6, #0xe8
    bl Graphics3DResourceOwner_PrepareResources
    ldr r1, [r6, #0x4]
    cmp r1, #0x12c
    beq L_0220000c
    ldr r0, L_02200410
    cmp r1, r0
    beq L_02200034
    add r0, r0, #0x3
    cmp r1, r0
    beq L_0220005c
L_0220000c:
    ldr r3, L_02200414
    ldr r0, L_02200408
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r6, #0xcc
    sub r2, r3, #0x2
    sub r3, r3, #0x1
    bl func_020720e8
    mov r4, #0x4
    b L_02200080
L_02200034:
    ldr r3, L_02200418
    ldr r0, L_02200408
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r6, #0xcc
    sub r2, r3, #0x2
    sub r3, r3, #0x1
    bl func_020720e8
    mov r4, #0x2
    b L_02200080
L_0220005c:
    ldr r3, L_0220041c
    ldr r0, L_02200408
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r6, #0xcc
    sub r2, r3, #0x2
    sub r3, r3, #0x1
    bl func_020720e8
    mov r4, #0x3
L_02200080:
    mov r0, r5
    add r1, r6, #0xcc
    bl Graphics3DResourceOwner_PrepareResources
    ldr r3, L_02200420
    ldr r0, L_02200408
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x2
    add r0, r6, #0xf4
    sub r3, r3, #0x1
    bl func_020720e8
    mov r0, r5
    add r1, r6, #0xf4
    bl Graphics3DResourceOwner_PrepareResources
    ldr r0, L_02200408
    ldr r1, L_02200424
    ldr r0, [r0, #0x0]
    bl func_02071adc
    str r0, [r6, #0x100]
    mov r0, r5
    bl Graphics3DResourceOwner_CreateManager
    add r1, r6, #0xdc
    str r0, [r6, #0x104]
    bl GraphicsAnimationInstanceManager_CreateInstance
    mov r5, r0
    ldrh r2, [r5, #0x50]
    ldr r1, L_02200428
    ldr r3, L_0220042c
    orr r2, r2, #0x42
    strh r2, [r5, #0x50]
    mov r0, #0xa0
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_02200114
    mov r1, r5
    bl func_020955d8
L_02200114:
    str r0, [r6, #0x108]
    mov r1, r0
    add r0, r6, #0x160
    bl func_02095274
    mov r1, #0x0
    ldr r0, [r6, #0x108]
    mov r2, r1
    sub r3, r1, #0x300
    bl func_02094bbc
    ldr r0, [r6, #0x104]
    add r1, r6, #0xf4
    bl GraphicsAnimationInstanceManager_CreateInstance
    mov r5, r0
    ldrh r2, [r5, #0x50]
    ldr r1, L_02200428
    ldr r3, L_0220042c
    orr r2, r2, #0x42
    strh r2, [r5, #0x50]
    mov r0, #0xa0
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_02200178
    mov r1, r5
    bl func_020955d8
L_02200178:
    str r0, [r6, #0x10c]
    mov r1, r0
    add r0, r6, #0x160
    bl func_02095274
    mov r1, #0x0
    ldr r0, [r6, #0x10c]
    mov r2, r1
    sub r3, r1, #0x400
    bl func_02094bbc
    ldr r0, [r6, #0x104]
    add r1, r6, #0xcc
    bl GraphicsAnimationInstanceManager_CreateInstance
    mov r5, r0
    ldrh r2, [r5, #0x50]
    mov r1, #0x2
    ldr r3, L_0220042c
    orr r2, r2, #0x46
    strh r2, [r5, #0x50]
    strb r1, [r5, #0x5a]
    ldr r1, L_02200428
    mov r0, #0xa0
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_022001e4
    mov r1, r5
    bl func_020955d8
L_022001e4:
    str r0, [r6, #0xd8]
    mov r1, r0
    add r0, r6, #0x160
    bl func_02095274
    ldr r1, L_02200430
    ldr r3, L_0220042c
    mov r0, #0xc4
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_02200220
    ldr r1, [r6, #0x100]
    mov r2, r4
    mov r3, #0x17
    bl func_ov035_021fcf34
L_02200220:
    str r0, [r6, #0x114]
    mov r1, r0
    add r0, r6, #0x170
    bl func_02095274
    mov r1, #0x0
    ldr r0, [r6, #0x114]
    mov r3, r1
    mov r2, #0x1000
    bl func_02094bbc
    ldr r0, [r6, #0x114]
    mov r1, #0x800
    add r0, r0, #0x6c
    bl func_020948d4
    ldr r1, L_02200430
    ldr r3, L_0220042c
    mov r0, #0xc4
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_02200280
    ldr r1, [r6, #0x100]
    mov r2, #0x0
    mov r3, #0x17
    bl func_ov035_021fcf34
L_02200280:
    str r0, [r6, #0x118]
    mov r1, r0
    add r0, r6, #0x170
    bl func_02095274
    mov r1, #0x0
    ldr r0, [r6, #0x118]
    mov r3, r1
    mov r2, #0x1000
    bl func_02094bbc
    ldr r0, [r6, #0x118]
    mov r1, #0x800
    add r0, r0, #0x6c
    bl func_020948d4
    ldr r1, L_02200430
    ldr r3, L_0220042c
    mov r0, #0xc4
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_022002e0
    ldr r1, [r6, #0x100]
    mov r2, #0x1
    mov r3, #0x17
    bl func_ov035_021fcf34
L_022002e0:
    str r0, [r6, #0x11c]
    mov r1, r0
    add r0, r6, #0x170
    bl func_02095274
    mov r1, #0x0
    ldr r0, [r6, #0x11c]
    mov r3, r1
    sub r2, r1, #0x1000
    bl func_02094bbc
    ldr r0, [r6, #0x11c]
    mov r1, #0x800
    add r0, r0, #0x6c
    bl func_020948d4
    ldr r1, L_02200434
    ldr r3, L_0220042c
    mov r0, #0x9c
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_02200334
    bl func_02094ad4
L_02200334:
    str r0, [r6, #0x110]
    mov r1, r0
    add r0, r6, #0x160
    bl func_02095274
    mov r1, #0x0
    ldr r0, [r6, #0x110]
    mov r2, r1
    mov r3, #0x1c00
    bl func_02094bbc
    ldr r0, [r6, #0x110]
    mov r1, #0x2
    add r0, r0, #0x2c
    mov r2, #0x2800
    bl func_020948e4
    ldr r2, [r6, #0x110]
    mov r0, #0xf0
    str r0, [r2, #0x7c]
    mov r1, #0x0
    str r1, [r2, #0x80]
    add r0, r6, #0xc
    mov r2, r1
    mov r3, #0x1800
    bl func_ov035_021fdd70
    mov r1, #0x0
    add r0, r6, #0xc
    mov r2, r1
    mov r3, r1
    bl func_ov035_021fdd78
    mov r0, #0x1000
    rsb r0, r0, #0x0
    str r0, [sp, #0x0]
    mov r0, #0x1f
    str r0, [sp, #0x4]
    str r0, [sp, #0x8]
    mov r1, #0x0
    str r0, [sp, #0xc]
    add r0, r6, #0x120
    mov r2, #0x800
    mov r3, r1
    bl func_ov035_021ffec4
    mov r0, #0x0
    ldr r2, L_02200438
    mov r1, #0x1f
    mov r3, #0x3f
    str r0, [sp, #0x0]
    bl func_020b0300
    mov r0, #0x0
    bl func_02092850
    mov r0, r6
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, pc}
L_02200400: .word data_ov035_02203c78
L_02200404: .word 0x6044
L_02200408: .word data_020f4e18
L_0220040c: .word 0x6047
L_02200410: .word 0x12f
L_02200414: .word 0x60e6
L_02200418: .word 0x60e9
L_0220041c: .word 0x60ec
L_02200420: .word 0x6041
L_02200424: .word 0x500e
L_02200428: .word data_ov035_02203d20
L_0220042c: .word gHeapContext
L_02200430: .word data_ov035_02203d48
L_02200434: .word data_ov035_02203d58
L_02200438: .word 0x7fff
    .size func_ov035_021fff38, .-func_ov035_021fff38

