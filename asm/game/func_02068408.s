.text
; Matching fallback for the portable implementation in src/game/inventory_scene_controller.c.

.global func_02068408
func_02068408:
    mov r1, #0x0
    str r1, [r0, #0x8]
    str r1, [r0, #0x4]
    str r1, [r0, #0x0]
    bx lr
.size func_02068408, . - func_02068408
