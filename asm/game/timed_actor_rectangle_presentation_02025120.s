; Matching retail form; see src/game/timed_actor_rectangle_presentation.c.
.text
.extern data_020d6a24
.extern gGamePhaseRuntime
.extern RuntimePresentationManager_AppendFirstListEffect
.extern FieldEffect_Init

    .global TimedActorRectanglePresentation_Init
    .type TimedActorRectanglePresentation_Init, @function
TimedActorRectanglePresentation_Init: ; 0x02025120
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r4, r0
    mov r7, r1
    mov r6, r2
    mov r5, r3
    bl FieldEffect_Init
    ldr r0, .L_02025174
    ldr r1, [sp, #0x18]
    str r0, [r4, #0x0]
    str r7, [r4, #0x8]
    strh r6, [r4, #0xc]
    strh r5, [r4, #0xe]
    ldr r0, .L_02025178
    str r1, [r4, #0x10]
    ldr r0, [r0, #0x0]
    mov r1, r4
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl RuntimePresentationManager_AppendFirstListEffect
    mov r0, r4
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_02025174: .word data_020d6a24
.L_02025178: .word gGamePhaseRuntime
    .size TimedActorRectanglePresentation_Init, . - TimedActorRectanglePresentation_Init
