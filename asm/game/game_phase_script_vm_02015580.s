; Matching retail form; see src/game/game_phase_script_vm_geometry_opcodes.c.
.text
.extern GamePhaseScriptVm_Pop
.extern GraphicsSpriteState_SetFrameIndex

    .global GamePhaseActorScriptVm_SetAttachmentFrameIndex
GamePhaseActorScriptVm_SetAttachmentFrameIndex: ; 0x02015580
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl GamePhaseScriptVm_Pop
    ldr r2, [r4, #0x84]
    and r1, r0, #0xff
    ldr r0, [r2, #0x54]
    bl GraphicsSpriteState_SetFrameIndex
    mov r0, #0x0
    ldmia sp!, {r4, pc}
    .size GamePhaseActorScriptVm_SetAttachmentFrameIndex, . - GamePhaseActorScriptVm_SetAttachmentFrameIndex

