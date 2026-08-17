.text
; Matching fallback for the portable implementation in src/game/inventory_cell_lifecycle.c.
.extern AnimationResourceState_InitEmbedded

.global InventoryCell_Init
InventoryCell_Init:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl AnimationResourceState_InitEmbedded
    mov r1, #0x0
    str r1, [r4, #0xc]
    str r1, [r4, #0x10]
    str r1, [r4, #0x18]
    str r1, [r4, #0x14]
    mov r0, r4
    str r1, [r4, #0x1c]
    ldmia sp!, {r4, pc}
.size InventoryCell_Init, . - InventoryCell_Init
