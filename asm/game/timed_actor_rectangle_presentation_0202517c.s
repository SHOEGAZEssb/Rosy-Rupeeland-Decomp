; Matching retail form; see src/game/timed_actor_rectangle_presentation.c.
.text
.extern FieldEffect_DestroyBase

    .global TimedActorRectanglePresentation_Destroy
    .type TimedActorRectanglePresentation_Destroy, @function
TimedActorRectanglePresentation_Destroy: ; 0x0202517c
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl FieldEffect_DestroyBase
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size TimedActorRectanglePresentation_Destroy, . - TimedActorRectanglePresentation_Destroy
