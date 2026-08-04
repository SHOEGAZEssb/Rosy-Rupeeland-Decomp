; Matching retail form; see src/game/game_phase_state_lifecycle.c.
.text
.extern func_0200e61c
.extern func_0201155c
.extern func_0202d094

    .global func_0200e5bc
func_0200e5bc: ; 0x0200e5bc
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x2b4
    add r0, r0, #0x2c00
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x0]
    blx r1
    add r0, r4, #0x2f80
    bl func_0201155c
    mov r0, r4
    bl func_0200e61c
    add r0, r4, #0x4
    bl func_0202d094
    add r0, r4, #0x2000
    ldr r0, [r0, #0xeb0]
    cmp r0, #0x0
    beq L_0200e60c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_0200e60c:
    add r0, r4, #0x2000
    mov r1, #0x0
    str r1, [r0, #0xeb0]
    ldmia sp!, {r4, pc}
    .size func_0200e5bc, . - func_0200e5bc

