; Matching retail form; see src/game/game_phase_script_vm_actor_presentation_opcodes.c.
.text
.extern func_02012704

    .global GamePhaseActorScriptVm_SetAttachmentAngleFromByte
GamePhaseActorScriptVm_SetAttachmentAngleFromByte: ; 0x02014314
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02012704
    mov r1, r0, lsl #0x8
    ldr r0, [r4, #0x84]
    rsb r2, r1, #0x10000
    ldr r1, [r0, #0x54]
    mov r0, #0x0
    strh r2, [r1, #0x30]
    ldmia sp!, {r4, pc}
    .size GamePhaseActorScriptVm_SetAttachmentAngleFromByte, . - GamePhaseActorScriptVm_SetAttachmentAngleFromByte

