    .text
/* Exact fallback; see src/overlays/ov022/overlay022_scene_collections.c. */
    .extern data_020d780c
    .extern data_ov022_022006ec
    .extern data_ov022_022006f4
    .extern InventoryScroll_SetSelectedRow
    .extern InventoryScroll_SetFirstVisibleRow
    .extern Overlay022_EntryCollection_Init
    .extern Overlay022_EntryCollection_AppendIndex
    .extern Overlay022_Menu_Init
    .extern Overlay022_Menu_AppendIndex
    .extern GameWork_TestFlag
    .extern gGameWork
    .extern gHeapContext
    .extern Heap_Alloc

.global func_ov022_021fe688
func_ov022_021fe688:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    ldr r1, L_021fe808
    mov r5, #0x0
    ldr r2, [r1, #0x0]
    mov r4, r0
    mov r1, r5
L_021fe6a0:
    add r0, r2, r1
    add r0, r0, #0x5000
    ldrb r0, [r0, #0xe94]
    add r1, r1, #0x1
    cmp r0, #0x1
    addeq r5, r5, #0x1
    cmp r1, #0x80
    blt L_021fe6a0
    cmp r5, #0x0
    beq L_021fe72c
    ldr r1, L_021fe80c
    ldr r3, L_021fe810
    mov r0, #0x44
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fe6ec
    mov r1, r5
    bl Overlay022_EntryCollection_Init
L_021fe6ec:
    ldr r5, L_021fe808
    str r0, [r4, #0x2b4]
    mov r6, #0x0
L_021fe6f8:
    ldr r0, [r5, #0x0]
    add r0, r0, r6
    add r0, r0, #0x5000
    ldrb r0, [r0, #0xe94]
    cmp r0, #0x1
    bne L_021fe71c
    ldr r0, [r4, #0x2b4]
    mov r1, r6
    bl Overlay022_EntryCollection_AppendIndex
L_021fe71c:
    add r6, r6, #0x1
    cmp r6, #0x80
    blt L_021fe6f8
    b L_021fe734
L_021fe72c:
    mov r0, #0x0
    str r0, [r4, #0x2b4]
L_021fe734:
    mov r9, #0x0
    ldr r7, L_021fe814
    ldr r6, L_021fe808
    mov r8, r9
    mov r5, #0x34
L_021fe748:
    mla r0, r8, r5, r7
    ldrh r1, [r0, #0x20]
    ldr r0, [r6, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    add r8, r8, #0x1
    addne r9, r9, #0x1
    cmp r8, #0xb
    blt L_021fe748
    cmp r9, #0x0
    beq L_021fe7fc
    ldr r1, L_021fe818
    ldr r3, L_021fe810
    mov r0, #0x34
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fe798
    mov r1, r9
    bl Overlay022_Menu_Init
L_021fe798:
    str r0, [r4, #0x2b8]
    ldr r0, [r0, #0x30]
    ldr r1, [r4, #0x2c4]
    bl InventoryScroll_SetFirstVisibleRow
    ldr r0, [r4, #0x2b8]
    ldr r1, [r4, #0x2c8]
    ldr r0, [r0, #0x30]
    bl InventoryScroll_SetSelectedRow
    ldr r7, L_021fe814
    ldr r6, L_021fe808
    mov r8, #0x0
    mov r5, #0x34
L_021fe7c8:
    mla r0, r8, r5, r7
    ldrh r1, [r0, #0x20]
    ldr r0, [r6, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    beq L_021fe7ec
    ldr r0, [r4, #0x2b8]
    mov r1, r8
    bl Overlay022_Menu_AppendIndex
L_021fe7ec:
    add r8, r8, #0x1
    cmp r8, #0xb
    blt L_021fe7c8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
L_021fe7fc:
    mov r0, #0x0
    str r0, [r4, #0x2b8]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
L_021fe808: .word gGameWork
L_021fe80c: .word data_ov022_022006ec
L_021fe810: .word gHeapContext
L_021fe814: .word data_020d780c
L_021fe818: .word data_ov022_022006f4
.size func_ov022_021fe688, . - func_ov022_021fe688
