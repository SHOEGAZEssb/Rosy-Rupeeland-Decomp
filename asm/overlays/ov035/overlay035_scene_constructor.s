.text

/* Exact fallback; see src/overlays/ov035/overlay035_scene_constructor.c for documented portable C. */

    .extern func_ov035_021fce00
    .extern GraphicsResourceSetVariant_Init
    .extern func_ov035_021fdce8
    .extern func_02091b6c
    .extern func_02091d08
    .extern GraphicsResourceSetVariant_Load
    .extern Graphics3DResourceOwner_PrepareResources
    .extern Graphics3DResourceOwner_CreateManager
    .extern GraphicsAnimationInstanceManager_CreateInstance
    .extern func_ov035_021fdd28
    .extern Heap_Alloc
    .extern func_020955d8
    .extern PresentationList_Append
    .extern Presentation_SetPosition
    .extern PresentationScalar_SetImmediate
    .extern func_ov035_021fdd70
    .extern func_ov035_021fdd78
    .extern func_020b0300
    .extern func_02092850
    .extern func_02091d24
    .extern data_ov035_02203b98
    .extern data_020f4e18
    .extern data_ov035_02203d20
    .extern gHeapContext


    .global func_ov035_021fdd88
func_ov035_021fdd88: 
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0xc
    mov r4, r1
    mov r1, r2
    mov r5, r0
    bl func_ov035_021fce00
    ldr r1, L_021fe10c
    add r0, r5, #0xdc
    str r1, [r5, #0x0]
    bl GraphicsResourceSetVariant_Init
    add r0, r5, #0xe8
    bl GraphicsResourceSetVariant_Init
    add r0, r5, #0xf4
    bl GraphicsResourceSetVariant_Init
    add r0, r5, #0x10c
    bl func_ov035_021fdce8
    add r0, r5, #0x11c
    bl func_02091b6c
    add r0, r5, #0x138
    bl func_02091d08
    ldr r3, L_021fe110
    add r0, r5, #0xdc
    str r3, [sp, #0x0]
    ldr r1, L_021fe114
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    sub r3, r3, #0x1
    bl GraphicsResourceSetVariant_Load
    mov r0, r4
    add r1, r5, #0xdc
    bl Graphics3DResourceOwner_PrepareResources
    ldr r0, [r5, #0x4]
    cmp r0, #0xc8
    beq L_021fde20
    cmp r0, #0xcb
    beq L_021fde64
    cmp r0, #0xce
    beq L_021fdea8
L_021fde20:
    ldr r3, L_021fe118
    ldr r0, L_021fe114
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r5, #0xe8
    sub r2, r3, #0x2
    sub r3, r3, #0x1
    bl GraphicsResourceSetVariant_Load
    ldr r3, L_021fe11c
    ldr r0, L_021fe114
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r5, #0xcc
    sub r2, r3, #0x2
    sub r3, r3, #0x1
    bl GraphicsResourceSetVariant_Load
    b L_021fdee8
L_021fde64:
    ldr r3, L_021fe118
    ldr r0, L_021fe114
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r5, #0xe8
    sub r2, r3, #0x2
    add r3, r3, #0x1
    bl GraphicsResourceSetVariant_Load
    ldr r3, L_021fe120
    ldr r0, L_021fe114
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r5, #0xcc
    sub r2, r3, #0x2
    sub r3, r3, #0x1
    bl GraphicsResourceSetVariant_Load
    b L_021fdee8
L_021fdea8:
    ldr r3, L_021fe118
    ldr r0, L_021fe114
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r5, #0xe8
    sub r2, r3, #0x2
    add r3, r3, #0x2
    bl GraphicsResourceSetVariant_Load
    ldr r3, L_021fe124
    ldr r0, L_021fe114
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r5, #0xcc
    sub r2, r3, #0x2
    sub r3, r3, #0x1
    bl GraphicsResourceSetVariant_Load
L_021fdee8:
    mov r0, r4
    add r1, r5, #0xe8
    bl Graphics3DResourceOwner_PrepareResources
    ldr r3, L_021fe128
    ldr r0, L_021fe114
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    sub r2, r3, #0x2
    add r0, r5, #0xf4
    sub r3, r3, #0x1
    bl GraphicsResourceSetVariant_Load
    mov r0, r4
    add r1, r5, #0xf4
    bl Graphics3DResourceOwner_PrepareResources
    mov r0, r4
    bl Graphics3DResourceOwner_CreateManager
    add r1, r5, #0xdc
    str r0, [r5, #0x100]
    bl GraphicsAnimationInstanceManager_CreateInstance
    mov r1, #0x0
    str r1, [sp, #0x0]
    mov r2, #0x7
    str r2, [sp, #0x4]
    mov r2, #0x42
    str r2, [sp, #0x8]
    mov r2, r1
    mov r3, r1
    mov r4, r0
    bl func_ov035_021fdd28
    ldr r1, L_021fe12c
    ldr r3, L_021fe130
    mov r0, #0xa0
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fdf80
    mov r1, r4
    bl func_020955d8
L_021fdf80:
    str r0, [r5, #0x104]
    mov r1, r0
    add r0, r5, #0x10c
    bl PresentationList_Append
    mov r1, #0x0
    ldr r0, [r5, #0x104]
    mov r3, r1
    mov r2, #0x1600
    bl Presentation_SetPosition
    ldr r0, [r5, #0x100]
    add r1, r5, #0xe8
    bl GraphicsAnimationInstanceManager_CreateInstance
    mov r1, #0x0
    str r1, [sp, #0x0]
    mov r2, #0x8
    str r2, [sp, #0x4]
    mov r2, #0x42
    str r2, [sp, #0x8]
    mov r2, r1
    mov r3, r1
    mov r4, r0
    bl func_ov035_021fdd28
    ldr r1, L_021fe12c
    ldr r3, L_021fe130
    mov r0, #0xa0
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fdffc
    mov r1, r4
    bl func_020955d8
L_021fdffc:
    str r0, [r5, #0x108]
    mov r1, r0
    add r0, r5, #0x10c
    bl PresentationList_Append
    mov r1, #0x0
    ldr r0, [r5, #0x108]
    mov r2, r1
    mov r3, r1
    bl Presentation_SetPosition
    ldr r0, [r5, #0x100]
    add r1, r5, #0xcc
    bl GraphicsAnimationInstanceManager_CreateInstance
    mov r4, r0
    ldrh r2, [r4, #0x50]
    mov r1, #0x1
    ldr r3, L_021fe130
    orr r2, r2, #0x44
    strh r2, [r4, #0x50]
    strb r1, [r4, #0x5b]
    ldr r1, L_021fe12c
    mov r0, #0xa0
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fe068
    mov r1, r4
    bl func_020955d8
L_021fe068:
    str r0, [r5, #0xd8]
    mov r1, r0
    add r0, r5, #0x10c
    bl PresentationList_Append
    mov r1, #0x0
    ldr r0, [r5, #0xd8]
    mov r3, r1
    mov r2, #0xc00
    bl Presentation_SetPosition
    ldr r0, [r5, #0xd8]
    ldr r1, L_021fe134
    add r0, r0, #0x6c
    bl PresentationScalar_SetImmediate
    add r0, r5, #0xc
    mov r1, #0x0
    mov r2, #0x1400
    mov r3, #0x2800
    bl func_ov035_021fdd70
    mov r1, #0x0
    add r0, r5, #0xc
    mov r2, r1
    mov r3, r1
    bl func_ov035_021fdd78
    mov r0, #0x0
    str r0, [sp, #0x0]
    ldr r0, L_021fe138
    mov r1, #0x1f
    mov r2, r0
    mov r3, #0x3f
    bl func_020b0300
    ldr r0, L_021fe138
    bl func_02092850
    mov r1, #0x0
    mov r3, #0x1
    add r0, r5, #0x138
    mov r2, r1
    str r3, [sp, #0x0]
    bl func_02091d24
    mov r0, r5
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, pc}
L_021fe10c: .word data_ov035_02203b98
L_021fe110: .word 0x603e
L_021fe114: .word data_020f4e18
L_021fe118: .word 0x6068
L_021fe11c: .word 0x60dd
L_021fe120: .word 0x60e0
L_021fe124: .word 0x60e3
L_021fe128: .word 0x6086
L_021fe12c: .word data_ov035_02203d20
L_021fe130: .word gHeapContext
L_021fe134: .word 0xe66
L_021fe138: .word 0x7fff
.size func_ov035_021fdd88, .-func_ov035_021fdd88

