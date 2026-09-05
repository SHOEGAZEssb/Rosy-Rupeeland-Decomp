.text
; Matching fallback for the portable implementation in src/game/runtime_modal_controller.c.
.extern func_ov039_022076d0

.global func_0209e35c
func_0209e35c:
    stmdb sp!, {r3, lr}
    mov r1, r0
    ldr r0, [r1, #0x8c]
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    ldr r0, [r1, #0x8]
    add r1, r1, #0x80
    bl func_ov039_022076d0
    ldmia sp!, {r3, pc}
.size func_0209e35c, . - func_0209e35c
