.text
; Matching fallback for the portable implementation in src/game/modal_screen_controller.c.

.global func_020a6810
func_020a6810:
    mov r1, #0x0
    str r1, [r0, #0x4]
    bx lr
.size func_020a6810, . - func_020a6810
