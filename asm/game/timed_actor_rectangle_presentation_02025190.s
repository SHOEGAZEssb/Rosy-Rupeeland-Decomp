; Matching retail form; see src/game/timed_actor_rectangle_presentation.c.
.text
.extern Heap_Free
.extern FieldEffect_DestroyBase

    .global TimedActorRectanglePresentation_DestroyAndFree
    .type TimedActorRectanglePresentation_DestroyAndFree, @function
TimedActorRectanglePresentation_DestroyAndFree: ; 0x02025190
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl FieldEffect_DestroyBase
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size TimedActorRectanglePresentation_DestroyAndFree, . - TimedActorRectanglePresentation_DestroyAndFree
