; Matching retail form; see src/game/game_phase_script_vm_audio_actor_state_opcodes.c.
.text
.extern func_02074038
.global func_02019a6c
func_02019a6c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x84]
    ldr r1, [r0, #0x58]
    ldr r0, [r1, #0x0]
    bl func_02074038
    ldr r1, [r4, #0x84]
    mov r0, #0x0
    str r0, [r1, #0x58]
    ldr r2, [r4, #0x84]
    ldr r1, [r2, #0x14]
    bic r1, r1, #0x1
    str r1, [r2, #0x14]
    ldmia sp!, {r4, pc}
.size func_02019a6c, . - func_02019a6c
