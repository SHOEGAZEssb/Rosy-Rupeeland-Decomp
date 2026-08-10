; Matching retail form; see src/game/game_phase_script_vm_actor_sequence_opcodes.c.
.text
.extern GamePhaseScriptVm_Pop
.extern ActorMotionProbe_ConfigureMotion
.global GamePhaseActorScriptVm_ConfigureMotionProbe
GamePhaseActorScriptVm_ConfigureMotionProbe:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #8
    mov r8, r0
    bl GamePhaseScriptVm_Pop
    mov r4, r0
    mov r0, r8
    bl GamePhaseScriptVm_Pop
    mov r5, r0
    mov r0, r8
    bl GamePhaseScriptVm_Pop
    mov r6, r0
    mov r0, r8
    bl GamePhaseScriptVm_Pop
    mov r7, r0
    mov r0, r8
    bl GamePhaseScriptVm_Pop
    str r5, [sp]
    movs r1, r0
    str r4, [sp, #4]
    movmi r1, #0
    cmp r7, #0
    movlt r7, #0
    cmp r6, #1
    movlt r6, #1
    ldr r0, [r8, #0x84]
    mov r2, r7
    mov r3, r6
    bl ActorMotionProbe_ConfigureMotion
    mov r0, #0
    add sp, sp, #8
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
    .size GamePhaseActorScriptVm_ConfigureMotionProbe, . - GamePhaseActorScriptVm_ConfigureMotionProbe
