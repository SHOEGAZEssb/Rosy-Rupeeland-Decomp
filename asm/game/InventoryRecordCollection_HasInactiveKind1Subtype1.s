.text
; Matching fallback for the portable implementation in src/game/inventory_record_sort.c.
.extern ActorDescriptor_IsInactiveKind1Subtype1

.global InventoryRecordCollection_HasInactiveKind1Subtype1
InventoryRecordCollection_HasInactiveKind1Subtype1:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, #0x0
    mov r4, #0x24
    b .L_02065498
.L_0206547c:
    ldr r0, [r6, #0x4]
    mla r0, r5, r4, r0
    bl ActorDescriptor_IsInactiveKind1Subtype1
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, pc}
    add r5, r5, #0x1
.L_02065498:
    ldr r0, [r6, #0xc]
    cmp r5, r0
    blt .L_0206547c
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.size InventoryRecordCollection_HasInactiveKind1Subtype1, . - InventoryRecordCollection_HasInactiveKind1Subtype1
