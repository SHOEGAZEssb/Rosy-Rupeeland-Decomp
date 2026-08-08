.text

/* Exact fallback; see src/overlays/ov035/overlay035_render_updates.c for documented portable C. */




    .global func_ov035_021fd25c
func_ov035_021fd25c: 
    ldr r1, [r0, #0x80]
    ldr r0, [r0, #0x7c]
    cmp r1, r0
    movge r0, #0x1
    movlt r0, #0x0
    bx lr
.size func_ov035_021fd25c, .-func_ov035_021fd25c

    .global func_ov035_021fd274

func_ov035_021fd274: 
    mov r1, r1, lsl #0x10
    mov r1, r1, asr #0x10
    str r1, [r0, #0x7c]
    mov r1, #0x0
    str r1, [r0, #0x80]
    bx lr
.size func_ov035_021fd274, .-func_ov035_021fd274

    .global func_ov035_021fd28c

func_ov035_021fd28c: 
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r3, r1, lsl #0x10
    mov r1, r2, lsl #0x10
    ldr r2, L_021fd2b8
    orr r0, r3, r0, lsr #0x10
    str r0, [r2, #0x0]
    mov r0, r1, lsr #0x10
    str r0, [r2, #0x0]
    bx lr
L_021fd2b8: .word 0x400048c
.size func_ov035_021fd28c, .-func_ov035_021fd28c

