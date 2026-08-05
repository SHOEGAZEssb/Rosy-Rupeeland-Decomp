; Matching retail form; see src/game/game_phase_script_vm_misc_runtime_opcodes.c.
.text
.extern func_02012704
.global func_0201a00c
func_0201a00c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02012704
    ldr r1, [r4, #0x84]
    cmp r0, #0x0
    ldrne r0, [r1, #0x14]
    orrne r0, r0, #0x8000000
    ldreq r0, [r1, #0x14]
    biceq r0, r0, #0x8000000
    str r0, [r1, #0x14]
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.size func_0201a00c, . - func_0201a00c
