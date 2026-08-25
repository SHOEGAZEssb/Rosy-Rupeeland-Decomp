    .text

/* Exact fallback; see src/overlays/ov016/overlay016_scene_auxiliary.c. */
    .extern Heap_Alloc
    .extern data_020f4e14
    .extern data_ov016_02201598
    .extern data_ov016_022015a0
    .extern data_ov016_022015a8
    .extern InventoryRecord_GetMetadata
    .extern func_ov000_021fb728
    .extern Overlay000_Grid_Init
    .extern func_ov000_021fc59c
    .extern func_ov000_021fcab4
    .extern func_ov000_021fcae8
    .extern Overlay000_GetViewRecordFromIndex
    .extern Overlay016_ActorGroup_Init
    .extern func_ov016_021ff6e8
    .extern func_ov016_021ff700
    .extern gDebugFont
    .extern gHeapContext
.global Overlay016_PopulateAuxiliaryList
Overlay016_PopulateAuxiliaryList:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    ldr r1, L_021ff6d0
    mov r8, r0
    ldr r3, L_021ff6d4
    mov r0, #0x68
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021ff540
    ldr r1, L_021ff6d8
    ldr r1, [r1, #0x0]
    bl func_ov000_021fb728
L_021ff540:
    ldr r1, L_021ff6dc
    str r0, [r8, #0x450]
    ldr r3, L_021ff6d4
    mov r0, #0xe8
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021ff568
    ldr r1, [r8, #0x58]
    bl Overlay016_ActorGroup_Init
L_021ff568:
    ldr r1, L_021ff6e0
    str r0, [r8, #0x470]
    mov r4, #0x0
    ldr r3, L_021ff6d4
    mov r0, #0x2b0
    mov r2, #0x4
    str r4, [r8, #0x46c]
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021ff59c
    ldr r1, L_021ff6e4
    ldr r1, [r1, #0x0]
    bl Overlay000_Grid_Init
L_021ff59c:
    str r0, [r8, #0x44c]
    mov r4, #0x1
    mov r5, #0x0
    b L_021ff6a4
L_021ff5ac:
    mov r1, r5
    bl func_ov000_021fcab4
    mov r6, r0
    ldr r7, [r6, #0xc]
    cmp r7, #0x0
    beq L_021ff6a0
    ldr r1, [r8, #0x468]
    cmp r1, #0x0
    beq L_021ff644
    mov r1, #0x1
    bl func_ov016_021ff6e8
    ldr r0, [r8, #0x468]
    mov r3, #0x0
    ldr lr, [r0, #0x0]
    mov r0, #0x24
    ldr ip, [lr, #0x100]
    b L_021ff638
L_021ff5f0:
    mla r1, r3, r0, lr
    ldrh r2, [r1, #0x28]
    ldrh r1, [r7, #0x0]
    cmp r2, r1
    bne L_021ff634
    mov r0, r6
    mov r1, #0x1
    bl func_ov016_021ff700
    cmp r4, #0x0
    beq L_021ff6a0
    add r1, r8, #0x54
    ldr r0, [r8, #0x44c]
    mov r2, r5
    add r1, r1, #0x400
    mov r4, #0x0
    bl Overlay000_GetViewRecordFromIndex
    b L_021ff6a0
L_021ff634:
    add r3, r3, #0x1
L_021ff638:
    cmp r3, ip
    blt L_021ff5f0
    b L_021ff6a0
L_021ff644:
    mov r0, r7
    bl InventoryRecord_GetMetadata
    ldrb r0, [r0, #0x2]
    cmp r0, #0x0
    bne L_021ff694
    ldr r1, [r8, #0x46c]
    mov r0, r6
    add r2, r1, #0x1
    mov r1, #0x1
    str r2, [r8, #0x46c]
    bl func_ov016_021ff700
    cmp r4, #0x0
    beq L_021ff6a0
    add r1, r8, #0x54
    ldr r0, [r8, #0x44c]
    mov r2, r5
    add r1, r1, #0x400
    mov r4, #0x0
    bl Overlay000_GetViewRecordFromIndex
    b L_021ff6a0
L_021ff694:
    mov r0, r6
    mov r1, #0x1
    bl func_ov016_021ff6e8
L_021ff6a0:
    add r5, r5, #0x1
L_021ff6a4:
    ldr r0, [r8, #0x44c]
    ldr r1, [r0, #0x254]
    cmp r5, r1
    blt L_021ff5ac
    add r1, r8, #0x54
    add r1, r1, #0x400
    mov r2, #0x18
    bl func_ov000_021fcae8
    ldr r0, [r8, #0x44c]
    bl func_ov000_021fc59c
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
L_021ff6d0: .word data_ov016_02201598
L_021ff6d4: .word gHeapContext
L_021ff6d8: .word gDebugFont
L_021ff6dc: .word data_ov016_022015a0
L_021ff6e0: .word data_ov016_022015a8
L_021ff6e4: .word data_020f4e14
    .size Overlay016_PopulateAuxiliaryList, . - Overlay016_PopulateAuxiliaryList

