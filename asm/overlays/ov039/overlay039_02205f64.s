.text
/* Exact fallback; see overlay039_final_update.c for portable C. */
    .extern func_0200500c
    .extern func_02005058
    .global func_ov039_02205f64
func_ov039_02205f64:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x80
    mov r5, r1
    mov r1, #0x0
    mov r4, r2
    add r0, sp, #0x0
    sub r2, r1, #0x3000
    sub r3, r1, #0x1
    bl func_0200500c
    mov r1, #0x7000
    rsb r1, r1, #0x0
    add r0, sp, #0x10
    add r2, r1, #0x2000
    mov r3, r1, asr #0xf
    bl func_0200500c
    mov r1, #0x8000
    rsb r1, r1, #0x0
    add r0, sp, #0x20
    add r2, r1, #0x4000
    mov r3, #0x1
    bl func_0200500c
    mov r1, #0x5000
    rsb r1, r1, #0x0
    add r0, sp, #0x30
    mov r2, r1
    mov r3, #0x1
    bl func_0200500c
    mov r1, #0x0
    add r0, sp, #0x40
    sub r2, r1, #0x5000
    mov r3, #0x1
    bl func_0200500c
    mov r1, #0x7000
    add r0, sp, #0x50
    sub r2, r1, #0xd000
    mov r3, #0x1
    bl func_0200500c
    mov r1, #0x9000
    add r0, sp, #0x60
    sub r2, r1, #0xc000
    mvn r3, #0x0
    bl func_0200500c
    mov r1, #0x8000
    add r0, sp, #0x70
    sub r2, r1, #0xb000
    mvn r3, #0x0
    bl func_0200500c
    add r1, sp, #0x4
    ldr r2, [r1, r5, lsl #0x4]
    add r0, sp, #0x8
    str r2, [r4, #0x4]
    ldr r2, [r0, r5, lsl #0x4]
    add r1, sp, #0xc
    str r2, [r4, #0x8]
    ldr r1, [r1, r5, lsl #0x4]
    add r0, sp, #0x70
    str r1, [r4, #0xc]
    bl func_02005058
    add r0, sp, #0x60
    bl func_02005058
    add r0, sp, #0x50
    bl func_02005058
    add r0, sp, #0x40
    bl func_02005058
    add r0, sp, #0x30
    bl func_02005058
    add r0, sp, #0x20
    bl func_02005058
    add r0, sp, #0x10
    bl func_02005058
    add r0, sp, #0x0
    bl func_02005058
    add sp, sp, #0x80
    ldmia sp!, {r3, r4, r5, pc}
    .size func_ov039_02205f64, .-func_ov039_02205f64

