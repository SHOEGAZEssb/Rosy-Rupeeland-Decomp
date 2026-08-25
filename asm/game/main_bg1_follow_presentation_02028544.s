; Matching retail form; see src/game/main_bg1_follow_presentation.c.
.text
.extern data_020de7e4
.extern FieldEffect_Init
.extern MainBg1FollowPresentation_SetupBg1Resources

    .global MainBg1FollowPresentation_Init
    .type MainBg1FollowPresentation_Init, @function
MainBg1FollowPresentation_Init: ; 0x02028544
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, r1
    bl FieldEffect_Init
    ldr r1, .L_02028570
    mov r0, r5
    str r1, [r5, #0x0]
    str r4, [r5, #0x8]
    bl MainBg1FollowPresentation_SetupBg1Resources
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
.L_02028570: .word data_020de7e4
    .size MainBg1FollowPresentation_Init, . - MainBg1FollowPresentation_Init

