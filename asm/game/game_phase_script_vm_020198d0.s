; Matching retail form; see src/game/game_phase_script_vm_audio_actor_state_opcodes.c.
.text
.extern func_02001f14
.extern func_020020ec
.extern func_020020f8
.extern func_020021c4
.extern GamePhaseScriptVm_Pop
.global GamePhaseActorScriptVm_ConfigureAndStartManagerEntry
GamePhaseActorScriptVm_ConfigureAndStartManagerEntry:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x8
    mov r7, r0
    bl GamePhaseScriptVm_Pop
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0x10
    mov r1, r0, lsl #0x10
    mov r0, r7
    mov r4, r1, lsr #0x10
    bl GamePhaseScriptVm_Pop
    mov r1, r0, lsl #0x10
    mov r0, r7
    mov r5, r1, lsr #0x10
    bl GamePhaseScriptVm_Pop
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0x10
    mov r0, r0, lsl #0x10
    mov r6, r0, lsr #0x10
    mov r0, r7
    bl GamePhaseScriptVm_Pop
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0x10
    mov r0, r0, lsl #0x10
    mov r8, r0, lsr #0x10
    mov r0, r7
    bl GamePhaseScriptVm_Pop
    mov r0, r0, lsl #0x10
    mov r7, r0, asr #0x10
    bl func_020021c4
    str r5, [sp, #0x0]
    str r4, [sp, #0x4]
    mov r2, r8
    mov r3, r6
    mov r1, r7
    bl func_020020f8
    bl func_020021c4
    mov r1, r7
    bl func_020020ec
    bl func_02001f14
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.size GamePhaseActorScriptVm_ConfigureAndStartManagerEntry, . - GamePhaseActorScriptVm_ConfigureAndStartManagerEntry
