; Matching retail form; see src/game/game_phase_script_vm_geometry_opcodes.c.
.text
.extern GamePhaseScriptVm_Pop
.extern GamePhaseScriptVm_SetResult
.extern func_020adc40

    .global func_020155a4
func_020155a4: ; 0x020155a4
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r0
    bl GamePhaseScriptVm_Pop
    mov r4, r0
    mov r0, r5
    bl GamePhaseScriptVm_Pop
    mov r6, r0
    mov r0, r5
    bl GamePhaseScriptVm_Pop
    ldr r2, [r5, #0x84]
    ldr r1, [r2, #0x20]
    ldr ip, [r2, #0x1c]
    sub r3, r6, r1, asr #0xc
    mul r1, r3, r3
    sub r3, r0, ip, asr #0xc
    mla r0, r3, r3, r1
    ldr r2, [r2, #0x24]
    sub r1, r4, r2, asr #0xc
    mla r0, r1, r1, r0
    bl func_020adc40
    mov r1, r0, asr #0x5
    add r1, r0, r1, lsr #0x1a
    mov r0, r5
    mov r1, r1, asr #0x6
    bl GamePhaseScriptVm_SetResult
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
    .size func_020155a4, . - func_020155a4

