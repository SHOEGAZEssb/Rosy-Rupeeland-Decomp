    .text
/* Exact fallback; see src/overlays/ov022/overlay022_entry_collection.c. */
    .extern data_ov022_02200674
    .extern data_ov022_022006bc
    .extern Heap_AllocAlternateEntry
    .extern func_02093a34
    .extern IndexedSelectionController_ConfigureRange
    .extern CxxArray_ConstructWithCookie
    .extern Overlay022_CollectionEntry_Init
    .extern gHeapContext

.global Overlay022_EntryCollection_Init
Overlay022_EntryCollection_Init:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x8
    mov r4, r0
    mov r5, r1
    bl func_02093a34
    ldr r1, L_021fd7b4
    mov r0, #0x0
    str r1, [r4, #0x0]
    str r5, [r4, #0x3c]
    str r0, [r4, #0x40]
    ldr r5, [r4, #0x3c]
    cmp r5, #0x0
    beq L_021fd79c
    mov r0, r5, lsl #0x3
    ldr r1, L_021fd7b8
    ldr r3, L_021fd7bc
    add r0, r0, #0x8
    mov r2, #0x4
    bl Heap_AllocAlternateEntry
    cmp r0, #0x0
    beq L_021fd77c
    ldr ip, L_021fd7c0
    mov r2, #0x8
    mov r1, r5
    mov r3, r2
    str ip, [sp, #0x0]
    mov ip, #0x0
    str ip, [sp, #0x4]
    bl CxxArray_ConstructWithCookie
L_021fd77c:
    str r0, [r4, #0x38]
    ldr r2, [r4, #0x3c]
    mov r1, #0x0
    mov r0, r4
    mov r3, r1
    sub r2, r2, #0x1
    bl IndexedSelectionController_ConfigureRange
    b L_021fd7a0
L_021fd79c:
    str r0, [r4, #0x38]
L_021fd7a0:
    mov r1, #0xc
    mov r0, r4
    str r1, [r4, #0x2c]
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, pc}
L_021fd7b4: .word data_ov022_02200674
L_021fd7b8: .word data_ov022_022006bc
L_021fd7bc: .word gHeapContext
L_021fd7c0: .word Overlay022_CollectionEntry_Init
.size Overlay022_EntryCollection_Init, . - Overlay022_EntryCollection_Init
