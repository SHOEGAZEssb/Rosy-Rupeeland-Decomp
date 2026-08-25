    .text
    .extern GraphicsSpriteState_TestTouchPoint
    .extern PresentationScalar_TransitionBy
    .extern PresentationList_Remove
    .extern SpriteMotionController_Hide
    .extern Overlay016_LayoutActors

/* Exact fallbacks for actor selection and removal; see src/overlays/ov016/overlay016_actor_runtime.c. */
    .global Overlay016_RemoveActor

Overlay016_RemoveActor:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r4, r0
    mov r7, r1
    mov r6, r2
    ldr r5, [r4, #0xd4]
    b L_021fe610
L_021fe59c:
    ldr r0, [r5, #0x9c]
    mov r1, r7
    bl GraphicsSpriteState_TestTouchPoint
    cmp r0, #0x0
    beq L_021fe60c
    cmp r6, #0x0
    ldreq r0, [r5, #0xac]
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    mov r1, r5
    add r0, r4, #0xd0
    bl PresentationList_Remove
    mov r2, #0x20000
    str r5, [r4, #0xcc]
    add r0, r5, #0x1c
    rsb r2, r2, #0x0
    mov r1, #0x1
    bl PresentationScalar_TransitionBy
    ldr r1, [r4, #0xcc]
    mov r0, #0x10
    str r0, [r1, #0x7c]
    mov r0, #0x0
    str r0, [r1, #0x80]
    ldr r0, [r4, #0xdc]
    cmp r0, #0x0
    bne L_021fe618
    add r0, r4, #0x20
    bl SpriteMotionController_Hide
    b L_021fe618
L_021fe60c:
    ldr r5, [r5, #0x8]
L_021fe610:
    cmp r5, #0x0
    bne L_021fe59c
L_021fe618:
    ldr r0, [r4, #0xcc]
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    mov r0, r4
    bl Overlay016_LayoutActors
    ldr r0, [r4, #0xcc]
    ldr r0, [r0, #0xac]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}

    .size Overlay016_RemoveActor, . - Overlay016_RemoveActor
