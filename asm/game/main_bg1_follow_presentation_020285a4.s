; Matching retail form; see src/game/main_bg1_follow_presentation.c.
.text
.extern BgScroll_SetMainBg1
.extern VecFx32Object_InitCopy
.extern VecFx32Object_Destroy
.extern VecFx32Object_Add
.extern ActorMotionState_BuildOscillationOffset
.extern ActorMotionAreaFollower_GetPosition

    .global MainBg1FollowPresentation_Update
    .type MainBg1FollowPresentation_Update, @function
MainBg1FollowPresentation_Update: ; 0x020285a4
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x20
    mov r4, r0
    ldr r0, [r4, #0x8]
    bl ActorMotionAreaFollower_GetPosition
    mov r1, r0
    add r0, sp, #0x10
    bl VecFx32Object_InitCopy
    ldr r0, [sp, #0x14]
    ldr r1, [sp, #0x18]
    add r0, r0, r0, lsr #0x1f
    mov r2, r0, asr #0x1
    add r1, r1, r1, lsr #0x1f
    mov r0, r1, asr #0x1
    str r0, [sp, #0x18]
    str r2, [sp, #0x14]
    ldr r1, [r4, #0x8]
    add r0, sp, #0x0
    add r1, r1, #0x44
    bl ActorMotionState_BuildOscillationOffset
    add r0, sp, #0x10
    add r1, sp, #0x0
    bl VecFx32Object_Add
    add r0, sp, #0x0
    bl VecFx32Object_Destroy
    ldr r0, [sp, #0x14]
    ldr r1, [sp, #0x18]
    mov r0, r0, asr #0xc
    mov r1, r1, asr #0xc
    bl BgScroll_SetMainBg1
    add r0, sp, #0x10
    bl VecFx32Object_Destroy
    mov r0, #0x0
    add sp, sp, #0x20
    ldmia sp!, {r4, pc}
    .size MainBg1FollowPresentation_Update, . - MainBg1FollowPresentation_Update

