.text
; Matching fallback for the portable implementation in src/game/inventory_scene_controller.c.

.global InventoryScene_UpdateChild
InventoryScene_UpdateChild:
    stmdb sp!, {r3, lr}
    ldr r1, [r0, #0x20]
    mov r1, r1, lsl #0x15
    movs r1, r1, asr #0x1f
    ldrne r0, [r0, #0x54]
    cmpne r0, #0x0
    beq .L_02068994
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
.L_02068994:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.size InventoryScene_UpdateChild, . - InventoryScene_UpdateChild
