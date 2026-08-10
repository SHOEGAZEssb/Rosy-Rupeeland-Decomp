; Matching retail form; see src/game/game_phase_script_vm_indexed_handler_opcode.c.
.text
.extern data_020f1678
.extern GamePhaseScriptVm_Pop
.extern GamePhaseScriptVm_SetResult
.extern func_0208372c
.global func_020192f4
func_020192f4:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    bl GamePhaseScriptVm_Pop
    mov r4, r0
    mov r0, r5
    bl GamePhaseScriptVm_Pop
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    b L_02019390
L_02019318: ; jump table
    b L_02019390 ; case 0
    b L_0201932c ; case 1
    b L_0201934c ; case 2
    b L_0201936c ; case 3
    b L_02019380 ; case 4
L_0201932c:
    mov r0, r4
    bl func_0208372c
    cmp r0, #0x2
    moveq r1, #0x1
    movne r1, #0x0
    mov r0, r5
    bl GamePhaseScriptVm_SetResult
    b L_02019390
L_0201934c:
    mov r0, r4
    bl func_0208372c
    cmp r0, #0x1
    moveq r1, #0x1
    movne r1, #0x0
    mov r0, r5
    bl GamePhaseScriptVm_SetResult
    b L_02019390
L_0201936c:
    ldr r0, L_02019398
    ldr r0, [r0, r4, lsl #0x2]
    ldr r0, [r0, #0x4]
    blx r0
    b L_02019390
L_02019380:
    ldr r0, L_02019398
    ldr r0, [r0, r4, lsl #0x2]
    ldr r0, [r0, #0x0]
    blx r0
L_02019390:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
L_02019398: .word data_020f1678
.size func_020192f4, . - func_020192f4
