.text
; Matching fallback for the portable implementation in src/overlays/ov050/overlay050_scene_helpers.c.

.global func_ov050_0220e204
func_ov050_0220e204:
    mov r3, #0x0
.L_0220e208:
    add r2, r0, r3, lsl #0x2
    ldr r2, [r2, #0x1c]
    add r3, r3, #0x1
    str r1, [r2, #0x30]
    cmp r3, #0x4
    blt .L_0220e208
    bx lr
.size func_ov050_0220e204, . - func_ov050_0220e204
