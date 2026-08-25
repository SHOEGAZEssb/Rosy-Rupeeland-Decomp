; Matching retail form; see src/game/game_phase_script_vm_sound_parameter_opcodes.c.
.text
.extern GamePhaseScriptVm_Pop
.extern Sound_PlayDirectSequence
.extern Sound_StopDirectSequence
.extern Sound_SetDirectSequenceVolume
.extern Sound_FadeStreamVolume
.extern Sound_UpdateGroupSlot
.extern gSoundContext
.global GamePhaseActorScriptVm_DispatchTwoOperandSoundCommand
GamePhaseActorScriptVm_DispatchTwoOperandSoundCommand: ; 0x0201a938
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    bl GamePhaseScriptVm_Pop
    mov r5, r0
    mov r0, r6
    bl GamePhaseScriptVm_Pop
    mov r4, r0
    mov r0, r6
    bl GamePhaseScriptVm_Pop
    sub r0, r0, #0x15
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    b L_0201aa08
L_0201a96c: ; jump table
    b L_0201a980 ; case 0
    b L_0201a9a0 ; case 1
    b L_0201a9c0 ; case 2
    b L_0201a9dc ; case 3
    b L_0201a9f4 ; case 4
L_0201a980:
    ldr r0, L_0201aa10
    mov r1, r4, lsl #0x10
    mov r2, r5, lsl #0x10
    ldr r0, [r0, #0x0]
    mov r1, r1, lsr #0x10
    mov r2, r2, lsr #0x10
    bl Sound_PlayDirectSequence
    b L_0201aa08
L_0201a9a0:
    ldr r0, L_0201aa10
    mov r1, r4, lsl #0x10
    mov r2, r5, lsl #0x10
    ldr r0, [r0, #0x0]
    mov r1, r1, lsr #0x10
    mov r2, r2, lsr #0x10
    bl Sound_StopDirectSequence
    b L_0201aa08
L_0201a9c0:
    ldr r0, L_0201aa10
    mov r1, r4, lsl #0x10
    ldr r0, [r0, #0x0]
    mov r2, r5
    mov r1, r1, lsr #0x10
    bl Sound_SetDirectSequenceVolume
    b L_0201aa08
L_0201a9dc:
    ldr r0, L_0201aa10
    mov r1, r4
    ldr r0, [r0, #0x0]
    mov r2, r5
    bl Sound_FadeStreamVolume
    b L_0201aa08
L_0201a9f4:
    ldr r0, L_0201aa10
    mov r1, r4
    ldr r0, [r0, #0x0]
    mov r2, r5
    bl Sound_UpdateGroupSlot
L_0201aa08:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
L_0201aa10: .word gSoundContext
.size GamePhaseActorScriptVm_DispatchTwoOperandSoundCommand, . - GamePhaseActorScriptVm_DispatchTwoOperandSoundCommand
