; Matching retail form; see src/game/game_phase_script_vm_sound_command_opcode.c.
.text
.extern GamePhaseScriptVm_Pop
.extern GamePhaseScriptVm_StoreResultAndUpdateCondition
.extern Sound_Play
.extern Sound_StopEffect
.extern Sound_PlayOwnedEffect
.extern Sound_IsEffectPlaying
.extern Sound_StopAllDirectSequences
.extern Sound_IsDirectSequencePlaying
.extern func_020594ec
.extern Sound_StopStream
.extern Sound_LoadGroup
.extern Sound_ReleaseGroup
.extern Sound_SetCaptureEnabled
.extern Sound_SetCaptureRoute0Enabled
.extern Sound_SetCaptureRoute1Enabled
.extern Sound_SetDirectCaptureRoutesEnabled
.extern SoundPhaseDatabaseManager_Update
.extern SoundPhaseManager_RequestAlternateTransition
.extern gSoundContext
.global func_0201a614
func_0201a614: ; 0x0201a614
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x8
    mov r5, r0
    bl GamePhaseScriptVm_Pop
    mov r4, r0
    mov r0, r5
    bl GamePhaseScriptVm_Pop
    cmp r0, #0x22
    addls pc, pc, r0, lsl #0x2
    b L_0201a928
L_0201a63c: ; jump table
    b L_0201a6c8 ; case 0
    b L_0201a6e8 ; case 1
    b L_0201a708 ; case 2
    b L_0201a73c ; case 3
    b L_0201a768 ; case 4
    b L_0201a77c ; case 5
    b L_0201a7a0 ; case 6
    b L_0201a7b8 ; case 7
    b L_0201a7cc ; case 8
    b L_0201a7e0 ; case 9
    b L_0201a7f4 ; case 10
    b L_0201a824 ; case 11
    b L_0201a85c ; case 12
    b L_0201a894 ; case 13
    b L_0201a8cc ; case 14
    b L_0201a928 ; case 15
    b L_0201a928 ; case 16
    b L_0201a928 ; case 17
    b L_0201a928 ; case 18
    b L_0201a928 ; case 19
    b L_0201a928 ; case 20
    b L_0201a928 ; case 21
    b L_0201a928 ; case 22
    b L_0201a928 ; case 23
    b L_0201a928 ; case 24
    b L_0201a928 ; case 25
    b L_0201a928 ; case 26
    b L_0201a928 ; case 27
    b L_0201a928 ; case 28
    b L_0201a928 ; case 29
    b L_0201a928 ; case 30
    b L_0201a928 ; case 31
    b L_0201a928 ; case 32
    b L_0201a928 ; case 33
    b L_0201a8fc ; case 34
L_0201a6c8:
    ldr r1, L_0201a934
    mov r0, r4, lsl #0x10
    mov r2, r0, lsr #0x10
    ldr r0, [r1, #0x0]
    mov r1, r2, asr #0x7
    and r2, r2, #0x7f
    bl Sound_Play
    b L_0201a928
L_0201a6e8:
    ldr r1, L_0201a934
    mov r0, r4, lsl #0x10
    mov r2, r0, lsr #0x10
    ldr r0, [r1, #0x0]
    mov r1, r2, asr #0x7
    and r2, r2, #0x7f
    bl Sound_StopEffect
    b L_0201a928
L_0201a708:
    mov r0, #0x0
    str r0, [sp, #0x0]
    mov r0, #0x100
    str r0, [sp, #0x4]
    ldr r1, L_0201a934
    mov r0, r4, lsl #0x10
    mov r2, r0, lsr #0x10
    ldr r0, [r1, #0x0]
    ldr r3, [r5, #0x84]
    mov r1, r2, asr #0x7
    and r2, r2, #0x7f
    bl Sound_PlayOwnedEffect
    b L_0201a928
L_0201a73c:
    ldr r1, L_0201a934
    mov r0, r4, lsl #0x10
    mov r2, r0, lsr #0x10
    ldr r0, [r1, #0x0]
    mov r1, r2, asr #0x7
    and r2, r2, #0x7f
    bl Sound_IsEffectPlaying
    mov r1, r0
    mov r0, r5
    bl GamePhaseScriptVm_StoreResultAndUpdateCondition
    b L_0201a928
L_0201a768:
    ldr r0, L_0201a934
    mov r1, r4
    ldr r0, [r0, #0x0]
    bl Sound_StopAllDirectSequences
    b L_0201a928
L_0201a77c:
    ldr r0, L_0201a934
    mov r1, r4, lsl #0x10
    ldr r0, [r0, #0x0]
    mov r1, r1, lsr #0x10
    bl Sound_IsDirectSequencePlaying
    mov r1, r0
    mov r0, r5
    bl GamePhaseScriptVm_StoreResultAndUpdateCondition
    b L_0201a928
L_0201a7a0:
    ldr r0, L_0201a934
    mov r1, r4, lsl #0x10
    ldr r0, [r0, #0x0]
    mov r1, r1, lsr #0x10
    bl func_020594ec
    b L_0201a928
L_0201a7b8:
    ldr r0, L_0201a934
    mov r1, r4
    ldr r0, [r0, #0x0]
    bl Sound_StopStream
    b L_0201a928
L_0201a7cc:
    ldr r0, L_0201a934
    mov r1, r4
    ldr r0, [r0, #0x0]
    bl Sound_LoadGroup
    b L_0201a928
L_0201a7e0:
    ldr r0, L_0201a934
    mov r1, r4
    ldr r0, [r0, #0x0]
    bl Sound_ReleaseGroup
    b L_0201a928
L_0201a7f4:
    cmp r4, #0x1
    bne L_0201a810
    ldr r0, L_0201a934
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl Sound_SetCaptureEnabled
    b L_0201a928
L_0201a810:
    ldr r0, L_0201a934
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    bl Sound_SetCaptureEnabled
    b L_0201a928
L_0201a824:
    cmp r4, #0x1
    mov r2, #0x14
    mov r3, #0x1e
    bne L_0201a848
    ldr r0, L_0201a934
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl Sound_SetCaptureRoute0Enabled
    b L_0201a928
L_0201a848:
    ldr r0, L_0201a934
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    bl Sound_SetCaptureRoute0Enabled
    b L_0201a928
L_0201a85c:
    cmp r4, #0x1
    mov r2, #0x14
    mov r3, #0x1e
    bne L_0201a880
    ldr r0, L_0201a934
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl Sound_SetCaptureRoute1Enabled
    b L_0201a928
L_0201a880:
    ldr r0, L_0201a934
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    bl Sound_SetCaptureRoute1Enabled
    b L_0201a928
L_0201a894:
    cmp r4, #0x1
    mov r2, #0x14
    mov r3, #0x1e
    bne L_0201a8b8
    ldr r0, L_0201a934
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl Sound_SetDirectCaptureRoutesEnabled
    b L_0201a928
L_0201a8b8:
    ldr r0, L_0201a934
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    bl Sound_SetDirectCaptureRoutesEnabled
    b L_0201a928
L_0201a8cc:
    cmp r4, #0x1
    bne L_0201a8e8
    ldr r0, L_0201a934
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl SoundPhaseDatabaseManager_Update
    b L_0201a928
L_0201a8e8:
    ldr r0, L_0201a934
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    bl SoundPhaseDatabaseManager_Update
    b L_0201a928
L_0201a8fc:
    cmp r4, #0x1
    bne L_0201a918
    ldr r0, L_0201a934
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl SoundPhaseManager_RequestAlternateTransition
    b L_0201a928
L_0201a918:
    ldr r0, L_0201a934
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    bl SoundPhaseManager_RequestAlternateTransition
L_0201a928:
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, pc}
L_0201a934: .word gSoundContext
.size func_0201a614, . - func_0201a614
