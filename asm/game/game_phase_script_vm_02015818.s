; Matching retail form; see src/game/game_phase_script_vm_debug_wait_opcode.c.
.text
.extern GameWork_ClearFlag
.extern GameWork_SetFlag
.extern DebugHudState_Close
.extern DebugHudState_PollInput
.extern DebugHudState_GetGlobal
.extern GraphicsSpriteState_ResetFrame
.extern gGameWork

    .global GamePhaseActorScriptVm_WaitForDebugHudInput
GamePhaseActorScriptVm_WaitForDebugHudInput: ; 0x02015818
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0xc
    ldr r1, L_02015934
    mov r4, r0
    ldr r0, [r1, #0x0]
    ldr r1, L_02015938
    bl GameWork_ClearFlag
    bl DebugHudState_GetGlobal
    mov r1, #0x0
    bl DebugHudState_PollInput
    ldr r1, [r4, #0x8c]
    str r0, [sp, #0x0]
    mov r1, r1, lsl #0x1e
    movs r1, r1, asr #0x1f
    ldrne r1, [r4, #0x84]
    str r0, [sp, #0x4]
    ldrne r1, [r1, #0x54]
    str r0, [sp, #0x8]
    cmpne r1, #0x0
    beq L_020158f0
    mov r2, r0, lsl #0x17
    mov r3, r0, lsl #0x1e
    mov r2, r2, asr #0x1f
    orrs r2, r2, r3, asr #0x1f
    beq L_020158b4
    ldrh r2, [r1, #0x24]
    mov r0, r0, lsl #0x12
    movs r0, r0, asr #0x1f
    bic r0, r2, #0x2
    strh r0, [r1, #0x24]
    beq L_020158a0
    ldr r0, [r4, #0x84]
    ldr r0, [r0, #0x54]
    bl GraphicsSpriteState_ResetFrame
L_020158a0:
    ldr r0, L_02015934
    ldr r1, L_02015938
    ldr r0, [r0, #0x0]
    bl GameWork_SetFlag
    b L_020158f0
L_020158b4:
    mov r0, r0, lsl #0x1f
    movs r0, r0, asr #0x1f
    ldrneh r0, [r1, #0x24]
    bicne r0, r0, #0x2
    strneh r0, [r1, #0x24]
    bne L_020158f0
    ldrh r2, [r1, #0x24]
    and r0, r2, #0x2
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    orreq r0, r2, #0x2
    streqh r0, [r1, #0x24]
    ldreqh r0, [r1, #0x24]
    biceq r0, r0, #0x1
    streqh r0, [r1, #0x24]
L_020158f0:
    ldr r0, [sp, #0x8]
    mov r1, r0, lsl #0x1e
    movs r1, r1, asr #0x1f
    bne L_0201591c
    mov r0, r0, lsl #0x1f
    movs r0, r0, asr #0x1f
    beq L_0201591c
    bl DebugHudState_GetGlobal
    bl DebugHudState_Close
    mov r0, #0x0
    b L_0201592c
L_0201591c:
    ldr r1, [r4, #0x4]
    mov r0, #0x1
    sub r1, r1, #0x2
    str r1, [r4, #0x4]
L_0201592c:
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, pc}
L_02015934: .word gGameWork
L_02015938: .word 0x40e
    .size GamePhaseActorScriptVm_WaitForDebugHudInput, . - GamePhaseActorScriptVm_WaitForDebugHudInput

