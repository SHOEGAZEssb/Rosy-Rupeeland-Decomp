; Matching retail form; see src/game/main_bg1_follow_presentation.c.
.text
.extern FieldEffect_DestroyBase

    .global MainBg1FollowPresentation_Destroy
    .type MainBg1FollowPresentation_Destroy, @function
MainBg1FollowPresentation_Destroy: ; 0x02028574
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl FieldEffect_DestroyBase
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size MainBg1FollowPresentation_Destroy, . - MainBg1FollowPresentation_Destroy

