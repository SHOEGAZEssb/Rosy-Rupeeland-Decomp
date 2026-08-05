; Matching retail form; see src/game/game_phase_script_vm_scaled_runtime_value_opcode.c.
.text
.extern func_02012704
.extern func_020127f8
.extern func_020befec
.extern data_021052fc
.global func_0201afc0
func_0201afc0: ; 0x0201afc0
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    bl func_02012704
    mov r1, r0, lsl #0x10
    mov r0, r5
    mov r4, r1, lsr #0x10
    bl func_02012704
    mov r2, r0, lsl #0x10
    mov r0, r4
    mov r1, #0xc0
    mov r4, r2, lsr #0x10
    bl func_020befec
    ldr r2, L_0201b03c
    mov r1, r0
    ldr r2, [r2, #0x0]
    mov r0, r4, asr #0x7
    add r2, r2, #0x2000
    ldr r3, [r2, #0xed4]
    add r2, r4, r0, lsr #0x18
    ldr r3, [r3, #0x20]
    mov r0, r5
    mov r3, r3, lsl #0x10
    mov r4, r3, lsr #0xc
    mov r3, r4, asr #0x7
    add r3, r4, r3, lsr #0x18
    mov r3, r3, asr #0x8
    mul r3, r1, r3
    add r1, r3, r2, asr #0x8
    bl func_020127f8
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
L_0201b03c: .word data_021052fc
.size func_0201afc0, . - func_0201afc0
