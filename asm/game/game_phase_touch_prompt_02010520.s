; Matching retail form; see src/game/game_phase_touch_prompt_runtime.c.
.text
.extern func_020954e0
.extern func_020954f4
.global GamePhaseTouchPrompt_SetEnabled
GamePhaseTouchPrompt_SetEnabled:
    stmdb sp!, {r4, lr}
    ldr r4, [r0, #0x20]
    cmp r1, #0x0
    str r1, [r0, #0x20]
    ldr r0, [r0, #0x1c]
    beq L_02010540
    bl func_020954e0
    b L_02010544
L_02010540:
    bl func_020954f4
L_02010544:
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size GamePhaseTouchPrompt_SetEnabled, . - GamePhaseTouchPrompt_SetEnabled

