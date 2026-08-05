; Matching retail form; see src/game/game_phase_script_vm_packed_bit_grid_opcodes.c.
.text
.extern func_02012704
.extern func_020275b0
.global func_0201ad7c
func_0201ad7c: ; 0x0201ad7c
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    bl func_02012704
    mov r5, r0
    mov r0, r4
    bl func_02012704
    mov r4, r0
    bl func_020275b0
    ldr r1, [r0, #0x8]
    ldr ip, [r0, #0x0]
    mla r1, r5, r1, r4
    mov r0, r1, asr #0x2
    add r0, r1, r0, lsr #0x1d
    mov r2, r1, lsr #0x1f
    rsb r1, r2, r1, lsl #0x1d
    ldrb r3, [ip, r0, asr #0x3]
    add r1, r2, r1, ror #0x1d
    mov r2, #0x1
    orr r1, r3, r2, lsl r1
    strb r1, [ip, r0, asr #0x3]
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.size func_0201ad7c, . - func_0201ad7c
