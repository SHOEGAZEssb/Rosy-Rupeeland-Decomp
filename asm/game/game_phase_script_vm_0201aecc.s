; Matching retail form; see src/game/game_phase_script_vm_runtime_entity_position_opcodes.c.
.text
.extern func_020127f8
.extern data_021052fc
.global func_0201aecc
func_0201aecc: ; 0x0201aecc
    stmdb sp!, {r3, lr}
    ldr r2, L_0201aefc
    mov r1, #0x0
    ldr r2, [r2, #0x0]
    add r2, r2, #0x2000
    ldr r2, [r2, #0xea8]
    cmp r2, #0x0
    ldrne r1, [r2, #0x24]
    movne r1, r1, asr #0xc
    bl func_020127f8
    mov r0, #0x0
    ldmia sp!, {r3, pc}
L_0201aefc: .word data_021052fc
.size func_0201aecc, . - func_0201aecc
