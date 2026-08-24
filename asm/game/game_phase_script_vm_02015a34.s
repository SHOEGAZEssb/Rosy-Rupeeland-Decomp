; Matching retail form; see src/game/game_phase_script_vm_actor_rect_opcodes.c.
.text
.extern RectS16_Copy
.extern RectS16_Assign
.extern GamePhaseScriptVm_Pop
.global GamePhaseActorScriptVm_ExpandActorRectangleLeft
GamePhaseActorScriptVm_ExpandActorRectangleLeft:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #8
    mov r5, r0
    bl GamePhaseScriptVm_Pop
    ldr r1, [r5, #0x84]
    mov r4, r0
    add r0, sp, #0
    add r1, r1, #0x68
    bl RectS16_Copy
    ldrsh r0, [sp]
    add r1, sp, #0
    sub r0, r0, r4
    strh r0, [sp]
    ldr r0, [r5, #0x84]
    add r0, r0, #0x68
    bl RectS16_Assign
    mov r0, #0
    add sp, sp, #8
    ldmia sp!, {r3, r4, r5, pc}
    .size GamePhaseActorScriptVm_ExpandActorRectangleLeft, . - GamePhaseActorScriptVm_ExpandActorRectangleLeft
