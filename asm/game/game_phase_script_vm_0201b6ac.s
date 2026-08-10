; Matching retail form; see src/game/game_phase_script_vm_multiply_divide_opcodes.c.
.text
.extern func_020befec
.extern GamePhaseScriptVm_UpdateZeroFlag
.global func_0201b6ac
func_0201b6ac: ; 0x0201b6ac
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    add r5, r4, #0x2c
    ldrb r2, [r0, #0x0]
    add r1, r0, #0x1
    mov r0, r2, asr #0x4
    and r0, r0, #0x7
    str r1, [r4, #0x4]
    add r1, r4, r0, lsl #0x2
    and r6, r2, #0x7
    ldr r0, [r5, r6, lsl #0x2]
    ldr r1, [r1, #0x2c]
    bl func_020befec
    str r1, [r5, r6, lsl #0x2]
    mov r0, r4
    mov r1, r6
    bl GamePhaseScriptVm_UpdateZeroFlag
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.size func_0201b6ac, . - func_0201b6ac
