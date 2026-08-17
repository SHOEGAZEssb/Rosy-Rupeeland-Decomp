.text
; Matching fallback for the portable implementation in src/game/inventory_scene_controller.c.

.global InventoryViewState_Init
InventoryViewState_Init:
    mov r1, #0x0
    str r1, [r0, #0x8]
    str r1, [r0, #0x4]
    str r1, [r0, #0x0]
    bx lr
.size InventoryViewState_Init, . - InventoryViewState_Init
