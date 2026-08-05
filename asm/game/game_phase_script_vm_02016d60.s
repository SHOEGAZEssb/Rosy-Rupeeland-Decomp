; Matching retail form; see src/game/game_phase_script_vm_actor_grid_placement_opcode.c.
.text
.extern func_0200500c
.extern func_02005058
.extern func_020050a4
.extern func_02012704
.extern func_02032e04
.global func_02016d60
func_02016d60:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x14
    mov r7, r0
    bl func_02012704
    mov r5, r0, lsl #4
    mov r0, r7
    bl func_02012704
    mov r6, r0, lsl #4
    mov r0, r7
    bl func_02012704
    mov r4, r0
    mov r0, r7
    bl func_02012704
    add r1, r6, r6, lsr #31
    mov r2, r0
    mov r1, r1, asr #1
    add r1, r1, r2, lsl #4
    add r2, r5, r5, lsr #31
    mov r2, r2, asr #1
    add r2, r2, r4, lsl #4
    add r0, sp, #4
    mov r1, r1, lsl #12
    mov r2, r2, lsl #12
    mov r3, #0
    bl func_0200500c
    ldr r0, [r7, #0x84]
    add r1, sp, #4
    add r0, r0, #0x28
    bl func_020050a4
    mov r1, r0
    ldr r0, [r7, #0x84]
    add r0, r0, #0x18
    bl func_020050a4
    add r0, sp, #4
    bl func_02005058
    ldr r0, [r7, #0x84]
    bl func_02032e04
    rsb r2, r6, #0
    add r3, r2, r2, lsr #31
    rsb r4, r5, #0
    mov r2, r5, lsl #24
    ldr r7, [r7, #0x84]
    mov r0, #0
    mov r1, r6, lsl #24
    mov r5, r3, asr #1
    add r5, r5, r1, asr #24
    add r1, r0, r3, asr #1
    add r4, r4, r4, lsr #31
    strb r1, [r7, #8]
    mov r1, r4, asr #1
    add r1, r1, r2, asr #24
    add r2, r0, r4, asr #1
    strb r2, [r7, #9]
    strb r5, [r7, #0xa]
    strb r1, [r7, #0xb]
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, pc}
    .size func_02016d60, . - func_02016d60
