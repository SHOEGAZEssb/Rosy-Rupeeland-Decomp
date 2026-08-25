; Matching retail form; see src/game/game_phase_script_vm_subsystem_command_opcode.c.
.text
.extern GamePhaseScriptVm_Pop
.extern GamePhaseScriptVm_StoreResultAndUpdateCondition
.extern GamePhaseProgressController_GetBaseThreshold
.extern GamePhaseProgressController_GetAdjustedThreshold
.extern GamePhaseProgressController_AddCounterFromProgress
.extern GamePhaseProgressController_SetCounter
.extern GamePhaseProgressController_AdvanceStage
.extern GamePhaseProgressController_CanAdvanceStage
.extern GamePhaseProgressController_IsBehindComparisonStage
.extern GamePhaseProgressController_AddProgress
.extern GamePhaseProgressController_GetStage
.extern GamePhaseProgressController_SetStage
.extern GamePhaseProgressController_SetComparisonStage
.extern GamePhaseProgressController_ClassifyProgress
.extern GamePhaseProgress_GetOrCreateGlobal
.global GamePhaseActorScriptVm_DispatchGamePhaseProgressCommand
GamePhaseActorScriptVm_DispatchGamePhaseProgressCommand:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    bl GamePhaseScriptVm_Pop
    mov r4, r0
    mov r0, r5
    bl GamePhaseScriptVm_Pop
    cmp r0, #0xd
    addls pc, pc, r0, lsl #0x2
    b L_02019f44
L_02019df8: ; jump table
    b L_02019f44 ; case 0
    b L_02019e30 ; case 1
    b L_02019e4c ; case 2
    b L_02019e5c ; case 3
    b L_02019e80 ; case 4
    b L_02019e6c ; case 5
    b L_02019e90 ; case 6
    b L_02019eac ; case 7
    b L_02019ebc ; case 8
    b L_02019edc ; case 9
    b L_02019ee8 ; case 10
    b L_02019f00 ; case 11
    b L_02019f18 ; case 12
    b L_02019f28 ; case 13
L_02019e30:
    bl GamePhaseProgress_GetOrCreateGlobal
    mov r1, r4
    bl GamePhaseProgressController_GetBaseThreshold
    mov r1, r0
    mov r0, r5
    bl GamePhaseScriptVm_StoreResultAndUpdateCondition
    b L_02019f44
L_02019e4c:
    bl GamePhaseProgress_GetOrCreateGlobal
    mov r1, r4
    bl GamePhaseProgressController_AddCounterFromProgress
    b L_02019f44
L_02019e5c:
    bl GamePhaseProgress_GetOrCreateGlobal
    mov r1, r4
    bl GamePhaseProgressController_SetCounter
    b L_02019f44
L_02019e6c:
    bl GamePhaseProgress_GetOrCreateGlobal
    ldr r1, [r0, #0x0]
    mov r0, r5
    bl GamePhaseScriptVm_StoreResultAndUpdateCondition
    b L_02019f44
L_02019e80:
    bl GamePhaseProgress_GetOrCreateGlobal
    mov r1, r4
    bl GamePhaseProgressController_SetStage
    b L_02019f44
L_02019e90:
    bl GamePhaseProgress_GetOrCreateGlobal
    mov r1, r4
    bl GamePhaseProgressController_GetAdjustedThreshold
    mov r1, r0
    mov r0, r5
    bl GamePhaseScriptVm_StoreResultAndUpdateCondition
    b L_02019f44
L_02019eac:
    bl GamePhaseProgress_GetOrCreateGlobal
    mov r1, r4
    bl GamePhaseProgressController_AddProgress
    b L_02019f44
L_02019ebc:
    bl GamePhaseProgress_GetOrCreateGlobal
    bl GamePhaseProgressController_CanAdvanceStage
    cmp r0, #0x0
    movne r1, #0x1
    moveq r1, #0x0
    mov r0, r5
    bl GamePhaseScriptVm_StoreResultAndUpdateCondition
    b L_02019f44
L_02019edc:
    bl GamePhaseProgress_GetOrCreateGlobal
    bl GamePhaseProgressController_AdvanceStage
    b L_02019f44
L_02019ee8:
    bl GamePhaseProgress_GetOrCreateGlobal
    bl GamePhaseProgressController_GetStage
    mov r1, r0
    mov r0, r5
    bl GamePhaseScriptVm_StoreResultAndUpdateCondition
    b L_02019f44
L_02019f00:
    bl GamePhaseProgress_GetOrCreateGlobal
    bl GamePhaseProgressController_ClassifyProgress
    mov r1, r0
    mov r0, r5
    bl GamePhaseScriptVm_StoreResultAndUpdateCondition
    b L_02019f44
L_02019f18:
    bl GamePhaseProgress_GetOrCreateGlobal
    mov r1, r4
    bl GamePhaseProgressController_SetComparisonStage
    b L_02019f44
L_02019f28:
    bl GamePhaseProgress_GetOrCreateGlobal
    bl GamePhaseProgressController_IsBehindComparisonStage
    cmp r0, #0x0
    movne r1, #0x1
    moveq r1, #0x0
    mov r0, r5
    bl GamePhaseScriptVm_StoreResultAndUpdateCondition
L_02019f44:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.size GamePhaseActorScriptVm_DispatchGamePhaseProgressCommand, . - GamePhaseActorScriptVm_DispatchGamePhaseProgressCommand
