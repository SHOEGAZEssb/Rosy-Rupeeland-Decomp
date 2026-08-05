; Matching retail form; see src/game/game_phase_script_vm_audio_actor_state_opcodes.c.
.text
.extern func_020020ec
.extern func_020021c4
.extern func_02012704
.extern func_020127f8
.global func_0201999c
func_0201999c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    bl func_02012704
    mov r4, r0
    bl func_020021c4
    mov r1, r4
    bl func_020020ec
    ldrh r1, [r0, #0x6]
    mov r0, r5
    bl func_020127f8
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.size func_0201999c, . - func_0201999c
