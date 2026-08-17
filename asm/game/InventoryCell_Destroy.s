.text
; Matching fallback for the portable implementation in src/game/inventory_cell_lifecycle.c.
.extern AnimationResourceState_Destroy

.global InventoryCell_Destroy
InventoryCell_Destroy:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl AnimationResourceState_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}
.size InventoryCell_Destroy, . - InventoryCell_Destroy
