.text
; Matching fallback for the portable implementation in src/game/inventory_scene_controller.c.

.global func_02068938
func_02068938:
    ldr r2, [r1, #0x0]
    str r2, [r0, #0x0]
    ldr r2, [r1, #0x4]
    str r2, [r0, #0x4]
    ldr r1, [r1, #0x8]
    str r1, [r0, #0x8]
    bx lr
.size func_02068938, . - func_02068938
