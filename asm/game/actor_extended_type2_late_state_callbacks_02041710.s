; Matching retail form; see src/game/actor_extended_type2_late_state_callbacks.c.
.text
.extern data_020df9e8
.extern Actor_RestoreSavedFlags
.global ActorExtendedType2_EnterState2WithCallbacks
.type ActorExtendedType2_EnterState2WithCallbacks, @function
ActorExtendedType2_EnterState2WithCallbacks: ; 0x02041710
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl Actor_RestoreSavedFlags
    ldr r1, [r4, #0x10]
    ldr r0, .L_02041768
    bic r1, r1, #0x1f0000
    str r1, [r4, #0x10]
    ldr r3, [r0, #0x288]
    ldr r2, [r0, #0x28c]
    mov r1, #0x2
    str r3, [r4, #0x218]
    str r2, [r4, #0x21c]
    ldr r3, [r0, #0x280]
    ldr r2, [r0, #0x284]
    mov r0, #0x0
    str r3, [r4, #0x220]
    str r2, [r4, #0x224]
    ldr r2, [r4, #0xd0]
    bic r2, r2, #0x200
    str r2, [r4, #0xd0]
    strh r1, [r4, #0xd6]
    ldmia sp!, {r4, pc}
.L_02041768: .word data_020df9e8
.size ActorExtendedType2_EnterState2WithCallbacks, . - ActorExtendedType2_EnterState2WithCallbacks

.global ActorExtendedType2_UpdateState22Countdown
.type ActorExtendedType2_UpdateState22Countdown, @function
ActorExtendedType2_UpdateState22Countdown: ; 0x0204176c
    ldr r2, [r0, #0x260]
    mov r1, #0x8
    bic r2, r2, #0x1
    str r2, [r0, #0x260]
    strb r1, [r0, #0x24c]
    mov r1, #0x16
    strh r1, [r0, #0xd6]
    add r1, r0, #0x200
    ldrsh r2, [r1, #0x5a]
    sub r2, r2, #0x1
    strh r2, [r1, #0x5a]
    ldrsh r1, [r1, #0x5a]
    cmp r1, #0x0
    bge .L_020417c8
    ldr r1, .L_020417d0
    ldr r3, [r1, #0x278]
    ldr r2, [r1, #0x27c]
    str r3, [r0, #0x218]
    str r2, [r0, #0x21c]
    ldr r2, [r1, #0x270]
    ldr r1, [r1, #0x274]
    str r2, [r0, #0x220]
    str r1, [r0, #0x224]
.L_020417c8:
    mov r0, #0x0
    bx lr
.L_020417d0: .word data_020df9e8
.size ActorExtendedType2_UpdateState22Countdown, . - ActorExtendedType2_UpdateState22Countdown

.global ActorExtendedType2_ReturnFalseLateState
.type ActorExtendedType2_ReturnFalseLateState, @function
ActorExtendedType2_ReturnFalseLateState: ; 0x020417d4
    mov r0, #0x0
    bx lr
.size ActorExtendedType2_ReturnFalseLateState, . - ActorExtendedType2_ReturnFalseLateState
