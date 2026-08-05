; Matching retail form; see src/game/game_phase_script_vm_audio_actor_state_opcodes.c.
.text
.extern func_02001f40
.extern func_020020ec
.extern func_020021c4
.extern func_02012704
.global func_02019978
func_02019978:
    stmdb sp!, {r4, lr}
    bl func_02012704
    mov r4, r0
    bl func_020021c4
    mov r1, r4
    bl func_020020ec
    bl func_02001f40
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.size func_02019978, . - func_02019978
