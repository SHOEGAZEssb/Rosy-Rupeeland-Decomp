; Matching retail form; see src/game/game_phase_script_vm_lifecycle.c.
.text

    .global GamePhaseScriptVm_Reset
GamePhaseScriptVm_Reset: ; 0x02012584
    mov r2, #0x0
    strb r2, [r0, #0x7d]
    str r2, [r0, #0x4]
    str r2, [r0, #0x8]
    mov r3, r2
L_02012598:
    add r1, r0, r2, lsl #0x2
    add r2, r2, #0x1
    str r3, [r1, #0x2c]
    cmp r2, #0x8
    blt L_02012598
    mov ip, #0x0
L_020125b0:
    add r1, r0, r3, lsl #0x2
    add r3, r3, #0x1
    str ip, [r1, #0x4c]
    cmp r3, #0xc
    blt L_020125b0
    mov r2, #0x0
L_020125c8:
    add r1, r0, ip, lsl #0x2
    add ip, ip, #0x1
    str r2, [r1, #0xc]
    cmp ip, #0x8
    blt L_020125c8
    strb r2, [r0, #0x7c]
    strb r2, [r0, #0x7f]
    str r2, [r0, #0x80]
    bx lr
    .size GamePhaseScriptVm_Reset, . - GamePhaseScriptVm_Reset

