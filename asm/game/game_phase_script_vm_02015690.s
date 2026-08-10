; Matching retail form; see src/game/game_phase_script_vm_debug_ui_opcodes.c.
.text
.extern func_0201da9c

    .global GamePhaseActorScriptVm_CreateOverlay60PresentationPreset136f
GamePhaseActorScriptVm_CreateOverlay60PresentationPreset136f: ; 0x02015690
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x8
    ldr r1, L_020156c4
    mov r2, #0x79
    str r2, [sp, #0x0]
    mov ip, #0x7a
    add r2, r1, #0x1
    add r3, r1, #0x2
    str ip, [sp, #0x4]
    bl func_0201da9c
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r3, pc}
L_020156c4: .word 0x136f
    .size GamePhaseActorScriptVm_CreateOverlay60PresentationPreset136f, . - GamePhaseActorScriptVm_CreateOverlay60PresentationPreset136f

