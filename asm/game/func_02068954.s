.text
; Matching fallback for the portable implementation in src/game/inventory_scene_controller.c.
.extern func_02091fb0

.global func_02068954
func_02068954:
    stmdb sp!, {r3, lr}
    ldr r0, [r0, #0x54]
    mov r1, #0x0
    bl func_02091fb0
    mov r0, #0x1
    ldmia sp!, {r3, pc}
.size func_02068954, . - func_02068954
