.text

/* Exact fallback; see src/overlays/ov035/overlay035_render_updates.c for documented portable C. */




    .global func_ov035_021fd19c
func_ov035_021fd19c: 
    ldr r2, [r1, #0x0]
    cmp r2, #0x0
    beq L_021fd1bc
    cmp r2, #0x1
    beq L_021fd1cc
    cmp r2, #0x2
    beq L_021fd1f0
    b L_021fd210
L_021fd1bc:
    ldr r1, [r1, #0x4]
    str r1, [r0, #0xa0]
    mov r0, #0x2
    bx lr
L_021fd1cc:
    ldr r2, [r1, #0x4]
    str r2, [r0, #0xb0]
    ldr r1, [r1, #0x8]
    str r1, [r0, #0xb4]
    ldrh r1, [r0, #0x98]
    orr r1, r1, #0x8
    strh r1, [r0, #0x98]
    mov r0, #0x3
    bx lr
L_021fd1f0:
    ldr r1, [r1, #0x4]
    cmp r1, #0x0
    ldrh r1, [r0, #0x98]
    bicne r1, r1, #0x1
    orreq r1, r1, #0x1
    strh r1, [r0, #0x98]
    mov r0, #0x2
    bx lr
L_021fd210:
    mov r0, #0x1
    bx lr
.size func_ov035_021fd19c, .-func_ov035_021fd19c

