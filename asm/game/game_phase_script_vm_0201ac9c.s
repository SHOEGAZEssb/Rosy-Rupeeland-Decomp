; Matching retail form; see src/game/game_phase_script_vm_sound_high_arity_opcodes.c.
.text
.extern GamePhaseScriptVm_Pop
.extern Sound_ConfigureGroupSlots
.extern gSoundContext
.global GamePhaseActorScriptVm_ConfigureSoundGroupSlots
GamePhaseActorScriptVm_ConfigureSoundGroupSlots: ; 0x0201ac9c
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
    sub sp, sp, #0x10
    mov r10, r0
    bl GamePhaseScriptVm_Pop
    mov r9, r0
    mov r0, r10
    bl GamePhaseScriptVm_Pop
    mov r8, r0
    mov r0, r10
    bl GamePhaseScriptVm_Pop
    mov r7, r0
    mov r0, r10
    bl GamePhaseScriptVm_Pop
    mov r6, r0
    mov r0, r10
    bl GamePhaseScriptVm_Pop
    mov r5, r0
    mov r0, r10
    bl GamePhaseScriptVm_Pop
    mov r4, r0
    mov r0, r10
    bl GamePhaseScriptVm_Pop
    mov r1, r0
    stmia sp, {r6, r7, r8, r9}
    ldr r0, L_0201ad1c
    mov r2, r4
    ldr r0, [r0, #0x0]
    mov r3, r5
    bl Sound_ConfigureGroupSlots
    mov r0, #0x0
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
L_0201ad1c: .word gSoundContext
.size GamePhaseActorScriptVm_ConfigureSoundGroupSlots, . - GamePhaseActorScriptVm_ConfigureSoundGroupSlots
