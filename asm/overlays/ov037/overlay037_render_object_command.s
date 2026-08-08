.text

/* Exact fallback; see src/overlays/ov037/overlay037_render_object_state.c for documented portable C. */

    .global func_ov037_021fd11c
func_ov037_021fd11c:
    ldr r2, [r1, #0x0]
    cmp r2, #0x0
    beq L_021fd134
    cmp r2, #0x1
    beq L_021fd144
    b L_021fd168
L_021fd134:
    ldr r1, [r1, #0x4]
    str r1, [r0, #0xa0]
    mov r0, #0x2
    bx lr
L_021fd144:
    ldr r2, [r1, #0x4]
    str r2, [r0, #0xb0]
    ldr r1, [r1, #0x8]
    str r1, [r0, #0xb4]
    ldrh r1, [r0, #0x98]
    orr r1, r1, #0x8
    strh r1, [r0, #0x98]
    mov r0, #0x3
    bx lr
L_021fd168:
    mov r0, #0x1
    bx lr
    .size func_ov037_021fd11c, .-func_ov037_021fd11c
