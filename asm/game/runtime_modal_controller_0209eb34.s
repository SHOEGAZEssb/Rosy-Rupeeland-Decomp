.text
; Matching fallback for the portable implementation in src/game/runtime_modal_controller.c.
.extern VecFx32Object_Add
.extern VecFx32Object_Assign
.extern VecFx32Object_Destroy
.extern VecFx32Object_Init
.extern func_0209eb24
.extern func_020be8c0
.extern func_020beae4
.extern func_020beb18
.extern func_020bf1f8
.extern genrand_int32

.global func_0209eb34
func_0209eb34:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x30
    mov r5, r0
    add r0, sp, #0x20
    mov r4, r1
    bl VecFx32Object_Init
    mov r0, r5
    bl VecFx32Object_Init
    ldr r1, [r4, #0x8]
    add r0, sp, #0x20
    ldr r1, [r1, #0x48]
    add r1, r1, #0x2c
    bl VecFx32Object_Assign
    ldr r0, [sp, #0x28]
    bl func_020beb18
    ldr r1, .L_0209ed04
    bl func_020be8c0
    bl func_020beae4
    str r0, [sp, #0x28]
    ldr r1, [r4, #0x14]
    cmp r1, #0x0
    beq .L_0209eba8
    add r0, sp, #0x10
    bl func_0209eb24
    add r1, sp, #0x10
    mov r0, r5
    bl VecFx32Object_Assign
    add r0, sp, #0x10
    bl VecFx32Object_Destroy
.L_0209eba8:
    ldr r1, [r4, #0x18]
    cmp r1, #0x0
    beq .L_0209ebd0
    add r0, sp, #0x0
    bl func_0209eb24
    add r1, sp, #0x0
    mov r0, r5
    bl VecFx32Object_Assign
    add r0, sp, #0x0
    bl VecFx32Object_Destroy
.L_0209ebd0:
    add r1, sp, #0x20
    mov r0, r5
    bl VecFx32Object_Add
    ldr r2, [r5, #0x4]
    mov r0, #0x800
    mov r1, r2, asr #0x1f
    mov r1, r1, lsl #0xb
    adds r3, r0, r2, lsl #0xb
    orr r1, r1, r2, lsr #0x15
    adc r1, r1, #0x0
    mov r2, r3, lsr #0xc
    orr r2, r2, r1, lsl #0x14
    str r2, [r5, #0x4]
    ldr r3, [r5, #0x8]
    mov r1, #0x0
    mov r2, r3, asr #0x1f
    mov r2, r2, lsl #0xb
    adds ip, r0, r3, lsl #0xb
    orr r2, r2, r3, lsr #0x15
    adc r0, r2, #0x0
    mov r2, ip, lsr #0xc
    orr r2, r2, r0, lsl #0x14
    str r2, [r5, #0x8]
    ldr r3, [sp, #0x24]
    ldr r2, [r5, #0x4]
    sub r0, r1, #0x64000
    sub r1, r3, r2
    cmp r1, r0
    addlt r0, r3, #0x64000
    strlt r0, [r5, #0x4]
    blt .L_0209ec58
    cmp r1, #0x64000
    subgt r0, r3, #0x64000
    strgt r0, [r5, #0x4]
.L_0209ec58:
    ldr r2, [sp, #0x28]
    ldr r1, [r5, #0x8]
    mov r0, #0x32000
    sub r1, r2, r1
    rsb r0, r0, #0x0
    cmp r1, r0
    addlt r0, r2, #0x32000
    strlt r0, [r5, #0x8]
    blt .L_0209ec88
    cmp r1, #0x5a000
    subgt r0, r2, #0x5a000
    strgt r0, [r5, #0x8]
.L_0209ec88:
    ldr r0, [r4, #0x44]
    cmp r0, #0x0
    ble .L_0209ecdc
    sub r0, r0, #0x1
    str r0, [r4, #0x44]
    ldr r6, [r4, #0x48]
    bl genrand_int32
    mov r1, r6, lsl #0x1
    bl func_020bf1f8
    ldr r2, [r5, #0x4]
    sub r0, r1, r6
    add r0, r2, r0, lsl #0xc
    str r0, [r5, #0x4]
    ldr r4, [r4, #0x48]
    bl genrand_int32
    mov r1, r4, lsl #0x1
    bl func_020bf1f8
    ldr r2, [r5, #0x8]
    sub r0, r1, r4
    add r0, r2, r0, lsl #0xc
    str r0, [r5, #0x8]
.L_0209ecdc:
    ldr r1, [r5, #0x4]
    add r0, sp, #0x20
    sub r1, r1, #0x80000
    str r1, [r5, #0x4]
    ldr r1, [r5, #0x8]
    sub r1, r1, #0x60000
    str r1, [r5, #0x8]
    bl VecFx32Object_Destroy
    add sp, sp, #0x30
    ldmia sp!, {r4, r5, r6, pc}
.L_0209ed04: .word 0x425c0000
.size func_0209eb34, . - func_0209eb34
