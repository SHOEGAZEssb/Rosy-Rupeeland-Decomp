.text
; Matching fallback for the portable implementation in src/game/inventory_record_sort.c.
.extern InventoryRecord_Assign
.extern InventoryRecord_Copy

.global InventoryRecordCollection_SwapRecords
InventoryRecordCollection_SwapRecords:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x24
    mov r4, r2
    mov r5, r0
    cmp r1, r4
    beq .L_02065504
    mov r0, #0x24
    mul r6, r1, r0
    ldr r1, [r5, #0x4]
    add r0, sp, #0x0
    add r1, r1, r6
    bl InventoryRecord_Copy
    mov r0, #0x24
    mul r7, r4, r0
    ldr r1, [r5, #0x4]
    add r0, r1, r6
    add r1, r1, r7
    bl InventoryRecord_Assign
    ldr r0, [r5, #0x4]
    add r1, sp, #0x0
    add r0, r0, r7
    bl InventoryRecord_Assign
.L_02065504:
    add sp, sp, #0x24
    ldmia sp!, {r4, r5, r6, r7, pc}
.size InventoryRecordCollection_SwapRecords, . - InventoryRecordCollection_SwapRecords
