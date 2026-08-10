; Matching retail form; see src/game/game_phase_load_scene_callbacks.c for
; the documented portable implementations and recovered behavior.
.text
.extern GameWork_ClearFlag
.extern data_020c3600
.extern data_020f4e14
.extern data_021052fc
.extern GamePhaseState_UpdateRenderHelpers
.extern GamePhaseState_ForwardVCount
.extern GraphicsSpriteRenderer_QueuePaletteUploads
.extern gDebugFont
.extern gGameWork

    .global GamePhaseLoadScene_UpdateRenderHelpers
GamePhaseLoadScene_UpdateRenderHelpers: ; 0x0200e3d4
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x3c]
    cmp r0, #0x0
    beq L_0200e3f8
    ldr r0, L_0200e420
    ldr r0, [r0, #0x0]
    add r0, r0, #0x24
    bl GamePhaseState_UpdateRenderHelpers
L_0200e3f8:
    ldr r0, [r4, #0x38]
    cmp r0, #0x0
    ldrne r0, [r4, #0x24]
    cmpne r0, #0x0
    beq L_0200e418
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
L_0200e418:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_0200e420: .word data_021052fc
    .size GamePhaseLoadScene_UpdateRenderHelpers, . - GamePhaseLoadScene_UpdateRenderHelpers

    .global GamePhaseLoadScene_ForwardCurrentVCount
GamePhaseLoadScene_ForwardCurrentVCount: ; 0x0200e424
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x3c]
    cmp r0, #0x0
    beq L_0200e450
    ldr r1, L_0200e478
    ldr r0, L_0200e47c
    ldrh r1, [r1, #0x0]
    ldr r0, [r0, #0x0]
    add r0, r0, #0x24
    bl GamePhaseState_ForwardVCount
L_0200e450:
    ldr r0, [r4, #0x38]
    cmp r0, #0x0
    ldrne r0, [r4, #0x24]
    cmpne r0, #0x0
    beq L_0200e470
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x10]
    blx r1
L_0200e470:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_0200e478: .word 0x4000006
L_0200e47c: .word data_021052fc
    .size GamePhaseLoadScene_ForwardCurrentVCount, . - GamePhaseLoadScene_ForwardCurrentVCount

    .global GamePhase_ResetTransientState
GamePhase_ResetTransientState: ; 0x0200e480
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, #0x0
    ldr r5, L_0200e4cc
    ldr r4, L_0200e4d0
    b L_0200e4a8
L_0200e494:
    mov r0, r6, lsl #0x1
    ldrh r1, [r5, r0]
    ldr r0, [r4, #0x0]
    bl GameWork_ClearFlag
    add r6, r6, #0x1
L_0200e4a8:
    cmp r6, #0xc
    blo L_0200e494
    ldr r0, L_0200e4d4
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_QueuePaletteUploads
    ldr r0, L_0200e4d8
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_QueuePaletteUploads
    ldmia sp!, {r4, r5, r6, pc}
L_0200e4cc: .word data_020c3600
L_0200e4d0: .word gGameWork
L_0200e4d4: .word data_020f4e14
L_0200e4d8: .word gDebugFont
    .size GamePhase_ResetTransientState, . - GamePhase_ResetTransientState

