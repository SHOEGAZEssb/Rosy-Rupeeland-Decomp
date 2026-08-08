.text

/* Exact fallback; see src/overlays/ov035/overlay035_render_object.c for documented portable C. */




    .global func_ov035_021fd128
func_ov035_021fd128: 
    orr r0, r0, r1, lsl #0x4
    ldr r1, [sp, #0x4]
    orr r0, r0, r2, lsl #0x6
    orr r0, r1, r0
    ldr r2, [sp, #0x0]
    orr r1, r0, r3, lsl #0x18
    ldr r0, L_021fd150
    orr r1, r1, r2, lsl #0x10
    str r1, [r0, #0x0]
    bx lr
L_021fd150: .word 0x40004a4
.size func_ov035_021fd128, .-func_ov035_021fd128

    .global func_ov035_021fd154

func_ov035_021fd154: 
    cmp r2, #0x0
    movne r2, #0x1
    orr r1, r0, r1, lsl #0x10
    moveq r2, #0x0
    ldr r0, L_021fd174
    orr r1, r1, r2, lsl #0xf
    str r1, [r0, #0x0]
    bx lr
L_021fd174: .word 0x40004c0
.size func_ov035_021fd154, .-func_ov035_021fd154

    .global func_ov035_021fd178

func_ov035_021fd178: 
    cmp r2, #0x0
    movne r2, #0x1
    orr r1, r0, r1, lsl #0x10
    moveq r2, #0x0
    ldr r0, L_021fd198
    orr r1, r1, r2, lsl #0xf
    str r1, [r0, #0x0]
    bx lr
L_021fd198: .word 0x40004c4
.size func_ov035_021fd178, .-func_ov035_021fd178

