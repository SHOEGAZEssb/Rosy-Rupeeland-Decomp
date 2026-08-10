; Matching retail form; see src/game/game_phase_script_vm_actor_rectangle_query_opcode.c.
.text
.extern data_021052fc
.extern func_02005030
.extern func_02005058
.extern GamePhaseRuntime_GetActorCollection
.extern GamePhaseScriptVm_Pop
.extern GamePhaseScriptVm_SetResult
.extern RectS32_Init
.extern RectS32_ContainsPoint
.extern ActorCollection_FindActorByDescriptorValue
.global GamePhaseActorScriptVm_IsCollection1ActorInRectangle
GamePhaseActorScriptVm_IsCollection1ActorInRectangle:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x24
    mov r4, r0
    bl GamePhaseScriptVm_Pop
    mov r9, r0
    mov r0, r4
    bl GamePhaseScriptVm_Pop
    mov r8, r0
    mov r0, r4
    bl GamePhaseScriptVm_Pop
    mov r7, r0
    mov r0, r4
    bl GamePhaseScriptVm_Pop
    mov r6, r0
    mov r0, r4
    bl GamePhaseScriptVm_Pop
    mov r5, r0
    ldr r0, L_02016f10
    mov r1, #1
    ldr r0, [r0]
    bl GamePhaseRuntime_GetActorCollection
    mov r1, r5
    bl ActorCollection_FindActorByDescriptorValue
    add r1, r0, #0x18
    add r0, sp, #0x14
    bl func_02005030
    str r9, [sp]
    mov r1, r6
    mov r2, r7
    mov r3, r8
    add r0, sp, #4
    bl RectS32_Init
    ldr r1, [sp, #0x18]
    ldr r2, [sp, #0x1c]
    add r0, sp, #4
    mov r1, r1, asr #12
    mov r2, r2, asr #12
    bl RectS32_ContainsPoint
    cmp r0, #0
    mov r0, r4
    beq L_02016ef4
    mov r1, #1
    bl GamePhaseScriptVm_SetResult
    b L_02016efc
L_02016ef4:
    mov r1, #0
    bl GamePhaseScriptVm_SetResult
L_02016efc:
    add r0, sp, #0x14
    bl func_02005058
    mov r0, #0
    add sp, sp, #0x24
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
L_02016f10: .word data_021052fc
    .size GamePhaseActorScriptVm_IsCollection1ActorInRectangle, . - GamePhaseActorScriptVm_IsCollection1ActorInRectangle
