; Matching retail form; see src/game/game_phase_script_vm_runtime_opcodes.c.
.text
.extern OS_Halt
.extern data_021052fc
.extern GamePhaseRuntime_GetActorCollection
.extern ActorMotion_SetMode2
.extern ActorMotion_SetMode1AndClearOutputs
.extern ActorMotion_ConfigureGridTarget
.extern ActorMotion_ConfigureBoundActorTarget
.extern ActorMotionAreaFollower_BindActor
.extern GamePhaseScriptVm_Pop
.extern GamePhaseScriptVm_SetResult
.extern ActorCollection_FindActorByRuntimeId

    .global func_02012814
func_02012814: ; 0x02012814
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x4
    mov r8, r0
    bl GamePhaseScriptVm_Pop
    mov r7, r0
    mov r0, r8
    bl GamePhaseScriptVm_Pop
    mov r6, r0
    mov r0, r8
    bl GamePhaseScriptVm_Pop
    mov r5, r0
    mov r0, r8
    bl GamePhaseScriptVm_Pop
    mov r4, r0
    mov r0, r8
    bl GamePhaseScriptVm_Pop
    cmp r0, #0xb
    addls pc, pc, r0, lsl #0x2
    b L_02012a4c
L_02012860: ; jump table
    b L_02012a4c ; case 0
    b L_02012890 ; case 1
    b L_020128c4 ; case 2
    b L_020128f0 ; case 3
    b L_02012928 ; case 4
    b L_02012950 ; case 5
    b L_02012984 ; case 6
    b L_020129ac ; case 7
    b L_020129e0 ; case 8
    b L_02012a0c ; case 9
    b L_02012a44 ; case 10
    b L_02012a50 ; case 11
L_02012890:
    ldr r0, L_02012a5c
    str r7, [sp, #0x0]
    ldr r0, [r0, #0x0]
    mov r1, r4
    add r0, r0, #0x3bc
    mov r2, r5
    mov r3, r6
    add r0, r0, #0x2c00
    bl ActorMotion_ConfigureGridTarget
    mov r1, r0
    mov r0, r8
    bl GamePhaseScriptVm_SetResult
    b L_02012a50
L_020128c4:
    ldr r0, L_02012a5c
    mov r1, r4
    ldr r0, [r0, #0x0]
    mov r2, r5
    add r0, r0, #0x3bc
    add r0, r0, #0x2c00
    bl ActorMotion_ConfigureBoundActorTarget
    mov r1, r0
    mov r0, r8
    bl GamePhaseScriptVm_SetResult
    b L_02012a50
L_020128f0:
    cmp r4, #0x0
    beq L_02012910
    ldr r0, L_02012a5c
    ldr r0, [r0, #0x0]
    add r0, r0, #0x3bc
    add r0, r0, #0x2c00
    bl ActorMotion_SetMode2
    b L_02012a50
L_02012910:
    ldr r0, L_02012a5c
    ldr r0, [r0, #0x0]
    add r0, r0, #0x3bc
    add r0, r0, #0x2c00
    bl ActorMotion_SetMode1AndClearOutputs
    b L_02012a50
L_02012928:
    ldr r0, L_02012a5c
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xfd4]
    cmp r0, #0x2
    moveq r1, #0x1
    movne r1, #0x0
    mov r0, r8
    bl GamePhaseScriptVm_SetResult
    b L_02012a50
L_02012950:
    ldr r0, L_02012a5c
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl GamePhaseRuntime_GetActorCollection
    mov r1, r4
    bl ActorCollection_FindActorByRuntimeId
    ldr r2, L_02012a5c
    mov r1, r0
    ldr r0, [r2, #0x0]
    add r0, r0, #0x3bc
    add r0, r0, #0x2c00
    bl ActorMotionAreaFollower_BindActor
    b L_02012a50
L_02012984:
    ldr r0, L_02012a5c
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xfec]
    tst r0, #0x1
    movne r1, #0x1
    moveq r1, #0x0
    mov r0, r8
    bl GamePhaseScriptVm_SetResult
    b L_02012a50
L_020129ac:
    ldr r0, L_02012a5c
    str r7, [sp, #0x0]
    ldr r0, [r0, #0x0]
    mov r1, r4
    add r0, r0, #0x44
    mov r2, r5
    mov r3, r6
    add r0, r0, #0x3000
    bl ActorMotion_ConfigureGridTarget
    mov r1, r0
    mov r0, r8
    bl GamePhaseScriptVm_SetResult
    b L_02012a50
L_020129e0:
    ldr r0, L_02012a5c
    mov r1, r4
    ldr r0, [r0, #0x0]
    mov r2, r5
    add r0, r0, #0x44
    add r0, r0, #0x3000
    bl ActorMotion_ConfigureBoundActorTarget
    mov r1, r0
    mov r0, r8
    bl GamePhaseScriptVm_SetResult
    b L_02012a50
L_02012a0c:
    cmp r4, #0x0
    beq L_02012a2c
    ldr r0, L_02012a5c
    ldr r0, [r0, #0x0]
    add r0, r0, #0x44
    add r0, r0, #0x3000
    bl ActorMotion_SetMode2
    b L_02012a50
L_02012a2c:
    ldr r0, L_02012a5c
    ldr r0, [r0, #0x0]
    add r0, r0, #0x44
    add r0, r0, #0x3000
    bl ActorMotion_SetMode1AndClearOutputs
    b L_02012a50
L_02012a44:
    bl OS_Halt
    b L_02012a50
L_02012a4c:
    bl OS_Halt
L_02012a50:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
L_02012a5c: .word data_021052fc
    .size func_02012814, . - func_02012814

