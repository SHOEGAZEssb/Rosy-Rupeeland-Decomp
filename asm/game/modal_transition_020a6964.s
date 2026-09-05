.text
; Matching fallback for the portable implementation in src/game/modal_transition.c.

.global func_020a6964
func_020a6964:
    mov r1, #0x80000
    str r1, [r0, #0x4]
    mov r2, #0x0
    str r2, [r0, #0x8]
    mov r1, #0x1000
    str r1, [r0, #0xc]
    str r2, [r0, #0x14]
    str r2, [r0, #0x18]
    str r1, [r0, #0x1c]
    str r2, [r0, #0x20]
    bx lr
.size func_020a6964, . - func_020a6964
