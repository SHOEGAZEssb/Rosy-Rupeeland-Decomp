; Matching retail form; see src/game/game_phase_script_vm_actor_interaction_bounds_opcode.c.
.text
.extern func_02008354
.extern func_020083b0
.extern S16Rectangle_Translate
.extern GamePhaseScriptVm_Pop
.extern S16Bounds_GetHeight
.extern CPoint2DS16_InitFromRectangle
.extern S16Bounds_MoveTo
.extern S16Bounds_GetWidth
.extern S16Bounds_Expand
.global GamePhaseActorScriptVm_DispatchInteractionBoundsCommand
GamePhaseActorScriptVm_DispatchInteractionBoundsCommand:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x2c
    mov r8, r0
    bl GamePhaseScriptVm_Pop
    mov r1, r0, lsl #0x10
    mov r0, r8
    mov r4, r1, asr #0x10
    bl GamePhaseScriptVm_Pop
    mov r1, r0, lsl #0x10
    mov r0, r8
    mov r5, r1, asr #0x10
    bl GamePhaseScriptVm_Pop
    mov r1, r0, lsl #0x10
    mov r0, r8
    mov r6, r1, asr #0x10
    bl GamePhaseScriptVm_Pop
    mov r1, r0, lsl #0x10
    mov r0, r8
    mov r7, r1, asr #0x10
    bl GamePhaseScriptVm_Pop
    cmp r0, #0x9
    addls pc, pc, r0, lsl #0x2
    b L_02018c08
L_02018a40: ; jump table
    b L_02018c08 ; case 0
    b L_02018a68 ; case 1
    b L_02018a94 ; case 2
    b L_02018aa4 ; case 3
    b L_02018ab4 ; case 4
    b L_02018ac0 ; case 5
    b L_02018acc ; case 6
    b L_02018b54 ; case 7
    b L_02018bdc ; case 8
    b L_02018bf4 ; case 9
L_02018a68:
    add r0, sp, #0x14
    mov r1, r7
    mov r2, r6
    mov r3, r5
    str r4, [sp, #0x0]
    bl func_020083b0
    ldr r0, [r8, #0x84]
    add r1, sp, #0x14
    add r0, r0, #0x60
    bl func_02008354
    b L_02018c08
L_02018a94:
    ldr r0, [r8, #0x84]
    rsb r1, r7, #0x0
    strh r1, [r0, #0x60]
    b L_02018c08
L_02018aa4:
    ldr r0, [r8, #0x84]
    rsb r1, r7, #0x0
    strh r1, [r0, #0x62]
    b L_02018c08
L_02018ab4:
    ldr r0, [r8, #0x84]
    strh r7, [r0, #0x64]
    b L_02018c08
L_02018ac0:
    ldr r0, [r8, #0x84]
    strh r7, [r0, #0x66]
    b L_02018c08
L_02018acc:
    ldr r0, [r8, #0x84]
    add r0, r0, #0x60
    bl S16Bounds_GetHeight
    ldr r1, [r8, #0x84]
    mov r4, r0
    add r0, sp, #0x24
    add r1, r1, #0x60
    bl CPoint2DS16_InitFromRectangle
    mov r1, #0x0
    add r0, sp, #0xc
    mov r2, r1
    str r4, [sp, #0x0]
    mov r3, r7
    bl func_020083b0
    ldr r0, [r8, #0x84]
    add r1, sp, #0xc
    add r0, r0, #0x60
    bl func_02008354
    rsb r0, r7, #0x0
    ldr r2, [r8, #0x84]
    add r1, r0, r0, lsr #0x1f
    add r0, r2, #0x60
    rsb r2, r4, #0x0
    ldrsh r4, [sp, #0x28]
    ldrsh r3, [sp, #0x2a]
    add r2, r2, r2, lsr #0x1f
    add r1, r4, r1, asr #0x1
    add r2, r3, r2, asr #0x1
    mov r1, r1, lsl #0x10
    mov r2, r2, lsl #0x10
    mov r1, r1, asr #0x10
    mov r2, r2, asr #0x10
    bl S16Bounds_MoveTo
    b L_02018c08
L_02018b54:
    ldr r0, [r8, #0x84]
    add r0, r0, #0x60
    bl S16Bounds_GetWidth
    ldr r1, [r8, #0x84]
    mov r4, r0
    add r0, sp, #0x1c
    add r1, r1, #0x60
    bl CPoint2DS16_InitFromRectangle
    mov r1, #0x0
    add r0, sp, #0x4
    mov r2, r1
    str r7, [sp, #0x0]
    mov r3, r4
    bl func_020083b0
    ldr r0, [r8, #0x84]
    add r1, sp, #0x4
    add r0, r0, #0x60
    bl func_02008354
    rsb r0, r4, #0x0
    ldr r2, [r8, #0x84]
    add r1, r0, r0, lsr #0x1f
    ldrsh r4, [sp, #0x20]
    add r0, r2, #0x60
    rsb r2, r7, #0x0
    add r1, r4, r1, asr #0x1
    mov r1, r1, lsl #0x10
    ldrsh r3, [sp, #0x22]
    add r2, r2, r2, lsr #0x1f
    mov r1, r1, asr #0x10
    add r2, r3, r2, asr #0x1
    mov r2, r2, lsl #0x10
    mov r2, r2, asr #0x10
    bl S16Bounds_MoveTo
    b L_02018c08
L_02018bdc:
    ldr r0, [r8, #0x84]
    mov r1, r7
    mov r2, r6
    add r0, r0, #0x60
    bl S16Rectangle_Translate
    b L_02018c08
L_02018bf4:
    ldr r0, [r8, #0x84]
    mov r1, r7
    mov r2, r6
    add r0, r0, #0x60
    bl S16Bounds_Expand
L_02018c08:
    mov r0, #0x0
    add sp, sp, #0x2c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.size GamePhaseActorScriptVm_DispatchInteractionBoundsCommand, . - GamePhaseActorScriptVm_DispatchInteractionBoundsCommand
