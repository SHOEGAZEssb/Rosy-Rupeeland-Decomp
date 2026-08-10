; Matching retail form; see src/game/game_phase_script_vm_actor_opcodes.c.
.text
.extern func_0200500c
.extern func_02005058
.extern func_020050a4
.extern GamePhaseScriptVm_Pop

    .global func_02012a8c
func_02012a8c: ; 0x02012a8c
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x10
    mov r6, r0
    bl GamePhaseScriptVm_Pop
    mov r5, r0
    mov r0, r6
    bl GamePhaseScriptVm_Pop
    mov r4, r0
    mov r0, r6
    bl GamePhaseScriptVm_Pop
    mov r1, r0, lsl #0xc
    mov r2, r4, lsl #0xc
    mov r3, r5, lsl #0xc
    add r0, sp, #0x0
    bl func_0200500c
    ldr r0, [r6, #0x84]
    add r1, sp, #0x0
    add r0, r0, #0x18
    bl func_020050a4
    ldr r1, [r6, #0x84]
    add r0, r1, #0x28
    add r1, r1, #0x18
    bl func_020050a4
    add r0, sp, #0x0
    bl func_02005058
    mov r0, #0x0
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, pc}
    .size func_02012a8c, . - func_02012a8c

