    .text
    .extern GraphicsSpriteGroup_CreateStateFromSource
    .extern func_02073e48
    .extern Heap_Alloc
    .extern SpritePresentation_Init
    .extern Presentation_SetPosition
    .extern SpritePresentation_SyncPosition
    .extern SpritePresentation_Hide
    .extern func_020befec
    .extern func_020b35b0
    .extern GraphicsSpriteGroup_ReleaseIndexedEntries
    .extern data_ov004_021fcdd0
    .extern gHeapContext
    .extern data_ov004_021fcdd8
    .global func_ov004_021fbf40
func_ov004_021fbf40: ; 0x021fbf40
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x2c
    mov r10, r0
    ldr r0, [r10, #0x64]
    add r1, r10, #0x54
    mov r2, #0x1
    bl GraphicsSpriteGroup_CreateStateFromSource
    mov r2, #0x0
    str r2, [sp, #0x0]
    str r2, [sp, #0x4]
    mov r3, r2
    mov r1, #0x18
    mov r4, r0
    str r2, [sp, #0x8]
    bl func_02073e48
    ldr r1, L_021fc240
    ldr r3, L_021fc244
    mov r0, #0xa0
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fbfa0
    mov r1, r4
    bl SpritePresentation_Init
L_021fbfa0:
    mov r1, #0x78000
    str r0, [r10, #0x68]
    sub r2, r1, #0x98000
    mov r3, #0x0
    bl Presentation_SetPosition
    ldr r0, [r10, #0x68]
    bl SpritePresentation_SyncPosition
    ldr r0, [r10, #0x68]
    bl SpritePresentation_Hide
    ldr r0, [r10, #0x60]
    add r1, r10, #0x54
    mov r2, #0x1
    bl GraphicsSpriteGroup_CreateStateFromSource
    mov r1, #0x0
    str r1, [sp, #0x0]
    str r1, [sp, #0x4]
    str r1, [sp, #0x8]
    mov r1, #0x17
    mov r2, #0x67
    mov r3, #0x41
    bl func_02073e48
    ldr r0, [r10, #0x60]
    add r1, r10, #0x54
    mov r2, #0x1
    bl GraphicsSpriteGroup_CreateStateFromSource
    mov r4, r0
    ldr r0, [r10, #0x150]
    mov r1, #0xa
    bl func_020befec
    mov r1, r0
    mov r2, #0x0
    str r2, [sp, #0x0]
    str r2, [sp, #0x4]
    str r2, [sp, #0x8]
    mov r0, r4
    add r1, r1, #0xd
    mov r2, #0xab
    mov r3, #0x42
    bl func_02073e48
    ldr r0, [r10, #0x60]
    add r1, r10, #0x54
    mov r2, #0x1
    bl GraphicsSpriteGroup_CreateStateFromSource
    mov r4, r0
    ldr r0, [r10, #0x150]
    mov r1, #0xa
    bl func_020befec
    mov r2, #0x0
    str r2, [sp, #0x0]
    str r2, [sp, #0x4]
    str r2, [sp, #0x8]
    mov r0, r4
    add r1, r1, #0xd
    mov r2, #0xc3
    mov r3, #0x42
    bl func_02073e48
    ldr r1, L_021fc248
    ldr r2, [r10, #0x14c]
    add r0, sp, #0xc
    bl func_020b35b0
    mov r7, r0
    mov r0, r7, lsl #0x4
    add r1, r0, #0x64
    cmp r7, #0x4
    ldr r0, [r10, #0x14c]
    addge r1, r1, #0x8
    cmp r0, #0xa
    addlt r1, r1, #0x10
    add r0, r1, r1, lsr #0x1f
    mov r3, r0, asr #0x1
    ldr r0, [r10, #0x60]
    add r1, r10, #0x54
    mov r2, #0x1
    rsb r9, r3, #0xaa
    bl GraphicsSpriteGroup_CreateStateFromSource
    mov r4, #0x0
    str r4, [sp, #0x0]
    str r4, [sp, #0x4]
    mov r2, r9
    mov r1, #0xb
    mov r3, #0x62
    str r4, [sp, #0x8]
    bl func_02073e48
    add r9, r9, #0x32
    mov r8, r4
    mov r11, #0x1
    mov r6, r4
    add r5, sp, #0xc
    b L_021fc178
L_021fc104:
    ldr r0, [r10, #0x60]
    mov r2, r11
    add r1, r10, #0x54
    bl GraphicsSpriteGroup_CreateStateFromSource
    str r6, [sp, #0x0]
    str r6, [sp, #0x4]
    str r6, [sp, #0x8]
    ldrsb r1, [r5, r8]
    mov r2, r9
    mov r3, #0x61
    sub r1, r1, #0x30
    bl func_02073e48
    sub r0, r7, r8
    cmp r0, #0x4
    addne r9, r9, #0x10
    bne L_021fc174
    ldr r0, [r10, #0x60]
    mov r2, #0x1
    add r1, r10, #0x54
    bl GraphicsSpriteGroup_CreateStateFromSource
    str r4, [sp, #0x0]
    str r4, [sp, #0x4]
    mov r1, #0xa
    add r2, r9, #0xc
    mov r3, #0x61
    str r4, [sp, #0x8]
    bl func_02073e48
    add r9, r9, #0x18
L_021fc174:
    add r8, r8, #0x1
L_021fc178:
    cmp r8, r7
    blt L_021fc104
    ldr r0, [r10, #0x14c]
    cmp r0, #0xa
    bge L_021fc1ec
    ldr r0, [r10, #0x60]
    add r1, r10, #0x54
    mov r2, #0x1
    bl GraphicsSpriteGroup_CreateStateFromSource
    mov r1, #0x0
    str r1, [sp, #0x0]
    str r1, [sp, #0x4]
    str r1, [sp, #0x8]
    sub r2, r9, #0x4
    mov r1, #0x19
    mov r3, #0x61
    bl func_02073e48
    ldr r0, [r10, #0x60]
    add r1, r10, #0x54
    mov r2, #0x1
    bl GraphicsSpriteGroup_CreateStateFromSource
    mov r1, #0x0
    str r1, [sp, #0x0]
    str r1, [sp, #0x4]
    str r1, [sp, #0x8]
    add r2, r9, #0x8
    mov r3, #0x61
    bl func_02073e48
    add r9, r9, #0x18
L_021fc1ec:
    ldr r0, [r10, #0x60]
    add r1, r10, #0x54
    mov r2, #0x1
    bl GraphicsSpriteGroup_CreateStateFromSource
    mov r1, #0x0
    str r1, [sp, #0x0]
    str r1, [sp, #0x4]
    mov r2, r9
    str r1, [sp, #0x8]
    mov r1, #0xc
    mov r3, #0x61
    bl func_02073e48
    ldr r0, [r10, #0x60]
    bl GraphicsSpriteGroup_ReleaseIndexedEntries
    mov r1, #0x0
    mov r3, r1
    add r0, r10, #0x6c
    mov r2, #0xc0
    bl Presentation_SetPosition
    add sp, sp, #0x2c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_021fc240: .word data_ov004_021fcdd0
L_021fc244: .word gHeapContext
L_021fc248: .word data_ov004_021fcdd8
    .size func_ov004_021fbf40, .-func_ov004_021fbf40

