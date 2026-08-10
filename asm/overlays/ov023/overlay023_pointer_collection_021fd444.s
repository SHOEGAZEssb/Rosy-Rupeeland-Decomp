.text

/* Exact fallback; see src/overlays/ov023/overlay023_pointer_collection.c. */
.extern data_ov023_021ffbe0
.extern data_ov023_021ffbe8
.extern func_02003e20
.extern func_02071ea4
.extern GraphicsSpriteGroupOwner_CreateGroup
.extern func_02092798
.extern func_02092814
.extern func_02094154
.extern func_02094550
.extern func_02094574
.extern func_020c09cc
.extern func_ov023_021fd438
.extern func_ov023_021fd780
.extern gHeapContext
.extern Heap_Alloc


    .global func_ov023_021fd444
func_ov023_021fd444:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0xc
    mov r5, r0
    add r0, r5, #0x8
    mov r4, r1
    mov r6, r2
    bl func_02071ea4
    add r0, r5, #0x18
    bl func_02092798
    mov r0, r4
    str r4, [r5, #0x0]
    bl GraphicsSpriteGroupOwner_CreateGroup
    str r0, [r5, #0x4]
    str r6, [r5, #0x40]
    mov ip, #0x0
    str ip, [r5, #0x44]
    str ip, [r5, #0x14]
    ldr r6, [r5, #0x40]
    mov r2, #0x4
    cmp r6, #0x0
    beq L_021fd524
    mov r0, r6, lsl #0x2
    ldr r1, L_021fd5b8
    ldr r3, L_021fd5bc
    add r0, r0, #0x8
    bl func_02003e20
    cmp r0, #0x0
    beq L_021fd4d4
    ldr r2, L_021fd5c0
    mov r1, r6
    str r2, [sp, #0x0]
    mov ip, #0x0
    mov r2, #0x4
    mov r3, #0x8
    str ip, [sp, #0x4]
    bl func_020c09cc
L_021fd4d4:
    ldr r1, L_021fd5c4
    str r0, [r5, #0x3c]
    ldr r3, L_021fd5bc
    mov r0, #0x80
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fd51c
    mov r2, #0xdc
    mov r1, #0x3a
    str r2, [sp, #0x0]
    str r1, [sp, #0x4]
    sub r1, r1, #0x50
    str r1, [sp, #0x8]
    ldr r2, [r5, #0x40]
    mov r1, r4
    mov r3, #0x4
    bl func_02094154
L_021fd51c:
    str r0, [r5, #0x48]
    b L_021fd56c
L_021fd524:
    ldr r1, L_021fd5c4
    ldr r3, L_021fd5bc
    mov r0, #0x80
    str ip, [r5, #0x3c]
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fd568
    mov r1, #0xdc
    mov ip, #0x3a
    str r1, [sp, #0x0]
    mov r2, #0x1
    mov r1, r4
    mov r3, r2
    str ip, [sp, #0x4]
    sub r4, ip, #0x50
    str r4, [sp, #0x8]
    bl func_02094154
L_021fd568:
    str r0, [r5, #0x48]
L_021fd56c:
    ldr r0, [r5, #0x48]
    mov r1, #0x0
    bl func_02094550
    ldr r0, [r5, #0x48]
    bl func_02094574
    mov r0, r5
    bl func_ov023_021fd780
    ldr r1, L_021fd5c8
    add r0, r5, #0x18
    bl func_02092814
    add r0, r5, #0x18
    mov r1, #0x7000
    bl func_02092814
    ldr r1, L_021fd5cc
    add r0, r5, #0x18
    bl func_02092814
    mov r0, r5
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, r5, r6, pc}
L_021fd5b8: .word data_ov023_021ffbe8
L_021fd5bc: .word gHeapContext
L_021fd5c0: .word func_ov023_021fd438
L_021fd5c4: .word data_ov023_021ffbe0
L_021fd5c8: .word 0x7007
L_021fd5cc: .word 0x7005
.size func_ov023_021fd444, .-func_ov023_021fd444

