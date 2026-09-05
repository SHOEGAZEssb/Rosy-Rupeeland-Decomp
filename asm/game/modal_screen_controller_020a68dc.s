.text
; Matching fallback for the portable implementation in src/game/modal_screen_controller.c.

.global func_020a68dc
func_020a68dc:
    mov r1, #0x4
    sub r3, r1, #0x1
    mvn r2, #0x0
.L_020a68e8:
    add r1, r0, r3, lsl #0x2
    str r2, [r1, #0x4a8]
    subs r3, r3, #0x1
    bpl .L_020a68e8
    bx lr
.size func_020a68dc, . - func_020a68dc
