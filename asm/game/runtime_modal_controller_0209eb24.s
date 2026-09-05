.text
.extern VecFx32Object_InitCopy
; Matching fallback for the portable implementation in src/game/runtime_modal_controller.c.

.global func_0209eb24
func_0209eb24:
    ldr ip, .L_0209eb30
    add r1, r1, #0x2c
    bx ip
.L_0209eb30: .word VecFx32Object_InitCopy
.size func_0209eb24, . - func_0209eb24
