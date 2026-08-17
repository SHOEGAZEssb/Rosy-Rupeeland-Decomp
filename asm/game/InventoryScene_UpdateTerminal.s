.text
; Matching fallback for the portable implementation in src/game/inventory_scene_controller.c.
.extern SceneInputBase_Update

.global InventoryScene_UpdateTerminal
InventoryScene_UpdateTerminal:
    stmdb sp!, {r3, lr}
    ldr r0, [r0, #0x54]
    mov r1, #0x0
    bl SceneInputBase_Update
    mov r0, #0x1
    ldmia sp!, {r3, pc}
.size InventoryScene_UpdateTerminal, . - InventoryScene_UpdateTerminal
