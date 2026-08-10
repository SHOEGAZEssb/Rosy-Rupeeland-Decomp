; Matching retail form; see src/game/game_phase_script_vm_actor_local_state_opcodes.c.
.text
.extern GamePhaseScriptVm_Pop

    .global func_02013cf8
func_02013cf8: ; 0x02013cf8
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    bl GamePhaseScriptVm_Pop
    mov r4, r0
    mov r0, r5
    bl GamePhaseScriptVm_Pop
    cmp r0, #0x0
    beq L_02013d30
    cmp r0, #0x1
    ldreq r1, [r5, #0x84]
    ldreq r0, [r1, #0x14]
    biceq r0, r0, #0x80
    streq r0, [r1, #0x14]
    b L_02013d60
L_02013d30:
    ldr r0, [r5, #0x84]
    and r1, r4, #0xff
    ldr r0, [r0, #0x54]
    strb r1, [r0, #0x3a]
    ldr r0, [r5, #0x84]
    ldr r0, [r0, #0x58]
    cmp r0, #0x0
    strneb r1, [r0, #0x3a]
    ldr r1, [r5, #0x84]
    ldr r0, [r1, #0x14]
    orr r0, r0, #0x80
    str r0, [r1, #0x14]
L_02013d60:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
    .size func_02013cf8, . - func_02013cf8

