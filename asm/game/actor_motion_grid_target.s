; Matching retail form; see src/game/actor_motion_grid_target.c for
; the documented portable implementation and recovered behavior.
.text
.extern data_020c9670
.extern VecFx32Object_InitComponents
.extern VecFx32Object_Destroy
.extern VecFx32_Subtract
.extern VecFx32_GetDirectionAngle
.extern func_020adc40
.extern func_020adc90
.extern func_020befec
    .global ActorMotion_ConfigureGridTarget
ActorMotion_ConfigureGridTarget: ; 0x0200920c
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x30
    ldr ip, [sp, #0x40]
    mov r5, r0
    mov r0, #0x2
    str r0, [r5, #0x18]
    mov r4, r3
    cmp ip, #0x0
    ldr ip, [r5, #0x38]
    ldr r3, [r5, #0x3c]
    bne L_020092b8
    add r2, r2, #0x14
    add r2, r3, r2, lsl #0xc
    add r0, sp, #0x20
    add r1, ip, r1, lsl #0xc
    mov r3, #0x0
    bl VecFx32Object_InitComponents
    add r0, sp, #0x10
    add r1, sp, #0x20
    add r2, r5, #0x8
    bl VecFx32_Subtract
    str r4, [r5, #0x2c]
    movs r1, r4
    ldreq r0, [sp, #0x14]
    streq r0, [r5, #0x1c]
    ldreq r0, [sp, #0x18]
    beq L_02009290
    ldr r0, [sp, #0x14]
    bl func_020befec
    str r0, [r5, #0x1c]
    ldr r0, [sp, #0x18]
    ldr r1, [r5, #0x2c]
    bl func_020befec
L_02009290:
    str r0, [r5, #0x20]
    ldr r1, [sp, #0x24]
    add r0, sp, #0x10
    str r1, [r5, #0x24]
    ldr r1, [sp, #0x28]
    str r1, [r5, #0x28]
    bl VecFx32Object_Destroy
    add r0, sp, #0x20
    bl VecFx32Object_Destroy
    b L_0200939c
L_020092b8:
    add r2, r2, #0x14
    add r2, r3, r2, lsl #0xc
    add r0, sp, #0x0
    add r1, ip, r1, lsl #0xc
    mov r3, #0x0
    bl VecFx32Object_InitComponents
    ldr r1, [sp, #0x4]
    ldr r0, [r5, #0xc]
    ldr r3, [sp, #0x8]
    ldr r2, [r5, #0x10]
    sub r1, r1, r0
    sub ip, r3, r2
    smull r0, r2, r1, r1
    adds r3, r0, #0x800
    smull r1, r0, ip, ip
    adc r2, r2, #0x0
    adds r1, r1, #0x800
    mov r3, r3, lsr #0xc
    adc r0, r0, #0x0
    mov r1, r1, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    orr r1, r1, r0, lsl #0x14
    add r0, r3, r1
    bl func_020adc40
    mov r1, r4
    bl func_020adc90
    mov r2, r0, asr #0xc
    add r1, sp, #0x0
    add r0, r5, #0x8
    str r2, [r5, #0x2c]
    bl VecFx32_GetDirectionAngle
    mov r0, r0, asr #0x4
    mov r1, r0, lsl #0x1
    add r0, r1, #0x1
    mov r2, r0, lsl #0x1
    ldr r3, L_020093a8
    mov r1, r1, lsl #0x1
    ldrsh r2, [r3, r2]
    ldrsh r1, [r3, r1]
    add r0, sp, #0x0
    smull lr, ip, r2, r4
    smull r3, r2, r1, r4
    adds r4, lr, #0x800
    adc r1, ip, #0x0
    mov r4, r4, lsr #0xc
    orr r4, r4, r1, lsl #0x14
    adds r3, r3, #0x800
    adc r1, r2, #0x0
    mov r2, r3, lsr #0xc
    str r4, [r5, #0x1c]
    orr r2, r2, r1, lsl #0x14
    str r2, [r5, #0x20]
    ldr r1, [sp, #0x4]
    str r1, [r5, #0x24]
    ldr r1, [sp, #0x8]
    str r1, [r5, #0x28]
    bl VecFx32Object_Destroy
L_0200939c:
    ldr r0, [r5, #0x2c]
    add sp, sp, #0x30
    ldmia sp!, {r3, r4, r5, pc}
L_020093a8: .word data_020c9670
    .size ActorMotion_ConfigureGridTarget, .-ActorMotion_ConfigureGridTarget
