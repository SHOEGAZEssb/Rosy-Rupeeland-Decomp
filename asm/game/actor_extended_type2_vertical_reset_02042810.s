; Matching retail form; see src/game/actor_extended_type2_vertical_reset.c.
.text
.extern data_020df9e8
.global ActorExtendedType2_ResetVerticalMotionCallbacks
.type ActorExtendedType2_ResetVerticalMotionCallbacks, @function
ActorExtendedType2_ResetVerticalMotionCallbacks: ; 0x02042810
    mov r1, #0x0
    str r1, [r0, #0x40]
    str r1, [r0, #0x3c]
    mov r1, #0x3000
    str r1, [r0, #0x44]
    ldr r1, [r0, #0x260]
    tst r1, #0x2
    beq .L_02042850
    ldr r2, .L_02042860
    add r1, r0, #0x200
    ldr ip, [r2, #0x1c8]
    ldr r3, [r2, #0x1cc]
    mov r2, #0x78
    str ip, [r0, #0x218]
    str r3, [r0, #0x21c]
    strh r2, [r1, #0x5a]
.L_02042850:
    ldr r1, [r0, #0x260]
    orr r1, r1, #0x80
    str r1, [r0, #0x260]
    bx lr
.L_02042860: .word data_020df9e8
.size ActorExtendedType2_ResetVerticalMotionCallbacks, . - ActorExtendedType2_ResetVerticalMotionCallbacks
