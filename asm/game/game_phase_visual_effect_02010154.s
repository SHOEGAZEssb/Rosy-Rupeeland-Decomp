; Matching retail form; see src/game/game_phase_visual_effect_controls.c.
.text
.extern GraphicsResourceSet_Load
.extern data_020f4e18
.extern func_02070f34
.extern GraphicsResourceSet_ReleaseHandles
.extern func_020b44e8
.global GamePhaseVisualEffect_LoadResources
GamePhaseVisualEffect_LoadResources:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r0
    add r0, r7, #0x4
    mov r6, r1
    mov r5, r2
    mov r4, r3
    bl GraphicsResourceSet_ReleaseHandles
    ldr r0, L_020101a0
    str r4, [sp, #0x0]
    ldr r1, [r0, #0x0]
    mov r2, r6
    mov r3, r5
    add r0, r7, #0x4
    bl GraphicsResourceSet_Load
    ldr r0, [r7, #0xc]
    mov r1, #0xf
    bl func_02070f34
    bl func_020b44e8
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
L_020101a0: .word data_020f4e18
    .size GamePhaseVisualEffect_LoadResources, . - GamePhaseVisualEffect_LoadResources

