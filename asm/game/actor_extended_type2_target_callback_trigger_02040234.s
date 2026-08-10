; Matching retail form; see src/game/actor_extended_type2_target_callback_trigger.c.
.text
.extern data_020df9e8
.global ActorExtendedType2_TriggerStoredTargetCallback
.type ActorExtendedType2_TriggerStoredTargetCallback, @function
ActorExtendedType2_TriggerStoredTargetCallback: ; 0x02040234
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x260]
    tst r1, #0x100
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r2, [r0, #0x0]
    ldr r1, [r4, #0x228]
    ldr r2, [r2, #0xe4]
    blx r2
    ldr r0, .L_02040280
    mov r1, #0x7
    ldr r3, [r0, #0x2b0]
    ldr r2, [r0, #0x2b4]
    mov r0, #0x1
    str r3, [r4, #0x220]
    str r2, [r4, #0x224]
    strb r1, [r4, #0x24c]
    ldmia sp!, {r4, pc}
.L_02040280: .word data_020df9e8
.size ActorExtendedType2_TriggerStoredTargetCallback, . - ActorExtendedType2_TriggerStoredTargetCallback

