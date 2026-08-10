; Matching retail form; see src/game/game_phase_script_vm_byte_read_helpers.c.
.text
.global GamePhaseScriptVm_ReadS16Le
GamePhaseScriptVm_ReadS16Le: ; 0x0201b260
    ldrb r1, [r0, #0x0]
    ldrsb r0, [r0, #0x1]
    orr r0, r1, r0, lsl #0x8
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0x10
    bx lr
.size GamePhaseScriptVm_ReadS16Le, . - GamePhaseScriptVm_ReadS16Le
