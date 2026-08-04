; Matching retail form; see src/game/actor_motion_jitter_update.c for
; the documented portable implementation and recovered behavior.
.text
.extern func_02004fe0
.extern func_02005058
.extern func_020050a4
.extern func_02009514
.extern func_020096b0
.extern func_020bf1f8
.extern genrand_int32
.global func_020097ec
func_020097ec: ; 0x020097ec
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x20
    mov r4, r0
    ldr r0, [r4, #0x18]
    cmp r0, #0x2
    bne L_020098f0
    ldr r2, [r4, #0x1c]
    ldr r0, [r4, #0x20]
    orrs r0, r2, r0
    beq L_02009884
    ldr r0, [r4, #0x2c]
    cmp r0, #0x0
    blt L_0200985c
    ldr r0, [r4, #0x30]
    orr r0, r0, #0x1
    str r0, [r4, #0x30]
    ldr r0, [r4, #0x2c]
    sub r0, r0, #0x1
    str r0, [r4, #0x2c]
    ldr r2, [r4, #0xc]
    ldr r0, [r4, #0x1c]
    add r0, r2, r0
    str r0, [r4, #0xc]
    ldr r2, [r4, #0x10]
    ldr r0, [r4, #0x20]
    add r0, r2, r0
    str r0, [r4, #0x10]
    b L_02009884
L_0200985c:
    ldr r2, [r4, #0x30]
    mov r0, #0x0
    bic r2, r2, #0x1
    str r2, [r4, #0x30]
    ldr r2, [r4, #0x24]
    str r2, [r4, #0xc]
    ldr r2, [r4, #0x28]
    str r2, [r4, #0x10]
    str r0, [r4, #0x1c]
    str r0, [r4, #0x20]
L_02009884:
    ldrsh r2, [r1, #0x0]
    ldr r0, [r4, #0xc]
    cmp r2, r0, asr #0xc
    movgt r0, r2, lsl #0xc
    strgt r0, [r4, #0xc]
    ldr r0, [r4, #0xc]
    ldrsh r2, [r1, #0x4]
    mov r0, r0, asr #0xc
    add r0, r0, #0x100
    cmp r0, r2
    subge r0, r2, #0x100
    movge r0, r0, lsl #0xc
    strge r0, [r4, #0xc]
    ldrsh r2, [r1, #0x2]
    ldr r0, [r4, #0x10]
    cmp r2, r0, asr #0xc
    movgt r0, r2, lsl #0xc
    strgt r0, [r4, #0x10]
    ldr r0, [r4, #0x10]
    ldrsh r1, [r1, #0x6]
    mov r0, r0, asr #0xc
    add r0, r0, #0xc0
    cmp r0, r1
    subge r0, r1, #0xc0
    movge r0, r0, lsl #0xc
    strge r0, [r4, #0x10]
    b L_020099a4
L_020098f0:
    add r0, sp, #0x10
    bl func_02004fe0
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    beq L_0200999c
    ldr r0, [r4, #0x18]
    mov r1, r4
    cmp r0, #0x0
    moveq r0, #0x1
    streq r0, [r4, #0x18]
    add r0, sp, #0x0
    bl func_02009514
    add r0, sp, #0x10
    add r1, sp, #0x0
    bl func_020050a4
    add r0, sp, #0x0
    bl func_02005058
    ldrsh r0, [r4, #0x64]
    cmp r0, #0x0
    ble L_02009990
    sub r0, r0, #0x1
    strh r0, [r4, #0x64]
    ldrsh r0, [r4, #0x66]
    mov r5, r0, lsl #0x1
    bl genrand_int32
    mov r1, r5
    bl func_020bf1f8
    ldrsh r0, [r4, #0x66]
    ldr r2, [sp, #0x14]
    sub r0, r0, r1
    add r0, r2, r0, lsl #0xc
    str r0, [sp, #0x14]
    bl genrand_int32
    mov r1, r5
    bl func_020bf1f8
    ldrsh r0, [r4, #0x66]
    ldr r2, [sp, #0x18]
    sub r0, r0, r1
    add r0, r2, r0, lsl #0xc
    str r0, [sp, #0x18]
L_02009990:
    add r1, sp, #0x10
    add r0, r4, #0x8
    bl func_020050a4
L_0200999c:
    add r0, sp, #0x10
    bl func_02005058
L_020099a4:
    ldr r0, [r4, #0x30]
    tst r0, #0x2
    beq L_020099b8
    mov r0, r4
    bl func_020096b0
L_020099b8:
    add sp, sp, #0x20
    ldmia sp!, {r3, r4, r5, pc}
    .size func_020097ec, .-func_020097ec

