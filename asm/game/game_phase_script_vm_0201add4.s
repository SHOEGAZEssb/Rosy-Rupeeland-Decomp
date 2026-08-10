; Matching retail form; see src/game/game_phase_script_vm_rectangle_point_query_opcode.c.
.text
.extern GamePhaseScriptVm_Pop
.extern GamePhaseScriptVm_SetResult
.extern RectS32_Init
.extern RectS32_ContainsPoint
.global GamePhaseActorScriptVm_IsPointInRectangle
GamePhaseActorScriptVm_IsPointInRectangle: ; 0x0201add4
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x14
    mov r9, r0
    bl GamePhaseScriptVm_Pop
    mov r8, r0
    mov r0, r9
    bl GamePhaseScriptVm_Pop
    mov r7, r0
    mov r0, r9
    bl GamePhaseScriptVm_Pop
    mov r6, r0
    mov r0, r9
    bl GamePhaseScriptVm_Pop
    mov r4, r0
    mov r0, r9
    bl GamePhaseScriptVm_Pop
    mov r5, r0
    mov r0, r9
    bl GamePhaseScriptVm_Pop
    mov r1, r4
    mov r4, r0
    mov r2, r6
    mov r3, r7
    add r0, sp, #0x4
    str r8, [sp, #0x0]
    bl RectS32_Init
    mov r1, r4
    mov r2, r5
    add r0, sp, #0x4
    bl RectS32_ContainsPoint
    mov r1, r0
    mov r0, r9
    bl GamePhaseScriptVm_SetResult
    mov r0, #0x0
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.size GamePhaseActorScriptVm_IsPointInRectangle, . - GamePhaseActorScriptVm_IsPointInRectangle
