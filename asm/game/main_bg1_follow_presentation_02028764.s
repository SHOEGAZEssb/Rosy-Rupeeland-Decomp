; Matching retail form; see src/game/main_bg1_follow_presentation.c.
.text
.extern MainBg1FollowPresentation_SetupBg1Resources

    .global MainBg1FollowPresentation_ResetBg1ResourcesIfNeeded
    .type MainBg1FollowPresentation_ResetBg1ResourcesIfNeeded, @function
MainBg1FollowPresentation_ResetBg1ResourcesIfNeeded: ; 0x02028764
    stmdb sp!, {r3, lr}
    cmp r1, #0x1
    ldmeqia sp!, {r3, pc}
    bl MainBg1FollowPresentation_SetupBg1Resources
    ldmia sp!, {r3, pc}
    .size MainBg1FollowPresentation_ResetBg1ResourcesIfNeeded, . - MainBg1FollowPresentation_ResetBg1ResourcesIfNeeded

