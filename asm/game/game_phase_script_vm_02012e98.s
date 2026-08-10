; Matching retail form; see src/game/game_phase_script_vm_actor_state_opcodes.c.
.text
.extern data_02105310
.extern ActorRuntimeCollection_SelectObject
.extern GamePhaseScriptVm_Pop

    .global func_02012e98
func_02012e98: ; 0x02012e98
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    bl GamePhaseScriptVm_Pop
    mov r4, r0
    mov r0, r5
    bl GamePhaseScriptVm_Pop
    ldr r5, [r5, #0x84]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b L_02012f34
L_02012ec0: ; jump table
    b L_02012f34 ; case 0
    b L_02012f1c ; case 1
    b L_02012ed0 ; case 2
    b L_02012eec ; case 3
L_02012ed0:
    mov r0, r5
    ldr r3, [r0, #0x0]
    mov r2, r4
    ldr r3, [r3, #0xac]
    mov r1, #0x2
    blx r3
    b L_02012f34
L_02012eec:
    mov r0, r5
    ldr r3, [r0, #0x0]
    mov r2, r4
    ldr r3, [r3, #0xac]
    mov r1, #0x3
    blx r3
    ldr r0, L_02012f3c
    mov r1, r5
    mov r2, r4
    bl ActorRuntimeCollection_SelectObject
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
L_02012f1c:
    mov r0, r5
    ldr r3, [r0, #0x0]
    mov r2, r4
    ldr r3, [r3, #0xac]
    mov r1, #0x1
    blx r3
L_02012f34:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
L_02012f3c: .word data_02105310
    .size func_02012e98, . - func_02012e98

