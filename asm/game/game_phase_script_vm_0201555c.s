; Matching retail form; see src/game/game_phase_script_vm_geometry_opcodes.c.
.text
.extern func_02012704
.extern func_0203c410

    .global func_0201555c
func_0201555c: ; 0x0201555c
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02012704
    mov r1, r0
    ldr r0, [r4, #0x84]
    mov r1, r1, lsl #0x4
    bl func_0203c410
    mov r0, #0x0
    ldmia sp!, {r4, pc}
    .size func_0201555c, . - func_0201555c

