.text
; Matching fallback for the portable implementation in src/game/inventory_scroll_controller.c.

.global func_02093d20
func_02093d20:
    stmib r0, {r1, r2}
    ldr r1, [r0, #0x4]
    cmp r2, r1
    strgt r1, [r0, #0x8]
    str r3, [r0, #0x18]
    str r3, [r0, #0x14]
    str r3, [r0, #0x10]
    mov r1, #0x0
    str r3, [r0, #0xc]
    str r1, [r0, #0x20]
    str r1, [r0, #0x1c]
    bx lr
.size func_02093d20, . - func_02093d20
