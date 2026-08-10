    .text
/* Exact fallback; see src/overlays/ov018/overlay018_dialog_runtime.c (constructor). */
    .extern Heap_Alloc
    .extern data_020f4e14
    .extern data_021052fc
    .extern data_ov018_021ffd60
    .extern func_02007f0c
    .extern ActorCollection_FindActorByDescriptorValue
    .extern func_02092cc0
    .extern func_ov018_021fd9f8
    .extern gGameWork
    .extern gHeapContext
    .extern gSystemState
.global func_ov018_021fd90c
func_ov018_021fd90c:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    mov r4, r0
    mov ip, #0x0
    str ip, [r4, #0x420]
    ldr r1, L_021fd9e0
    ldr r3, L_021fd9e4
    mov r0, #0xec
    mov r2, #0x4
    str ip, [r4, #0x41c]
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fd950
    ldr r1, L_021fd9e8
    ldr r2, [r4, #0x70]
    ldr r1, [r1, #0x0]
    bl func_02092cc0
L_021fd950:
    ldr r1, L_021fd9ec
    str r0, [r4, #0x418]
    ldrb r0, [r1, #0x5f]
    mov r2, #0x83
    cmp r0, #0x0
    mov r0, #0x2d
    str r0, [sp, #0x0]
    bne L_021fd984
    ldr r0, [r4, #0x418]
    mov r1, #0x20
    mov r3, #0xc0
    bl func_ov018_021fd9f8
    b L_021fd994
L_021fd984:
    ldr r0, [r4, #0x418]
    mov r1, #0x10
    mov r3, #0xe0
    bl func_ov018_021fd9f8
L_021fd994:
    ldr r2, [r4, #0x418]
    mov r1, #0xc
    mov r0, #0x0
    str r1, [r2, #0xd0]
    str r0, [r2, #0xd4]
    ldr r1, [r4, #0x418]
    sub r2, r0, #0x2
    ldr r0, L_021fd9f0
    str r2, [r1, #0xbc]
    ldr r0, [r0, #0x0]
    mov r1, #0x1
    bl func_02007f0c
    ldr r1, L_021fd9f4
    ldr r1, [r1, #0x0]
    ldr r1, [r1, #0x3f4]
    bl ActorCollection_FindActorByDescriptorValue
    str r0, [r4, #0x18c]
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
L_021fd9e0: .word data_ov018_021ffd60
L_021fd9e4: .word gHeapContext
L_021fd9e8: .word data_020f4e14
L_021fd9ec: .word gSystemState
L_021fd9f0: .word data_021052fc
L_021fd9f4: .word gGameWork
    .size func_ov018_021fd90c, . - func_ov018_021fd90c
