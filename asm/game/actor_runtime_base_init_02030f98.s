; Matching retail form; see src/game/actor_runtime_base_init.c.
.text
.extern data_020df040
.extern data_021052fc
.extern VecFx32Object_Init
.extern VecFx32Object_InitComponents
.extern VecFx32Object_Assign
.extern VecFx32Stepper_Init
.extern func_020083b0
.extern ActorMotionAreaFollower_GetPosition
.extern GamePhaseActorScriptVm_Init
.extern ActorBaseGeometry_Init
.extern Actor_TurnTowardVector

    .global ActorRuntimeBase_Init
    .type ActorRuntimeBase_Init, @function
ActorRuntimeBase_Init: ; 0x02030f98
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, r1
    bl ActorBaseGeometry_Init
    ldr r1, .L_020311b4
    mov r0, #0x0
    str r1, [r5, #0x0]
    str r0, [r5, #0x54]
    str r0, [r5, #0x58]
    ldr r2, [r5, #0x5c]
    sub r0, r0, #0x10000
    and r2, r2, r0
    ldrh r1, [r4, #0x60]
    add r0, r5, #0x60
    orr r1, r2, r1
    bic r1, r1, #0xff0000
    str r1, [r5, #0x5c]
    ldrsb r1, [r4, #0x5f]
    str r1, [sp, #0x0]
    ldrsb r1, [r4, #0x5c]
    ldrsb r2, [r4, #0x5d]
    ldrsb r3, [r4, #0x5e]
    bl func_020083b0
    ldrsh r1, [r4, #0x20]
    add r0, r5, #0x68
    str r1, [sp, #0x0]
    ldrsh r1, [r4, #0x1a]
    ldrsh r2, [r4, #0x1c]
    ldrsh r3, [r4, #0x1e]
    bl func_020083b0
    add r0, r5, #0x78
    bl VecFx32Object_Init
    mov r1, #0x0
    add r0, r5, #0x88
    mov r2, r1
    mov r3, r1
    bl VecFx32Object_InitComponents
    mov r1, #0x0
    add r0, r5, #0x98
    mov r2, r1
    mov r3, r1
    bl VecFx32Object_InitComponents
    mov r1, #0x0
    str r1, [r5, #0xa8]
    mov r0, #0xff
    strh r0, [r5, #0xac]
    add r0, r5, #0xb0
    strh r1, [r5, #0xae]
    bl VecFx32Object_Init
    mov r1, #0x0
    str r1, [r5, #0xc8]
    str r1, [r5, #0xcc]
    str r1, [r5, #0xd0]
    strb r1, [r5, #0xd4]
    strb r1, [r5, #0xd5]
    strh r1, [r5, #0xd6]
    strh r1, [r5, #0xd8]
    strh r1, [r5, #0xda]
    strh r1, [r5, #0xdc]
    strh r1, [r5, #0xde]
    strh r1, [r5, #0xe4]
    strb r1, [r5, #0xe6]
    strb r1, [r5, #0xe7]
    add r0, r5, #0xec
    strb r1, [r5, #0xe8]
    bl GamePhaseActorScriptVm_Init
    add r0, r5, #0x198
    bl VecFx32Stepper_Init
    ldr r0, [r4, #0x48]
    mov r2, #0x1000
    str r0, [r5, #0x1cc]
    str r2, [r5, #0x1d0]
    str r2, [r5, #0x1d4]
    mov r1, #0x0
    str r2, [r5, #0x1d8]
    str r1, [r5, #0x1dc]
    str r1, [r5, #0x1e0]
    strb r1, [r5, #0x1e4]
    strb r1, [r5, #0x1e5]
    strb r1, [r5, #0x1e6]
    mov r0, #0xc
    strb r0, [r5, #0x1e7]
    add r0, r5, #0x100
    mov r3, #0x100
    strh r3, [r0, #0xe8]
    strh r1, [r0, #0xea]
    str r1, [r5, #0xc4]
    mov r0, r5
    mov r3, #0x800
    str r1, [r5, #0xc0]
    bl Actor_TurnTowardVector
    ldr r0, .L_020311b8
    ldr r0, [r0, #0x0]
    add r0, r0, #0x3bc
    add r0, r0, #0x2c00
    bl ActorMotionAreaFollower_GetPosition
    mov r1, r0
    add r0, r5, #0x78
    bl VecFx32Object_Assign
    mov r2, #0x0
    strb r2, [r5, #0x194]
    strb r2, [r5, #0x195]
    add r0, r5, #0x100
    strh r2, [r0, #0x96]
    mov r1, r2
.L_0203113c:
    add r0, r5, r2, lsl #0x2
    add r2, r2, #0x1
    str r1, [r0, #0x180]
    cmp r2, #0x5
    blt .L_0203113c
    ldrsh r0, [r4, #0x3c]
    cmp r0, #0x0
    blt .L_0203116c
    cmp r0, #0x3
    ldrle r0, [r5, #0x14]
    orrle r0, r0, #0x80
    strle r0, [r5, #0x14]
.L_0203116c:
    ldrsb r2, [r5, #0x8]
    ldrsh r1, [r4, #0x3e]
    mov r0, r5
    sub r1, r2, r1
    strh r1, [r5, #0x70]
    ldrsb r2, [r5, #0x9]
    ldrsh r1, [r4, #0x3e]
    sub r1, r2, r1
    strh r1, [r5, #0x72]
    ldrsb r2, [r5, #0xa]
    ldrsh r1, [r4, #0x3e]
    add r1, r2, r1
    strh r1, [r5, #0x74]
    ldrsb r2, [r5, #0xb]
    ldrsh r1, [r4, #0x3e]
    add r1, r2, r1
    strh r1, [r5, #0x76]
    ldmia sp!, {r3, r4, r5, pc}
.L_020311b4: .word data_020df040
.L_020311b8: .word data_021052fc
    .size ActorRuntimeBase_Init, . - ActorRuntimeBase_Init
