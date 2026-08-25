.text

/* Exact fallback; see src/overlays/ov023/overlay023_record_collection.c. */
.extern data_ov023_021ffbd8
.extern data_ov023_021ffbe0
.extern Heap_AllocAlternateEntry
.extern GraphicsSpriteGroupOwner_CreateGroup
.extern TitleCharacterResourceCollection_Init
.extern TitleCharacterResourceCollection_Append
.extern func_02094154
.extern InventoryScroll_SetSpritePriority
.extern InventoryScroll_UpdatePresentation
.extern CxxArray_ConstructWithCookie
.extern func_ov023_021fce00
.extern func_ov023_021fce2c
.extern func_ov023_021fd0dc
.extern gHeapContext
.extern Heap_Alloc


    .global func_ov023_021fce44
func_ov023_021fce44:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0xc
    mov r6, r0
    mov r5, r1
    add r0, r6, #0x8
    mov r4, r2
    bl TitleCharacterResourceCollection_Init
    mov r0, r5
    str r5, [r6, #0x0]
    bl GraphicsSpriteGroupOwner_CreateGroup
    str r0, [r6, #0x4]
    mov r1, #0x28
    str r1, [r0, #0x18]
    mov r1, #0x2d
    str r1, [r0, #0x1c]
    str r4, [r6, #0x30]
    mov ip, #0x0
    str ip, [r6, #0x34]
    ldr r4, [r6, #0x30]
    mov r2, #0x4
    cmp r4, #0x0
    beq L_021fcf2c
    mov r0, #0x18
    mul r0, r4, r0
    ldr r1, L_021fcfb4
    ldr r3, L_021fcfb8
    add r0, r0, #0x8
    bl Heap_AllocAlternateEntry
    cmp r0, #0x0
    beq L_021fcedc
    ldr r1, L_021fcfbc
    ldr ip, L_021fcfc0
    str r1, [sp, #0x0]
    mov r1, r4
    mov r2, #0x18
    mov r3, #0x8
    str ip, [sp, #0x4]
    bl CxxArray_ConstructWithCookie
L_021fcedc:
    ldr r1, L_021fcfc4
    str r0, [r6, #0x2c]
    ldr r3, L_021fcfb8
    mov r0, #0x80
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fcf24
    mov r2, #0xdc
    mov r1, #0x28
    str r2, [sp, #0x0]
    str r1, [sp, #0x4]
    sub r1, r1, #0x2c
    str r1, [sp, #0x8]
    ldr r2, [r6, #0x30]
    mov r1, r5
    mov r3, #0x4
    bl func_02094154
L_021fcf24:
    str r0, [r6, #0x38]
    b L_021fcf74
L_021fcf2c:
    ldr r1, L_021fcfc4
    ldr r3, L_021fcfb8
    mov r0, #0x80
    str ip, [r6, #0x2c]
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fcf70
    mov r1, #0xdc
    mov r4, #0x28
    str r1, [sp, #0x0]
    mov r2, #0x1
    mov r1, r5
    mov r3, r2
    str r4, [sp, #0x4]
    sub r4, r4, #0x2c
    str r4, [sp, #0x8]
    bl func_02094154
L_021fcf70:
    str r0, [r6, #0x38]
L_021fcf74:
    ldr r0, [r6, #0x38]
    mov r1, #0x0
    bl InventoryScroll_SetSpritePriority
    ldr r0, [r6, #0x38]
    bl InventoryScroll_UpdatePresentation
    mov r0, r6
    bl func_ov023_021fd0dc
    ldr r1, L_021fcfc8
    add r0, r6, #0x8
    bl TitleCharacterResourceCollection_Append
    add r0, r6, #0x8
    mov r1, #0x7000
    bl TitleCharacterResourceCollection_Append
    mov r0, r6
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, r5, r6, pc}
L_021fcfb4: .word data_ov023_021ffbd8
L_021fcfb8: .word gHeapContext
L_021fcfbc: .word func_ov023_021fce00
L_021fcfc0: .word func_ov023_021fce2c
L_021fcfc4: .word data_ov023_021ffbe0
L_021fcfc8: .word 0x7007
.size func_ov023_021fce44, .-func_ov023_021fce44

