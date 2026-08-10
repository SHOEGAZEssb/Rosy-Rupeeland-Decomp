; Matching retail form; see src/game/game_phase_script_vm_lifecycle.c.
.text

    .global GamePhaseScriptVm_CopyState
GamePhaseScriptVm_CopyState: ; 0x02012668
    ldr r2, [r1, #0x4]
    mov ip, #0x0
    str r2, [r0, #0x4]
    ldr r2, [r1, #0x8]
    str r2, [r0, #0x8]
L_0201267c:
    add r2, r1, ip, lsl #0x2
    ldr r3, [r2, #0x2c]
    add r2, r0, ip, lsl #0x2
    add ip, ip, #0x1
    str r3, [r2, #0x2c]
    cmp ip, #0x8
    blt L_0201267c
    mov ip, #0x0
L_0201269c:
    add r2, r1, ip, lsl #0x2
    ldr r3, [r2, #0x4c]
    add r2, r0, ip, lsl #0x2
    add ip, ip, #0x1
    str r3, [r2, #0x4c]
    cmp ip, #0xc
    blt L_0201269c
    mov ip, #0x0
L_020126bc:
    add r2, r1, ip, lsl #0x2
    ldr r3, [r2, #0xc]
    add r2, r0, ip, lsl #0x2
    add ip, ip, #0x1
    str r3, [r2, #0x4c]
    cmp ip, #0x8
    blt L_020126bc
    ldrsb r2, [r1, #0x7c]
    strb r2, [r0, #0x7c]
    ldrb r2, [r1, #0x7d]
    strb r2, [r0, #0x7d]
    ldrsb r2, [r1, #0x7e]
    strb r2, [r0, #0x7e]
    ldrsb r2, [r1, #0x7f]
    strb r2, [r0, #0x7f]
    ldr r1, [r1, #0x80]
    str r1, [r0, #0x80]
    bx lr
    .size GamePhaseScriptVm_CopyState, . - GamePhaseScriptVm_CopyState

