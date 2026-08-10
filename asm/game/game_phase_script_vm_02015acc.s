; Matching retail form; see src/game/game_phase_script_vm_actor_rect_opcodes.c.
.text
.extern RectS16_Copy
.extern func_02008354
.extern GamePhaseScriptVm_Pop
.global GamePhaseActorScriptVm_ExpandActorRectangleRight
GamePhaseActorScriptVm_ExpandActorRectangleRight:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #8
    mov r5, r0
    bl GamePhaseScriptVm_Pop
    ldr r1, [r5, #0x84]
    mov r4, r0
    add r0, sp, #0
    add r1, r1, #0x68
    bl RectS16_Copy
    ldrsh r0, [sp, #4]
    add r1, sp, #0
    add r0, r0, r4
    strh r0, [sp, #4]
    ldr r0, [r5, #0x84]
    add r0, r0, #0x68
    bl func_02008354
    mov r0, #0
    add sp, sp, #8
    ldmia sp!, {r3, r4, r5, pc}
    .size GamePhaseActorScriptVm_ExpandActorRectangleRight, . - GamePhaseActorScriptVm_ExpandActorRectangleRight
