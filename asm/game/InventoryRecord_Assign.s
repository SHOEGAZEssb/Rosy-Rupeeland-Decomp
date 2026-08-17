.text
; Matching fallback for the portable implementation in src/game/inventory_record_sort.c.
.extern InventoryRecord_AssignPersistentFields

.global InventoryRecord_Assign
InventoryRecord_Assign:
    stmdb sp!, {r4, lr}
    mov r4, r0
    cmp r1, r4
    ldmeqia sp!, {r4, pc}
    bl InventoryRecord_AssignPersistentFields
    mov r0, r4
    ldmia sp!, {r4, pc}
.size InventoryRecord_Assign, . - InventoryRecord_Assign
