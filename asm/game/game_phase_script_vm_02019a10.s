; Matching retail form; see src/game/game_phase_script_vm_audio_actor_state_opcodes.c.
.text
.extern func_02038aac
.global func_02019a10
func_02019a10:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x84]
    ldrsh r1, [r0, #0xe4]
    cmp r1, #0x0
    bne L_02019a3c
    bl func_02038aac
    ldr r0, [r4, #0x84]
    mov r1, #0x0
    ldr r0, [r0, #0x54]
    strh r1, [r0, #0x36]
L_02019a3c:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.size func_02019a10, . - func_02019a10
