; Matching retail form; see src/game/main_bg1_follow_presentation.c.
.text
.extern Heap_Free
.extern FieldEffect_DestroyBase

    .global MainBg1FollowPresentation_DestroyAndFree
    .type MainBg1FollowPresentation_DestroyAndFree, @function
MainBg1FollowPresentation_DestroyAndFree: ; 0x02028588
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl FieldEffect_DestroyBase
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size MainBg1FollowPresentation_DestroyAndFree, . - MainBg1FollowPresentation_DestroyAndFree

