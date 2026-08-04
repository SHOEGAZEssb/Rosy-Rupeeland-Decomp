; Matching retail form; see src/game/game_phase_state_controls.c.
.text
.extern func_0200fe0c
.extern func_02010094
.extern func_0201e054
.extern func_0202d68c

    .global func_0200ec6c
func_0200ec6c: ; 0x0200ec6c
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    add r0, r5, #0x2000
    ldr r0, [r0, #0xeb0]
    mov r4, r1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x24]
    blx r2
    mov r1, r4
    add r0, r5, #0x4
    bl func_0202d68c
    add r0, r5, #0x2b4
    mov r1, r4
    add r0, r0, #0x2c00
    bl func_02010094
    add r0, r5, #0x358
    mov r1, r4
    add r0, r0, #0x2c00
    bl func_0201e054
    ldmia sp!, {r3, r4, r5, pc}
    .size func_0200ec6c, . - func_0200ec6c

    .global func_0200ecbc
func_0200ecbc: ; 0x0200ecbc
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    add r0, r5, #0x2000
    ldr r0, [r0, #0xeb0]
    mov r4, r1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x18]
    blx r2
    add r0, r5, #0x2b4
    mov r1, r4
    add r0, r0, #0x2c00
    bl func_0200fe0c
    ldmia sp!, {r3, r4, r5, pc}
    .size func_0200ecbc, . - func_0200ecbc

