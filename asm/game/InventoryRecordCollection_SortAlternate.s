.text
; Matching fallback for the portable implementation in src/game/inventory_record_sort.c.
.extern ActorDescriptor_IsInvalid
.extern InventoryRecord_GetSortKey
.extern func_020654ac

.global InventoryRecordCollection_SortAlternate
InventoryRecordCollection_SortAlternate:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    mov r10, r0
    ldr r0, [r10, #0xc]
    cmp r0, #0x1
    ldmleia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    cmp r1, #0x0
    bne .L_020655bc
    mov r7, #0x0
    mov r4, #0x24
    mov r6, r7
    mov r11, #0x1
    mov r5, r4
    b .L_020655a8
.L_02065540:
    ldr r0, [r10, #0x4]
    mla r0, r7, r5, r0
    bl ActorDescriptor_IsInvalid
    cmp r0, #0x0
    beq .L_020655a4
    mov r8, r6
    add r9, r7, #0x1
    b .L_02065590
.L_02065560:
    ldr r0, [r10, #0x4]
    mla r0, r9, r4, r0
    bl ActorDescriptor_IsInvalid
    cmp r0, #0x0
    bne .L_0206558c
    mov r0, r10
    mov r1, r7
    mov r2, r9
    bl func_020654ac
    mov r8, r11
    b .L_0206559c
.L_0206558c:
    add r9, r9, #0x1
.L_02065590:
    ldr r0, [r10, #0xc]
    cmp r9, r0
    blt .L_02065560
.L_0206559c:
    cmp r8, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_020655a4:
    add r7, r7, #0x1
.L_020655a8:
    ldr r0, [r10, #0xc]
    sub r0, r0, #0x1
    cmp r7, r0
    blt .L_02065540
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_020655bc:
    cmp r1, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    mov r7, #0x0
    mov r4, #0x24
    mov r11, r7
    mov r5, r4
    b .L_0206562c
.L_020655d8:
    sub r8, r0, #0x1
    b .L_02065620
.L_020655e0:
    ldr r9, [r10, #0x4]
    mov r1, r11
    mla r0, r8, r4, r9
    bl InventoryRecord_GetSortKey
    sub r1, r8, #0x1
    mov r6, r0
    mla r0, r1, r5, r9
    mov r1, #0x0
    bl InventoryRecord_GetSortKey
    cmp r6, r0
    bhs .L_0206561c
    mov r0, r10
    mov r1, r8
    sub r2, r8, #0x1
    bl func_020654ac
.L_0206561c:
    sub r8, r8, #0x1
.L_02065620:
    cmp r8, r7
    bgt .L_020655e0
    add r7, r7, #0x1
.L_0206562c:
    ldr r0, [r10, #0xc]
    cmp r7, r0
    blt .L_020655d8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.size InventoryRecordCollection_SortAlternate, . - InventoryRecordCollection_SortAlternate
