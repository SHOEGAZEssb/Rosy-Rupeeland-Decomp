; Matching retail form; see src/game/actor_extended_type2_progress_and_state_reset.c.
.text
.extern data_020df9e8
.extern Actor_RestoreSavedFlags
.extern GraphicsSpriteState_SetAnimationIndex
.extern gGameWork
.global ActorExtendedType2_IncrementSavedProgressCounter
.type ActorExtendedType2_IncrementSavedProgressCounter, @function
ActorExtendedType2_IncrementSavedProgressCounter: ; 0x0203fd00
    add r0, r0, #0x200
    ldrsh r3, [r0, #0x7c]
    mvn r0, #0x0
    cmp r3, r0
    bxeq lr
    ldr r0, .L_0203fd64
    mov r1, #0x90
    ldr r2, [r0, #0x0]
    b .L_0203fd58
.L_0203fd24:
    add r0, r2, r1, lsl #0x1
    ldrsh r0, [r0, #0x4c]
    cmp r3, r0
    bne .L_0203fd54
    ldr r0, .L_0203fd64
    add r1, r1, #0x1
    ldr r0, [r0, #0x0]
    add r1, r0, r1, lsl #0x1
    ldrsh r0, [r1, #0x4c]
    add r0, r0, #0x1
    strh r0, [r1, #0x4c]
    bx lr
.L_0203fd54:
    add r1, r1, #0x2
.L_0203fd58:
    cmp r1, #0x9a
    ble .L_0203fd24
    bx lr
.L_0203fd64: .word gGameWork
.size ActorExtendedType2_IncrementSavedProgressCounter, . - ActorExtendedType2_IncrementSavedProgressCounter
.global ActorExtendedType2_SetCallbackPair88
.type ActorExtendedType2_SetCallbackPair88, @function

ActorExtendedType2_SetCallbackPair88: ; 0x0203fd68
    ldr r1, .L_0203fd80
    ldr r2, [r1, #0x88]
    ldr r1, [r1, #0x8c]
    str r2, [r0, #0x218]
    str r1, [r0, #0x21c]
    bx lr
.L_0203fd80: .word data_020df9e8
.size ActorExtendedType2_SetCallbackPair88, . - ActorExtendedType2_SetCallbackPair88
.global ActorExtendedType2_RestoreState1AndCallbackPair28
.type ActorExtendedType2_RestoreState1AndCallbackPair28, @function

ActorExtendedType2_RestoreState1AndCallbackPair28: ; 0x0203fd84
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl Actor_RestoreSavedFlags
    ldr r1, [r4, #0xd0]
    mov r0, #0x1
    bic r1, r1, #0x100
    str r1, [r4, #0xd0]
    strh r0, [r4, #0xd6]
    ldr r1, [r4, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x10
    strh r0, [r1, #0x24]
    ldr r1, [r4, #0xc8]
    ldr r0, [r4, #0x54]
    add r1, r1, #0x8
    and r1, r1, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r1, [r4, #0x14]
    ldr r0, .L_0203fe08
    bic r1, r1, #0x10000000
    str r1, [r4, #0x14]
    ldr r1, [r0, #0x28]
    ldr r0, [r0, #0x2c]
    str r1, [r4, #0x218]
    str r0, [r4, #0x21c]
    ldr r0, [r4, #0x10]
    bic r0, r0, #0x1f0000
    str r0, [r4, #0x10]
    ldr r0, [r4, #0x14]
    bic r0, r0, #0x2
    bic r0, r0, #0x4
    str r0, [r4, #0x14]
    ldmia sp!, {r4, pc}
.L_0203fe08: .word data_020df9e8
.size ActorExtendedType2_RestoreState1AndCallbackPair28, . - ActorExtendedType2_RestoreState1AndCallbackPair28

