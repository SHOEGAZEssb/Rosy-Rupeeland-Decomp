.text
; Matching fallback for the portable implementation in src/game/runtime_modal_controller.c.

.global func_0209e338
func_0209e338:
    add r2, r0, #0x80
    cmp r1, r2
    ldrne r2, [r1, #0x4]
    strne r2, [r0, #0x84]
    ldrne r1, [r1, #0x8]
    strne r1, [r0, #0x88]
    mov r1, #0x1
    str r1, [r0, #0x8c]
    bx lr
.size func_0209e338, . - func_0209e338
