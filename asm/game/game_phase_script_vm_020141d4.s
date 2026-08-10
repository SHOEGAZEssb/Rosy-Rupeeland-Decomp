; Matching retail form; see src/game/game_phase_script_vm_display_opcodes.c.
.text
.extern DisplayBrightness_StartMainTransition
.extern DisplayBrightness_StartSubTransition
.extern GamePhaseScriptVm_Pop

    .global func_020141d4
func_020141d4: ; 0x020141d4
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    bl GamePhaseScriptVm_Pop
    mov r4, r0
    mov r0, r5
    bl GamePhaseScriptVm_Pop
    cmp r0, #0x0
    beq L_02014220
    tst r4, #0x1
    beq L_02014208
    mov r0, #0x1
    mov r1, #0x10
    bl DisplayBrightness_StartMainTransition
L_02014208:
    tst r4, #0x2
    beq L_02014248
    mov r0, #0x1
    mov r1, #0x10
    bl DisplayBrightness_StartSubTransition
    b L_02014248
L_02014220:
    tst r4, #0x1
    beq L_02014234
    mov r0, #0x2
    mov r1, #0x10
    bl DisplayBrightness_StartMainTransition
L_02014234:
    tst r4, #0x2
    beq L_02014248
    mov r0, #0x2
    mov r1, #0x10
    bl DisplayBrightness_StartSubTransition
L_02014248:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
    .size func_020141d4, . - func_020141d4

