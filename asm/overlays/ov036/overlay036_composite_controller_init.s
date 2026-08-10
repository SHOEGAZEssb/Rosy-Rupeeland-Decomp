.text

/* Exact fallback; see src/overlays/ov036/overlay036_composite_controller_init.c for documented portable C. */

    .extern func_ov036_021fce00
    .extern func_020720c0
    .extern func_ov036_021fe218
    .extern func_02091b6c
    .extern func_02091d08
    .extern Graphics3DLightSet_Init
    .extern func_020720e8
    .extern Graphics3DResourceOwner_PrepareResources
    .extern func_02071adc
    .extern Graphics3DResourceOwner_CreateManager
    .extern func_ov036_021fe9fc
    .extern func_ov036_021fea04
    .extern func_ov036_0220213c
    .extern GraphicsAnimationInstanceManager_CreateInstance
    .extern func_ov036_021ff050
    .extern Heap_Alloc
    .extern func_020955d8
    .extern func_02095274
    .extern func_020948d4
    .extern func_ov036_021fcf34
    .extern func_ov036_021fdbf4
    .extern func_02091b98
    .extern func_02091d24
    .extern data_ov036_02205f9c
    .extern data_020f4e18
    .extern data_ov036_02206160
    .extern gHeapContext
    .extern data_ov036_02206168
    .extern data_ov036_02206190

    .global func_ov036_022029d8
func_ov036_022029d8:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x10
    mov r4, r1
    mov r1, r2
    mov r5, r0
    bl func_ov036_021fce00
    ldr r1, L_02202e24
    add r0, r5, #0xdc
    str r1, [r5, #0x0]
    bl func_020720c0
    add r0, r5, #0xe8
    bl func_020720c0
    add r0, r5, #0x100
    bl func_ov036_021fe218
    add r0, r5, #0x110
    bl func_ov036_021fe218
    add r0, r5, #0x120
    bl func_02091b6c
    add r0, r5, #0x13c
    bl func_02091d08
    add r0, r5, #0x160
    bl Graphics3DLightSet_Init
    ldr r3, L_02202e28
    add r0, r5, #0xdc
    str r3, [sp, #0x0]
    ldr r1, L_02202e2c
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    sub r3, r3, #0x1
    bl func_020720e8
    mov r0, r4
    add r1, r5, #0xdc
    bl Graphics3DResourceOwner_PrepareResources
    ldr r0, [r5, #0x4]
    cmp r0, #0x65
    beq L_02202a78
    cmp r0, #0x68
    beq L_02202abc
    cmp r0, #0x6b
    beq L_02202b00
L_02202a78:
    ldr r3, L_02202e30
    ldr r0, L_02202e2c
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r5, #0xe8
    sub r2, r3, #0x2
    sub r3, r3, #0x1
    bl func_020720e8
    ldr r3, L_02202e34
    ldr r0, L_02202e2c
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r5, #0xcc
    sub r2, r3, #0x2
    sub r3, r3, #0x1
    bl func_020720e8
    b L_02202b40
L_02202abc:
    ldr r3, L_02202e30
    ldr r0, L_02202e2c
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r5, #0xe8
    sub r2, r3, #0x2
    add r3, r3, #0x1
    bl func_020720e8
    ldr r3, L_02202e38
    ldr r0, L_02202e2c
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r5, #0xcc
    sub r2, r3, #0x2
    sub r3, r3, #0x1
    bl func_020720e8
    b L_02202b40
L_02202b00:
    ldr r3, L_02202e30
    ldr r0, L_02202e2c
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r5, #0xe8
    sub r2, r3, #0x2
    add r3, r3, #0x2
    bl func_020720e8
    ldr r3, L_02202e3c
    ldr r0, L_02202e2c
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r5, #0xcc
    sub r2, r3, #0x2
    sub r3, r3, #0x1
    bl func_020720e8
L_02202b40:
    mov r0, r4
    add r1, r5, #0xe8
    bl Graphics3DResourceOwner_PrepareResources
    mov r0, r4
    add r1, r5, #0xcc
    bl Graphics3DResourceOwner_PrepareResources
    ldr r0, L_02202e2c
    ldr r1, L_02202e40
    ldr r0, [r0, #0x0]
    bl func_02071adc
    str r0, [r5, #0x15c]
    mov r0, r4
    bl Graphics3DResourceOwner_CreateManager
    str r0, [r5, #0xf4]
    add r0, r5, #0xc
    mov r1, #0x0
    mov r2, r1
    mov r3, #0x2800
    bl func_ov036_021fe9fc
    add r0, r5, #0xc
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    bl func_ov036_021fea04
    mov r3, #0x1000
    rsb r3, r3, #0x0
    str r3, [sp, #0x0]
    mov r0, #0x1f
    str r0, [sp, #0x4]
    str r0, [sp, #0x8]
    str r0, [sp, #0xc]
    add r0, r5, #0x160
    mov r1, #0x0
    mov r2, #0x800
    bl func_ov036_0220213c
    ldr r0, [r5, #0xf4]
    add r1, r5, #0xdc
    bl GraphicsAnimationInstanceManager_CreateInstance
    mov r4, r0
    mov r2, #0x0
    str r2, [sp, #0x0]
    mov r1, #0x2
    str r1, [sp, #0x4]
    mov r3, #0x46
    str r3, [sp, #0x8]
    mov r3, r2
    bl func_ov036_021ff050
    mov r0, #0xa0
    ldr r1, L_02202e44
    mov r2, #0x4
    ldr r3, L_02202e48
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_02202c20
    mov r1, r4
    bl func_020955d8
L_02202c20:
    str r0, [r5, #0xf8]
    mov r1, r0
    add r0, r5, #0x100
    bl func_02095274
    ldr r0, [r5, #0xf8]
    mov r1, #0x2000
    add r0, r0, #0x6c
    bl func_020948d4
    ldr r0, [r5, #0xf4]
    add r1, r5, #0xe8
    bl GraphicsAnimationInstanceManager_CreateInstance
    mov r1, #0x0
    str r1, [sp, #0x0]
    mov r2, #0xb
    str r2, [sp, #0x4]
    mov r2, #0x45
    str r2, [sp, #0x8]
    mov r2, r1
    mov r3, r1
    mov r4, r0
    bl func_ov036_021ff050
    ldr r1, L_02202e44
    ldr r3, L_02202e48
    mov r0, #0xa0
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_02202c98
    mov r1, r4
    bl func_020955d8
L_02202c98:
    str r0, [r5, #0xfc]
    mov r1, r0
    add r0, r5, #0x100
    bl func_02095274
    ldr r0, [r5, #0xf4]
    add r1, r5, #0xcc
    bl GraphicsAnimationInstanceManager_CreateInstance
    mov r4, r0
    ldrh r0, [r4, #0x50]
    ldr r1, L_02202e44
    ldr r3, L_02202e48
    orr r0, r0, #0x44
    strh r0, [r4, #0x50]
    mov r0, #0xa0
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_02202ce8
    mov r1, r4
    bl func_020955d8
L_02202ce8:
    str r0, [r5, #0xd8]
    mov r1, r0
    add r0, r5, #0x100
    bl func_02095274
    ldr r1, L_02202e4c
    ldr r3, L_02202e48
    mov r0, #0xc4
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_02202d24
    ldr r1, [r5, #0x15c]
    mov r2, #0x0
    mov r3, #0xc
    bl func_ov036_021fcf34
L_02202d24:
    str r0, [r5, #0x154]
    mov r1, r0
    add r0, r5, #0x100
    bl func_02095274
    ldr r0, [r5, #0x154]
    ldr r2, L_02202e50
    ldr r1, L_02202e4c
    strh r2, [r0, #0xbc]
    ldr r0, [r5, #0x154]
    ldr r3, L_02202e48
    strh r2, [r0, #0xc0]
    ldr lr, [r5, #0x154]
    mov ip, #0x1
    ldrh r4, [lr, #0x98]
    mov r0, #0xc4
    mov r2, #0x4
    orr r4, r4, #0x1
    strh r4, [lr, #0x98]
    ldr r4, [r5, #0x154]
    str ip, [r4, #0xa4]
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_02202d90
    ldr r1, [r5, #0x15c]
    mov r2, #0x1
    mov r3, #0xc
    bl func_ov036_021fcf34
L_02202d90:
    str r0, [r5, #0x158]
    mov r1, r0
    add r0, r5, #0x100
    bl func_02095274
    ldr r0, [r5, #0x158]
    mov r1, #0x218
    strh r1, [r0, #0xbc]
    ldr r2, [r5, #0x158]
    ldr r1, L_02202e54
    ldrh r0, [r2, #0x98]
    ldr r3, L_02202e48
    mov ip, #0x1
    orr r0, r0, #0x1
    strh r0, [r2, #0x98]
    ldr r4, [r5, #0x158]
    mov r0, #0x18
    mov r2, #0x4
    str ip, [r4, #0xa4]
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_02202dec
    mov r1, #0x20
    bl func_ov036_021fdbf4
L_02202dec:
    str r0, [r5, #0x1a0]
    add r0, r5, #0x120
    mov r1, #0x1e
    bl func_02091b98
    mov r1, #0x0
    mov r4, #0x1
    mov r2, r1
    add r0, r5, #0x13c
    mov r3, #0x2
    str r4, [sp, #0x0]
    bl func_02091d24
    mov r0, r5
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, pc}
L_02202e24: .word data_ov036_02205f9c
L_02202e28: .word 0x6005
L_02202e2c: .word data_020f4e18
L_02202e30: .word 0x6077
L_02202e34: .word 0x60d4
L_02202e38: .word 0x60d7
L_02202e3c: .word 0x60da
L_02202e40: .word 0x5003
L_02202e44: .word data_ov036_02206160
L_02202e48: .word gHeapContext
L_02202e4c: .word data_ov036_02206168
L_02202e50: .word 0x6318
L_02202e54: .word data_ov036_02206190
    .size func_ov036_022029d8, .-func_ov036_022029d8

