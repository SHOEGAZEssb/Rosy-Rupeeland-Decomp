; Matching retail form; see src/game/actor_extended_type3_state_reset.c.
.text
.extern data_020e0224
.extern data_020e6f94
.extern Actor_SaveAndForceFlags
.extern func_020349b8
.extern func_02045184
.global ActorExtendedType3_ResetInteractionState
.type ActorExtendedType3_ResetInteractionState, @function
ActorExtendedType3_ResetInteractionState: ; 0x02043958
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r2, [r4, #0xd0]
    add r1, r4, #0x200
    bic r2, r2, #0x200
    str r2, [r4, #0xd0]
    mov r2, #0x0
    strh r2, [r1, #0x4e]
    bl Actor_SaveAndForceFlags
    ldr r0, [r4, #0x274]
    cmp r0, #0x0
    beq .L_02043990
    mov r1, r4
    bl func_02045184
.L_02043990:
    ldr r0, .L_020439e4
    ldr r1, .L_020439e8
    ldr r2, [r0, #0x18]
    ldr r0, [r0, #0x1c]
    str r2, [r4, #0x218]
    str r0, [r4, #0x21c]
    ldrh r0, [r4, #0x4e]
    mov r0, r0, lsl #0x1
    ldrh r1, [r1, r0]
    cmp r1, #0x0
    beq .L_020439c8
    mov r0, r4
    mov r2, #0x0
    bl func_020349b8
.L_020439c8:
    ldr r1, [r4, #0x260]
    mov r0, #0x0
    bic r1, r1, #0x3
    orr r1, r1, #0x4000
    str r1, [r4, #0x260]
    str r0, [r4, #0x228]
    ldmia sp!, {r4, pc}
.L_020439e4: .word data_020e0224
.L_020439e8: .word data_020e6f94

    .global ActorExtendedType3_UpdateCountdownMotion
.size ActorExtendedType3_ResetInteractionState, . - ActorExtendedType3_ResetInteractionState
