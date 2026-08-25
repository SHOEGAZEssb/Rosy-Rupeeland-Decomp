; Matching retail form; see src/game/timed_sprite_record_presentation.c.
.text
.extern Heap_Free
.extern FieldEffect_DestroyBase

.global TimedSpriteRecordPresentation_DestroyAndFree
    .type TimedSpriteRecordPresentation_DestroyAndFree, @function
TimedSpriteRecordPresentation_DestroyAndFree: ; 0x0202002c
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl FieldEffect_DestroyBase
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size TimedSpriteRecordPresentation_DestroyAndFree, .-TimedSpriteRecordPresentation_DestroyAndFree
