; Matching retail form; see src/game/game_phase_touch_prompt_lifecycle.c.
.text
.extern data_020d5604
.extern FrameTask_DestroyBase
.extern AnimationResourceState_Destroy
.extern GraphicsSpriteGroup_Destroy
.global GamePhaseTouchPrompt_Destroy
GamePhaseTouchPrompt_Destroy:
    stmdb sp!, {r4, lr}
    ldr r1, L_02010380
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0x1c]
    cmp r0, #0x0
    beq L_02010360
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_02010360:
    ldr r0, [r4, #0x18]
    bl GraphicsSpriteGroup_Destroy
    add r0, r4, #0xc
    bl AnimationResourceState_Destroy
    mov r0, r4
    bl FrameTask_DestroyBase
    mov r0, r4
    ldmia sp!, {r4, pc}
L_02010380: .word data_020d5604
    .size GamePhaseTouchPrompt_Destroy, . - GamePhaseTouchPrompt_Destroy
