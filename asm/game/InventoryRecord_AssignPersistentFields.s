.text
; Matching fallback for the portable implementation in src/game/inventory_record_sort.c.

.global InventoryRecord_AssignPersistentFields
InventoryRecord_AssignPersistentFields:
    ldr r2, [r1, #0x8]
    str r2, [r0, #0x8]
    ldrh r2, [r1, #0x2]
    strh r2, [r0, #0x2]
    ldrh r2, [r1, #0x4]
    strh r2, [r0, #0x4]
    ldrh r2, [r1, #0x6]
    strh r2, [r0, #0x6]
    ldr r2, [r1, #0x20]
    str r2, [r0, #0x20]
    ldrh r2, [r1, #0x0]
    strh r2, [r0, #0x0]
    ldr r1, [r1, #0xc]
    str r1, [r0, #0xc]
    bx lr
.size InventoryRecord_AssignPersistentFields, . - InventoryRecord_AssignPersistentFields
