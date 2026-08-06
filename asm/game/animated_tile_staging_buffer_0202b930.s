; Matching retail form; see src/game/animated_tile_staging_buffer.c.
.text

    .global func_0202b930
    .type func_0202b930, @function
func_0202b930: ; 0x0202b930
    add r1, r0, #0x1000
    ldr r2, [r1, #0x818]
    tst r2, #0x1
    bxeq lr
    tst r2, #0x2
    bxne lr
    ldr r2, [r1, #0x810]
    cmp r2, #0x0
    bgt .L_0202b9b0
    ldr r2, [r1, #0x80c]
    add r2, r2, #0x1
    str r2, [r1, #0x80c]
    cmp r2, #0x4
    movge r2, #0x0
    strge r2, [r1, #0x80c]
    add r2, r0, #0x1000
    ldr r1, [r2, #0x80c]
    add r1, r0, r1, lsl #0x1
    add r1, r1, #0x1800
    ldrsh r1, [r1, #0x4]
    mov r1, r1, lsl #0x10
    mov r1, r1, asr #0x14
    str r1, [r2, #0x810]
    ldr r1, [r2, #0x80c]
    add r1, r0, r1, lsl #0x1
    add r1, r1, #0x1800
    ldrsh r1, [r1, #0x4]
    mov r1, r1, lsl #0x1c
    mov r1, r1, asr #0x1c
    add r0, r0, r1, lsl #0xb
    str r0, [r2, #0x814]
    bx lr
.L_0202b9b0:
    sub r0, r2, #0x1
    str r0, [r1, #0x810]
    bx lr
    .size func_0202b930, . - func_0202b930
