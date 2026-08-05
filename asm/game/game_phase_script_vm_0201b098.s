; Matching retail form; see src/game/game_phase_script_vm_final_runtime_opcodes.c.
.text
.extern func_02012704
.extern func_02007f0c
.extern func_02030ad4
.extern func_020330fc
.extern data_021052fc
.global func_0201b098
func_0201b098: ; 0x0201b098
    stmdb sp!, {r4, lr}
    bl func_02012704
    ldr r1, L_0201b0d0
    mov r4, r0
    ldr r0, [r1, #0x0]
    mov r1, #0x2
    bl func_02007f0c
    mov r1, #0x0
    bl func_02030ad4
    mov r2, r4
    mov r1, #0x2a
    bl func_020330fc
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_0201b0d0: .word data_021052fc
.size func_0201b098, . - func_0201b098
