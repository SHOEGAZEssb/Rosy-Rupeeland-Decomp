; Matching retail form; see src/game/game_phase_script_vm_actor_opcodes.c.
.text
.extern GamePhaseScriptVm_Pop

    .global func_02012c34
func_02012c34: ; 0x02012c34
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl GamePhaseScriptVm_Pop
    cmp r0, #0x0
    ldr r0, [r4, #0x84]
    ldreq r1, [r0, #0x54]
    ldreqh r0, [r1, #0x24]
    biceq r0, r0, #0x2
    beq L_02012c78
    ldr r1, [r0, #0x54]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    ldr r0, [r4, #0x84]
    ldr r1, [r0, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x20
L_02012c78:
    strh r0, [r1, #0x24]
    ldr r1, [r4, #0x84]
    mov r0, #0x0
    ldr r2, [r1, #0x54]
    ldrh r1, [r2, #0x24]
    bic r1, r1, #0x1
    strh r1, [r2, #0x24]
    ldmia sp!, {r4, pc}
    .size func_02012c34, . - func_02012c34

