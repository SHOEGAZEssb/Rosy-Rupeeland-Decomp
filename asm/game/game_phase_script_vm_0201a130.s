; Matching retail form; see src/game/game_phase_script_vm_visual_effect_control_opcode.c.
.text
.extern data_021052fc
.extern GamePhaseVisualEffect_SetEnabled
.extern GamePhaseVisualEffect_SetBlendCoefficients
.extern GamePhaseScriptVm_Pop
.extern OS_Halt
.global func_0201a130
func_0201a130:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    bl GamePhaseScriptVm_Pop
    mov r4, r0
    mov r0, r6
    bl GamePhaseScriptVm_Pop
    mov r5, r0
    mov r0, r6
    bl GamePhaseScriptVm_Pop
    cmp r0, #0x1
    beq L_0201a168
    cmp r0, #0x2
    beq L_0201a1c4
    b L_0201a1e0
L_0201a168:
    cmp r5, #0x0
    cmpeq r4, #0x0
    bne L_0201a190
    ldr r0, L_0201a1ec
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r1, [r0, #0xf6c]
    bic r1, r1, #0x8
    str r1, [r0, #0xf6c]
    b L_0201a1e4
L_0201a190:
    ldr r3, L_0201a1ec
    mov r1, r5
    ldr r0, [r3, #0x0]
    mov r2, r4
    add r0, r0, #0x2000
    ldr ip, [r0, #0xf6c]
    orr ip, ip, #0x8
    str ip, [r0, #0xf6c]
    ldr r0, [r3, #0x0]
    add r0, r0, #0x2d8
    add r0, r0, #0x2c00
    bl GamePhaseVisualEffect_SetBlendCoefficients
    b L_0201a1e4
L_0201a1c4:
    ldr r0, L_0201a1ec
    mov r1, r5
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2d8
    add r0, r0, #0x2c00
    bl GamePhaseVisualEffect_SetEnabled
    b L_0201a1e4
L_0201a1e0:
    bl OS_Halt
L_0201a1e4:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
L_0201a1ec: .word data_021052fc
.size func_0201a130, . - func_0201a130
