; Matching retail form; see src/game/game_phase_script_vm_optional_object_control_opcode.c.
.text
.extern GamePhaseScriptVm_Pop
.extern ActorDerivedType1_GetSingletonObject
.extern func_ov088_02218130
.extern func_ov088_0221a8c4
.global GamePhaseActorScriptVm_DispatchOptionalSingletonControl
GamePhaseActorScriptVm_DispatchOptionalSingletonControl:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r4, r0
    bl GamePhaseScriptVm_Pop
    mov r0, r4
    bl GamePhaseScriptVm_Pop
    mov r0, r4
    bl GamePhaseScriptVm_Pop
    mov r7, r0
    mov r0, r4
    bl GamePhaseScriptVm_Pop
    mov r6, r0
    mov r0, r4
    bl GamePhaseScriptVm_Pop
    mov r5, r0
    mov r0, r4
    bl GamePhaseScriptVm_Pop
    mov r4, r0
    bl ActorDerivedType1_GetSingletonObject
    cmp r4, #0x5
    addls pc, pc, r4, lsl #0x2
    b L_0201a2fc
L_0201a244: ; jump table
    b L_0201a25c ; case 0
    b L_0201a2fc ; case 1
    b L_0201a26c ; case 2
    b L_0201a27c ; case 3
    b L_0201a2a8 ; case 4
    b L_0201a2d4 ; case 5
L_0201a25c:
    mov r1, r6
    mov r2, r7
    bl func_ov088_02218130 ; func_ov095_02218130
    b L_0201a2fc
L_0201a26c:
    cmp r0, #0x0
    beq L_0201a2fc
    bl func_ov088_0221a8c4
    b L_0201a2fc
L_0201a27c:
    cmp r0, #0x0
    beq L_0201a2fc
    add r0, r0, #0x200
    cmp r5, #0x0
    ldrneh r1, [r0, #0x1a]
    bicne r1, r1, #0x8000
    strneh r1, [r0, #0x1a]
    ldreqh r1, [r0, #0x1a]
    orreq r1, r1, #0x8000
    streqh r1, [r0, #0x1a]
    b L_0201a2fc
L_0201a2a8:
    cmp r0, #0x0
    beq L_0201a2fc
    add r0, r0, #0x200
    cmp r5, #0x0
    ldrneh r1, [r0, #0x1a]
    orrne r1, r1, #0x8
    strneh r1, [r0, #0x1a]
    ldreqh r1, [r0, #0x1a]
    biceq r1, r1, #0x8
    streqh r1, [r0, #0x1a]
    b L_0201a2fc
L_0201a2d4:
    cmp r0, #0x0
    beq L_0201a2fc
    add r0, r0, #0x200
    cmp r5, #0x0
    ldrneh r1, [r0, #0x1a]
    orrne r1, r1, #0x4
    strneh r1, [r0, #0x1a]
    ldreqh r1, [r0, #0x1a]
    biceq r1, r1, #0x4
    streqh r1, [r0, #0x1a]
L_0201a2fc:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.size GamePhaseActorScriptVm_DispatchOptionalSingletonControl, . - GamePhaseActorScriptVm_DispatchOptionalSingletonControl
