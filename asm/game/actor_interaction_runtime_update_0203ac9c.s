; Matching retail form; see src/game/actor_interaction_runtime_update.c.
.text
.extern data_020c9670
.extern data_02105680
.extern data_02105682
.extern data_02105684
.extern data_021056e4
.extern func_02034ecc
.extern ActorRegisteredSubclass_ProcessRegistry
.extern func_02045028
.extern func_0204cfa4
.extern func_02053560
    .global ActorInteractionRuntime_Update
    .type ActorInteractionRuntime_Update, @function
ActorInteractionRuntime_Update: ; 0x0203ac9c
    stmdb sp!, {r3, r4, r5, lr}
    ldr r0, .L_0203ad50
    ldr r1, .L_0203ad54
    ldrh r0, [r0, #0x0]
    ldrh r2, [r1, #0x0]
    ldr r3, .L_0203ad58
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x4
    mov r4, r0, lsl #0x1
    ldr lr, .L_0203ad5c
    mov r0, r4, lsl #0x1
    ldrsh ip, [lr, r0]
    add r1, r2, r2, lsl #0x1
    add r0, r4, #0x1
    mul r4, r1, ip
    mov r0, r0, lsl #0x1
    ldr r5, [r3, #0x0]
    ldrsh ip, [lr, r0]
    add r0, r5, r5, lsl #0x1
    add r0, r0, r4, asr #0xc
    mov r0, r0, asr #0x2
    str r0, [r3, #0x0]
    ldr lr, [r3, #0x4]
    mul ip, r1, ip
    add r1, lr, lr, lsl #0x1
    add r1, r1, ip, asr #0xc
    mov r1, r1, asr #0x2
    str r1, [r3, #0x4]
    cmp r2, #0x0
    bne .L_0203ad30
    bl func_0204cfa4
    cmp r0, #0x29
    ldrlt r0, .L_0203ad58
    movlt r1, #0x0
    strlt r1, [r0, #0x4]
    strlt r1, [r0, #0x0]
.L_0203ad30:
    bl func_02034ecc
    bl func_02053560
    bl ActorRegisteredSubclass_ProcessRegistry
    ldr r0, .L_0203ad60
    mov r1, #0x0
    strh r1, [r0, #0x0]
    bl func_02045028
    ldmia sp!, {r3, r4, r5, pc}
.L_0203ad50: .word data_02105680
.L_0203ad54: .word data_02105682
.L_0203ad58: .word data_02105684
.L_0203ad5c: .word data_020c9670
.L_0203ad60: .word data_021056e4

    .size ActorInteractionRuntime_Update, . - ActorInteractionRuntime_Update

