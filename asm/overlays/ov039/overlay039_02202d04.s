.text
/* Exact fallback; see overlay039_script_render.c for portable C. */
    .extern Sound_Play
    .extern Sound_StopEffect
    .extern gSoundContext
    .global func_ov039_02202d04
func_ov039_02202d04:
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x1000
    ldr r1, [r0, #0xcd8]
    cmp r1, #0x0
    addeq r1, r1, #0x1
    streq r1, [r0, #0xcd8]
    moveq r1, #0x0
    streq r1, [r0, #0xcc0]
    ldmeqia sp!, {r4, pc}
    cmp r1, #0x1
    bne L_02202d78
    ldr r1, [r0, #0xcc0]
    add r1, r1, #0x1
    str r1, [r0, #0xcc0]
    cmp r1, #0x3c
    ldmleia sp!, {r4, pc}
    ldr r0, L_02202f2c
    ldr r1, L_02202f30
    ldr r0, [r0, #0x0]
    mov r2, #0x7
    bl Sound_Play
    add r0, r4, #0x1000
    mov r1, #0x0
    str r1, [r0, #0xcc0]
    ldr r1, [r0, #0xcd8]
    add r1, r1, #0x1
    str r1, [r0, #0xcd8]
    ldmia sp!, {r4, pc}
L_02202d78:
    cmp r1, #0x2
    bne L_02202dc4
    ldr r1, [r0, #0xcc0]
    add r1, r1, #0x1
    str r1, [r0, #0xcc0]
    cmp r1, #0x3c
    ldmleia sp!, {r4, pc}
    ldr r0, L_02202f2c
    ldr r1, L_02202f30
    ldr r0, [r0, #0x0]
    mov r2, #0x2
    bl Sound_Play
    add r0, r4, #0x1000
    mov r1, #0x0
    str r1, [r0, #0xcc0]
    ldr r1, [r0, #0xcd8]
    add r1, r1, #0x1
    str r1, [r0, #0xcd8]
    ldmia sp!, {r4, pc}
L_02202dc4:
    cmp r1, #0x3
    bne L_02202ef4
    ldr r1, [r0, #0xcc0]
    cmp r1, #0x0
    bne L_02202e18
    ldr r1, [r4, #0x48]
    ldr r2, [r4, #0x30]
    ldr r1, [r1, #0x8]
    ldr r1, [r1, #0x48]
    ldr r1, [r1, #0x30]
    cmp r2, r1
    mvnlt r1, #0x0
    movge r1, #0x1
    str r1, [r0, #0xcd0]
    add r1, r4, #0x1000
    mov r0, #0x0
    str r0, [r1, #0xcd4]
    ldr r0, [r1, #0xccc]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [r1, #0xccc]
L_02202e18:
    add r0, r4, #0x1000
    ldr r1, [r0, #0xcc0]
    add r1, r1, #0x1
    str r1, [r0, #0xcc0]
    cmp r1, #0x1e
    ldmleia sp!, {r4, pc}
    sub ip, r1, #0x1e
    add r1, r4, #0x1000
    cmp ip, #0x50
    ldr r3, [r1, #0xccc]
    ldr r2, [r1, #0xcd0]
    movgt ip, #0x50
    mla r2, ip, r2, r3
    str r2, [r1, #0xccc]
    ldr r2, [r1, #0xcd0]
    add r0, r4, #0xcc
    add r3, r0, #0x1c00
    cmp r2, #0x0
    ldr r0, [r1, #0xccc]
    ble L_02202e90
    cmp r0, #0x10000
    blt L_02202eb4
    ldr r0, [r3, #0x0]
    cmp ip, #0x50
    sub r0, r0, #0x10000
    str r0, [r3, #0x0]
    ldrge r0, [r1, #0xcd4]
    addge r0, r0, #0x1
    strge r0, [r1, #0xcd4]
    b L_02202eb4
L_02202e90:
    cmp r0, #0x0
    bge L_02202eb4
    ldr r0, [r3, #0x0]
    cmp ip, #0x50
    add r0, r0, #0x10000
    str r0, [r3, #0x0]
    ldrge r0, [r1, #0xcd4]
    addge r0, r0, #0x1
    strge r0, [r1, #0xcd4]
L_02202eb4:
    add r0, r4, #0x1000
    ldr r0, [r0, #0xcd4]
    cmp r0, #0x1
    ldmleia sp!, {r4, pc}
    ldr r0, L_02202f2c
    ldr r1, L_02202f30
    ldr r0, [r0, #0x0]
    mov r2, #0x2
    bl Sound_StopEffect
    add r0, r4, #0x1000
    mov r1, #0x50
    str r1, [r0, #0xcc0]
    ldr r1, [r0, #0xcd8]
    add r1, r1, #0x1
    str r1, [r0, #0xcd8]
    ldmia sp!, {r4, pc}
L_02202ef4:
    cmp r1, #0x4
    ldmneia sp!, {r4, pc}
    ldr r3, [r0, #0xccc]
    ldr r2, [r0, #0xcc0]
    ldr r1, [r0, #0xcd0]
    mla r1, r2, r1, r3
    str r1, [r0, #0xccc]
    ldr r1, [r0, #0xcc0]
    subs r1, r1, #0x2
    str r1, [r0, #0xcc0]
    movmi r1, #0x0
    strmi r1, [r0, #0xcd8]
    strmi r1, [r0, #0xcc4]
    ldmia sp!, {r4, pc}
L_02202f2c: .word gSoundContext
L_02202f30: .word 0x1c5
    .size func_ov039_02202d04, .-func_ov039_02202d04

