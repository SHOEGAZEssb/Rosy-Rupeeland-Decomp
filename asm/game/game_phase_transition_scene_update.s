; Matching retail form; see src/game/game_phase_transition_scene_update.c for
; the documented portable implementation and recovered behavior.
.text
.extern GameWork_TestFlag
.extern DisplayBrightness_IsMainTransitionDecreasing
.extern DisplayBrightness_StartMainTransition
.extern DisplayBrightness_IsSubTransitionDecreasing
.extern DisplayBrightness_StartSubTransition
.extern GameWork_ClearFlag
.extern DisplayBrightness_IsMainTransitionComplete
.extern DisplayBrightness_IsSubTransitionComplete
.extern GamePhaseCurrencyHud_SetVisible
.extern GameWork_Reset
.extern GamePhaseRuntime_ApplyStagedAreaRequest
.extern Heap_Alloc
.extern GamePhaseResumeScene_Init
.extern gGamePhaseResumeSceneAllocationTag
.extern data_021052fc
.extern gGameWork
.extern gHeapContext
.extern gLupyContext
.global GamePhaseTransitionScene_Update
GamePhaseTransitionScene_Update:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x8]
    cmp r1, #0x3
    addls pc, pc, r1, lsl #0x2
    b L_0200c89c
L_0200c6f0: ; jump table
    b L_0200c700 ; case 0
    b L_0200c774 ; case 1
    b L_0200c7d0 ; case 2
    b L_0200c83c ; case 3
L_0200c700:
    ldr r0, L_0200c8a4
    mov r1, #0x3f8
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    bne L_0200c758
    bl DisplayBrightness_IsMainTransitionDecreasing
    cmp r0, #0x0
    bne L_0200c730
    mov r0, #0x2
    mov r1, #0x10
    bl DisplayBrightness_StartMainTransition
L_0200c730:
    bl DisplayBrightness_IsSubTransitionDecreasing
    cmp r0, #0x0
    bne L_0200c748
    mov r0, #0x2
    mov r1, #0x10
    bl DisplayBrightness_StartSubTransition
L_0200c748:
    ldr r0, [r4, #0x8]
    add r0, r0, #0x1
    str r0, [r4, #0x8]
    b L_0200c774
L_0200c758:
    ldr r0, L_0200c8a4
    mov r1, #0x3f8
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    mov r0, #0x2
    str r0, [r4, #0x8]
    b L_0200c89c
L_0200c774:
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq L_0200c89c
    bl DisplayBrightness_IsSubTransitionComplete
    cmp r0, #0x0
    beq L_0200c89c
    ldr r0, L_0200c8a8
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    bl GamePhaseCurrencyHud_SetVisible
    ldr r0, L_0200c8ac
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mov r2, #0x1f
    add r0, r0, #0x3000
    ldr r0, [r0, #0xe8]
    ldr r3, [r0, #0x0]
    ldr r3, [r3, #0xc]
    blx r3
    ldr r0, [r4, #0x8]
    add r0, r0, #0x1
    str r0, [r4, #0x8]
    b L_0200c89c
L_0200c7d0:
    ldr r0, L_0200c8a4
    mov r1, #0x3e8
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    beq L_0200c7fc
    ldr r0, L_0200c8a4
    mov r1, #0x3e8
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    bl GameWork_Reset
L_0200c7fc:
    ldr r0, L_0200c8ac
    ldr r0, [r0, #0x0]
    bl GamePhaseRuntime_ApplyStagedAreaRequest
    mov r0, #0x28
    ldr r1, L_0200c8b0
    ldr r3, L_0200c8b4
    sub r2, r0, #0x2c
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_0200c82c
    mov r1, #0x1
    bl GamePhaseResumeScene_Init
L_0200c82c:
    ldr r0, [r4, #0x8]
    add r0, r0, #0x1
    str r0, [r4, #0x8]
    b L_0200c89c
L_0200c83c:
    cmp r4, #0x0
    beq L_0200c850
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_0200c850:
    ldr r0, L_0200c8a4
    ldr r1, L_0200c8b8
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    beq L_0200c87c
    ldr r0, L_0200c8a4
    ldr r1, L_0200c8b8
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    b L_0200c894
L_0200c87c:
    mov r0, #0x1
    mov r1, #0x10
    bl DisplayBrightness_StartMainTransition
    mov r0, #0x1
    mov r1, #0x10
    bl DisplayBrightness_StartSubTransition
L_0200c894:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
L_0200c89c:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_0200c8a4: .word gGameWork
L_0200c8a8: .word gLupyContext
L_0200c8ac: .word data_021052fc
L_0200c8b0: .word gGamePhaseResumeSceneAllocationTag
L_0200c8b4: .word gHeapContext
L_0200c8b8: .word 0x386
.size GamePhaseTransitionScene_Update, . - GamePhaseTransitionScene_Update

