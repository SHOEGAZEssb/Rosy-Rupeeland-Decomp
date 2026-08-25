    .text
/* Exact fallback; see src/overlays/ov021/overlay021_scene_widgets.c. */
    .extern Heap_Alloc
    .extern data_020f4e14
    .extern data_021f5128
    .extern data_ov021_02202f98
    .extern RecordSelection_HasAvailableEntry
    .extern InventoryScroll_SetSelectedRow
    .extern InventoryScroll_SetFirstVisibleRow
    .extern Overlay021_List_Init
    .extern Overlay021_List_AppendRow
    .extern Overlay021List_SyncFirstVisibleRow
    .extern gHeapContext

.global func_ov021_021fe520
func_ov021_021fe520:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    ldr r1, L_021fe62c
    mov r10, r0
    ldr r1, [r1, #0x0]
    ldr r0, [r10, #0x54]
    mov r8, #0x0
    ldr r7, [r1, r0, lsl #0x2]
L_021fe53c:
    mov r0, r7
    mov r1, r8
    bl RecordSelection_HasAvailableEntry
    cmp r0, #0x0
    beq L_021fe610
    cmp r8, #0x2
    ldreq r1, [r7, #0xc]
    ldreq r0, [r7, #0x8]
    ldr r3, L_021fe630
    addeq r9, r1, r0
    addne r0, r7, r8, lsl #0x2
    ldrne r9, [r0, #0x8]
    ldr r1, L_021fe634
    mov r0, #0xa4
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fe598
    ldr r1, L_021fe638
    mov r2, r9
    ldr r1, [r1, #0x0]
    mov r3, r8
    bl Overlay021_List_Init
L_021fe598:
    add r1, r10, r8, lsl #0x2
    str r0, [r1, #0x2a4]
    ldr r0, [r0, #0x58]
    ldr r1, [r1, #0x2ac]
    bl InventoryScroll_SetFirstVisibleRow
    add r1, r10, r8, lsl #0x2
    ldr r0, [r1, #0x2a4]
    ldr r1, [r1, #0x2b4]
    ldr r0, [r0, #0x58]
    bl InventoryScroll_SetSelectedRow
    mov r6, #0x0
    add r5, r10, r8, lsl #0x2
    add r4, r7, r8, lsl #0x2
    mov r11, r6
    b L_021fe5f8
L_021fe5d4:
    ldr r1, [r4, #0x18]
    ldr r0, [r5, #0x2a4]
    add r1, r1, r6, lsl #0x4
    bl Overlay021_List_AppendRow
    mov r1, #0x18
    mul r1, r6, r1
    strh r11, [r0, #0x8]
    strh r1, [r0, #0xa]
    add r6, r6, #0x1
L_021fe5f8:
    cmp r6, r9
    blt L_021fe5d4
    add r0, r10, r8, lsl #0x2
    ldr r0, [r0, #0x2a4]
    bl Overlay021List_SyncFirstVisibleRow
    b L_021fe61c
L_021fe610:
    add r0, r10, r8, lsl #0x2
    mov r1, #0x0
    str r1, [r0, #0x2a4]
L_021fe61c:
    add r8, r8, #0x1
    cmp r8, #0x2
    blt L_021fe53c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_021fe62c: .word data_021f5128
L_021fe630: .word gHeapContext
L_021fe634: .word data_ov021_02202f98
L_021fe638: .word data_020f4e14
    .size func_ov021_021fe520, . - func_ov021_021fe520

