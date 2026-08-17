; Matching retail form; see src/game/game_phase_touch_prompt_lifecycle.c.
.text
.extern Heap_Free
.extern data_020d5604
.extern func_02006138
.extern AnimationResourceState_Destroy
.extern GraphicsSpriteGroup_Destroy
.global GamePhaseTouchPrompt_DestroyAndFree
GamePhaseTouchPrompt_DestroyAndFree:
    stmdb sp!, {r4, lr}
    ldr r1, L_020103d4
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0x1c]
    cmp r0, #0x0
    beq L_020103ac
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_020103ac:
    ldr r0, [r4, #0x18]
    bl GraphicsSpriteGroup_Destroy
    add r0, r4, #0xc
    bl AnimationResourceState_Destroy
    mov r0, r4
    bl func_02006138
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
L_020103d4: .word data_020d5604
    .size GamePhaseTouchPrompt_DestroyAndFree, . - GamePhaseTouchPrompt_DestroyAndFree

