.text
; Matching fallback for the portable implementation in src/overlays/ov050/overlay050_scene_helpers.c.

.global func_ov050_0220e224
func_ov050_0220e224:
    mov ip, #0x0
    mov r1, ip
    mov r2, #0x1
    b .L_0220e25c
.L_0220e234:
    add r3, r0, ip, lsl #0x2
    ldr r3, [r3, #0x1c]
    ldr r3, [r3, #0xc]
    cmp r3, #0x0
    moveq r3, r2
    movne r3, r1
    cmp r3, #0x0
    moveq r0, #0x0
    bxeq lr
    add ip, ip, #0x1
.L_0220e25c:
    cmp ip, #0x4
    blt .L_0220e234
    mov r0, #0x1
    bx lr
.size func_ov050_0220e224, . - func_ov050_0220e224
