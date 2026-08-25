; Matching retail form; see src/game/game_phase_script_vm_runtime_scene_prepare_opcode.c.
.text
.extern gGamePhaseRuntime
.extern GamePhaseRuntime_UpdateDualScreenUiPresentation
.extern GamePhaseRuntime_RefreshAreaAuxiliaryObject
.extern GamePhaseState_GetConfiguration
.extern GamePhaseAreaScene_SetEnabled
.extern DualScreenUiStandardPresentation_BindSource
.global GamePhaseActorScriptVm_PrepareRuntimeScene
GamePhaseActorScriptVm_PrepareRuntimeScene:
    stmdb sp!, {r4, lr}
    ldr r0, L_0201a12c
    ldr r1, [r0, #0x0]
    add r0, r1, #0x3000
    ldr r4, [r0, #0xe8]
    add r0, r1, #0x24
    bl GamePhaseState_GetConfiguration
    mov r1, r0
    mov r0, r4
    bl DualScreenUiStandardPresentation_BindSource
    ldr r0, L_0201a12c
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    mov r2, #0x1f
    add r0, r0, #0x3000
    ldr r0, [r0, #0xe8]
    ldr r3, [r0, #0x0]
    ldr r3, [r3, #0xc]
    blx r3
    ldr r0, L_0201a12c
    ldr r0, [r0, #0x0]
    bl GamePhaseRuntime_UpdateDualScreenUiPresentation
    ldr r0, L_0201a12c
    ldr r0, [r0, #0x0]
    add r0, r0, #0x24
    bl GamePhaseState_GetConfiguration
    mov r1, r0
    ldr r0, L_0201a12c
    mov r2, #0x1
    ldr r0, [r0, #0x0]
    bl GamePhaseRuntime_RefreshAreaAuxiliaryObject
    ldr r0, L_0201a12c
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xfb8]
    bl GamePhaseAreaScene_SetEnabled
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_0201a12c: .word gGamePhaseRuntime
.size GamePhaseActorScriptVm_PrepareRuntimeScene, . - GamePhaseActorScriptVm_PrepareRuntimeScene
