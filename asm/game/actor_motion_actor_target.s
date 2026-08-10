; Matching retail form; see src/game/actor_motion_actor_target.c for
; the documented portable implementation and recovered behavior.
.text
.extern data_020c9670
.extern VecFx32Object_Destroy
.extern VecFx32_Subtract
.extern VecFx32_GetDirectionAngle
.extern ActorMotion_GetBoundActorTargetPosition
.extern func_020adc90
.extern func_020adcac
.extern func_020befec
.global ActorMotion_ConfigureBoundActorTarget
ActorMotion_ConfigureBoundActorTarget: ; 0x020093cc
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x30
    mov r5, r0
    mov r0, #0x2
    mov r4, r1
    str r0, [r5, #0x18]
    cmp r2, #0x0
    bne L_02009460
    add r0, sp, #0x20
    mov r1, r5
    bl ActorMotion_GetBoundActorTargetPosition
    add r0, sp, #0x10
    add r1, sp, #0x20
    add r2, r5, #0x8
    bl VecFx32_Subtract
    str r4, [r5, #0x2c]
    movs r1, r4
    ldreq r0, [sp, #0x14]
    streq r0, [r5, #0x1c]
    ldreq r0, [sp, #0x18]
    beq L_02009438
    ldr r0, [sp, #0x14]
    bl func_020befec
    str r0, [r5, #0x1c]
    ldr r0, [sp, #0x18]
    ldr r1, [r5, #0x2c]
    bl func_020befec
L_02009438:
    str r0, [r5, #0x20]
    ldr r1, [sp, #0x24]
    add r0, sp, #0x10
    str r1, [r5, #0x24]
    ldr r1, [sp, #0x28]
    str r1, [r5, #0x28]
    bl VecFx32Object_Destroy
    add r0, sp, #0x20
    bl VecFx32Object_Destroy
    b L_02009504
L_02009460:
    add r0, sp, #0x0
    mov r1, r5
    bl ActorMotion_GetBoundActorTargetPosition
    adds r1, r5, #0x8
    add r0, sp, #0x0
    addne r1, r1, #0x4
    add r0, r0, #0x4
    bl func_020adcac
    mov r1, r4
    bl func_020adc90
    mov r2, r0, asr #0xc
    add r1, sp, #0x0
    add r0, r5, #0x8
    str r2, [r5, #0x2c]
    bl VecFx32_GetDirectionAngle
    mov r0, r0, asr #0x4
    mov r3, r0, lsl #0x1
    add r0, r3, #0x1
    mov r2, r0, lsl #0x1
    ldr r1, L_02009510
    mov r0, r3, lsl #0x1
    ldrsh r2, [r1, r2]
    ldrsh r1, [r1, r0]
    add r0, sp, #0x0
    smull r3, ip, r2, r4
    adds lr, r3, #0x800
    smull r3, r2, r1, r4
    adc r1, ip, #0x0
    mov r4, lr, lsr #0xc
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
L_02009504:
    ldr r0, [r5, #0x2c]
    add sp, sp, #0x30
    ldmia sp!, {r3, r4, r5, pc}
L_02009510: .word data_020c9670
    .size ActorMotion_ConfigureBoundActorTarget, .-ActorMotion_ConfigureBoundActorTarget

