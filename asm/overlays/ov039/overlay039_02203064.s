.text
/* Exact fallback; see overlay039_script_render.c for portable C. */
    .extern func_0201e0ec
    .extern func_0209c3b4
    .extern VecFx32Object_InitComponents
    .extern func_ov039_022014f8
    .extern func_020befec
    .extern func_ov039_0220346c
    .extern func_0209c430
    .extern VecFx32Object_Destroy
    .extern data_021052fc
    .global func_ov039_02203064
func_ov039_02203064:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, lr}
    sub sp, sp, #0xf4
    ldr r1, L_02203460
    mov r5, r0
    ldr r0, [r1, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl func_0201e0ec
    mov r4, r0
    bl func_0209c3b4
    mvn ip, #0xf
    ldr r2, L_02203464
    add r0, sp, #0x9c
    mov r9, #0x10
    add r7, sp, #0xac
    mov r10, #0x15
    add r8, sp, #0xbc
    add r3, sp, #0xcc
    mov r1, #0x24
    str r1, [r3, #0x4]
    add r6, sp, #0xdc
    mov lr, #0x29
    str r9, [r3, #0x0]
    str r9, [r0, #0x0]
    str r2, [r0, #0x4]
    add r0, sp, #0xc4
    str ip, [sp, #0x94]
    str ip, [r0, #0x0]
    str r10, [r7, #0x0]
    str r2, [r7, #0x4]
    mov r7, #0x14
    str r2, [r8, #0x4]
    add r2, sp, #0xa4
    add ip, sp, #0xb4
    str r7, [sp, #0x98]
    str r7, [r2, #0x4]
    str r7, [ip, #0x4]
    sub r7, r9, #0x25
    str r7, [r2, #0x0]
    add r2, sp, #0xd4
    sub r1, r1, #0x25
    sub r9, r10, #0x2d
    str r7, [r2, #0x0]
    str r1, [r2, #0x4]
    mov r7, #0x18
    mov r1, #0x4
    str r1, [r0, #0x4]
    str r9, [ip, #0x0]
    add ip, sp, #0xe4
    sub r3, lr, #0x2d
    mov r0, #0x2000
    str r7, [r8, #0x0]
    mov r8, #0x70000
    str r10, [r6, #0x0]
    str lr, [r6, #0x4]
    str r9, [ip, #0x0]
    str r3, [ip, #0x4]
    str r0, [sp, #0x74]
    add r2, sp, #0xec
    mov r1, #0x2c
    str r1, [r2, #0x4]
    str r7, [r2, #0x0]
    add r6, sp, #0x7c
    mov r9, #0x1e000
    mov ip, #0x7f000
    str r8, [sp, #0x78]
    stmia r6, {r9, ip}
    add r10, sp, #0x8c
    mov lr, #0x20000
    add r3, sp, #0x84
    mov r1, #0x50000
    mov r7, #0x0
    str r1, [r3, #0x4]
    mov r1, #0x1000
    str r7, [r3, #0x0]
    add r0, sp, #0x54
    mov r2, r1
    mov r3, r1
    str lr, [r10, #0x0]
    str r8, [r10, #0x4]
    bl VecFx32Object_InitComponents
    add r0, sp, #0x44
    add r1, r5, #0x2c
    add r2, r5, #0xac
    bl func_ov039_022014f8
    add r0, r5, #0x1000
    ldr r1, [r0, #0xcd8]
    cmp r1, #0x4
    bne L_02203268
    ldr r1, [r5, #0xa8]
    tst r1, #0x1
    beq L_02203448
    ldr r0, [r0, #0xcc0]
    mov r1, #0x50
    mov r0, r0, lsl #0x4
    bl func_020befec
    mov r6, r0
    rsb r3, r6, #0x0
    mov r2, #0x14
    add r0, sp, #0x64
    add r1, sp, #0x3c
    str r3, [sp, #0x3c]
    str r2, [sp, #0x40]
    bl func_ov039_0220346c
    ldr r2, L_02203464
    add r0, sp, #0x6c
    add r1, sp, #0x34
    str r6, [sp, #0x34]
    str r2, [sp, #0x38]
    bl func_ov039_0220346c
    add r3, sp, #0x64
    str r3, [sp, #0x0]
    mov r2, r7
    str r2, [sp, #0x4]
    add r3, sp, #0x74
    ldr r2, L_02203468
    str r3, [sp, #0x8]
    str r2, [sp, #0xc]
    mov r2, #0xc8
    add r1, r5, #0x1000
    str r2, [sp, #0x10]
    ldr r2, [r1, #0xccc]
    mov r0, r4
    mov r2, r2, lsl #0x10
    mov r3, r2, lsr #0x10
    add r1, sp, #0x44
    add r2, sp, #0x54
    bl func_0209c430
    b L_02203448
L_02203268:
    cmp r1, #0x3
    bne L_02203320
    ldr r0, [r5, #0xa8]
    mov r1, #0x3
    bl func_020befec
    mov r6, r1
    add r1, sp, #0x94
    add r1, r1, r6, lsl #0x4
    str r1, [sp, #0x0]
    mov r0, r7
    str r0, [sp, #0x4]
    add r1, sp, #0x74
    str r1, [sp, #0x8]
    ldr r0, L_02203468
    add r1, sp, #0x44
    str r0, [sp, #0xc]
    mov r0, #0xc8
    str r0, [sp, #0x10]
    add r0, r5, #0x1000
    ldr r0, [r0, #0xccc]
    add r2, sp, #0x54
    mov r3, r0, lsl #0x10
    mov r0, r4
    mov r3, r3, lsr #0x10
    bl func_0209c430
    add r1, sp, #0x94
    add r0, r6, #0x3
    add r0, r1, r0, lsl #0x4
    str r0, [sp, #0x0]
    mov r0, r7
    str r0, [sp, #0x4]
    add r1, sp, #0x84
    str r1, [sp, #0x8]
    ldr r0, L_02203468
    add r1, sp, #0x44
    str r0, [sp, #0xc]
    mov r0, #0xbe
    str r0, [sp, #0x10]
    add r0, r5, #0x1000
    ldr r0, [r0, #0xccc]
    add r2, sp, #0x54
    mov r3, r0, lsl #0x10
    mov r0, r4
    mov r3, r3, lsr #0x10
    bl func_0209c430
    b L_02203448
L_02203320:
    cmp r1, #0x2
    bne L_02203448
    ldr r7, [r0, #0xcc0]
    mov r2, #0x14
    mov r0, r7, asr #0x3
    add r0, r7, r0, lsr #0x1c
    mov r6, r0, asr #0x4
    rsb r3, r6, #0x0
    add r0, sp, #0x64
    add r1, sp, #0x2c
    str r3, [sp, #0x2c]
    str r2, [sp, #0x30]
    bl func_ov039_0220346c
    mov r0, #0x6
    mul r2, r7, r0
    add r0, sp, #0x6c
    add r1, sp, #0x24
    str r6, [sp, #0x24]
    str r2, [sp, #0x28]
    bl func_ov039_0220346c
    add r1, sp, #0x64
    str r1, [sp, #0x0]
    mov r0, #0x0
    str r0, [sp, #0x4]
    add r1, sp, #0x74
    str r1, [sp, #0x8]
    ldr r0, L_02203468
    add r1, sp, #0x44
    str r0, [sp, #0xc]
    mov r0, #0xc8
    str r0, [sp, #0x10]
    add r0, r5, #0x1000
    ldr r0, [r0, #0xccc]
    add r2, sp, #0x54
    mov r3, r0, lsl #0x10
    mov r0, r4
    mov r3, r3, lsr #0x10
    bl func_0209c430
    add r0, r5, #0x1000
    ldr r2, [r0, #0xcc0]
    add r0, sp, #0x64
    mov r1, r2, asr #0x1
    add r1, r2, r1, lsr #0x1e
    mov r6, r1, asr #0x2
    rsb r1, r6, #0x0
    str r1, [sp, #0x1c]
    rsb r1, r6, #0x14
    str r1, [sp, #0x20]
    add r1, sp, #0x1c
    bl func_ov039_0220346c
    add r0, r6, #0x14
    str r0, [sp, #0x18]
    add r0, sp, #0x6c
    add r1, sp, #0x14
    str r6, [sp, #0x14]
    bl func_ov039_0220346c
    add r3, sp, #0x64
    str r3, [sp, #0x0]
    mov r2, #0x0
    str r2, [sp, #0x4]
    add r3, sp, #0x84
    ldr r2, L_02203468
    str r3, [sp, #0x8]
    str r2, [sp, #0xc]
    mov r2, #0xbe
    add r1, r5, #0x1000
    str r2, [sp, #0x10]
    ldr r2, [r1, #0xccc]
    mov r0, r4
    mov r2, r2, lsl #0x10
    mov r3, r2, lsr #0x10
    add r1, sp, #0x44
    add r2, sp, #0x54
    bl func_0209c430
L_02203448:
    add r0, sp, #0x44
    bl VecFx32Object_Destroy
    add r0, sp, #0x54
    bl VecFx32Object_Destroy
    add sp, sp, #0xf4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, pc}
L_02203460: .word data_021052fc
L_02203464: .word 0x1ea
L_02203468: .word 0x7fff
    .size func_ov039_02203064, .-func_ov039_02203064

