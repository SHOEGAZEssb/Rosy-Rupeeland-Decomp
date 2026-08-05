; Matching retail form; see src/game/game_phase_script_vm_actor_control_flag_opcode.c.
.text
.extern func_02012704
.global func_020170f0
func_020170f0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02012704
    ldr r1, [r4, #0x84]
    cmp r0, #0
    ldrne r0, [r1, #0x14]
    orrne r0, r0, #0x40
    ldreq r0, [r1, #0x14]
    biceq r0, r0, #0x40
    str r0, [r1, #0x14]
    ldr r1, [r4, #0x84]
    mov r0, #0
    str r0, [r1, #0x44]
    ldmia sp!, {r4, pc}
    .size func_020170f0, . - func_020170f0
