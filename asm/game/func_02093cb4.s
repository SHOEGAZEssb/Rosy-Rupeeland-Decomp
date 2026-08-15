.text
; Matching fallback for the portable implementation in src/game/inventory_scroll_controller.c.
.extern data_020f260c

.global func_02093cb4
func_02093cb4:
    ldr r1, .L_02093d1c
    mov r2, #0x0
    str r1, [r0, #0x0]
    str r2, [r0, #0x20]
    str r2, [r0, #0x1c]
    str r2, [r0, #0x18]
    str r2, [r0, #0x14]
    str r2, [r0, #0x10]
    str r2, [r0, #0xc]
    str r2, [r0, #0x8]
    str r2, [r0, #0x4]
    mov r1, #0x10
    str r1, [r0, #0x24]
    str r2, [r0, #0x28]
    str r2, [r0, #0x30]
    str r2, [r0, #0x2c]
    mov r1, #0x6
    str r1, [r0, #0x34]
    mov r1, #0x4
    str r1, [r0, #0x38]
    str r2, [r0, #0x40]
    str r2, [r0, #0x3c]
    mov r1, #0xc0
    str r1, [r0, #0x44]
    str r2, [r0, #0x48]
    bx lr
.L_02093d1c: .word data_020f260c
.size func_02093cb4, . - func_02093cb4
