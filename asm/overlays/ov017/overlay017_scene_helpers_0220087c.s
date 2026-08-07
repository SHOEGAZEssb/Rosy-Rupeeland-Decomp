    .text
/* Exact fallback; see src/overlays/ov017/overlay017_scene_helpers.c. */
.global func_ov017_0220087c
func_ov017_0220087c:
    ldr r2, [r0, #0x0]
    cmp r2, #0x0
    beq L_022008a4
    ldr r1, [r0, #0x4]
    cmp r2, r1
    sub r1, r2, #0x1
    streq r1, [r0, #0x0]
    moveq r0, #0x1
    bxeq lr
    str r1, [r0, #0x0]
L_022008a4:
    mov r0, #0x0
    bx lr
    .size func_ov017_0220087c, . - func_ov017_0220087c
