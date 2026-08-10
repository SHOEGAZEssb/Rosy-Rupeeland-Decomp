; Matching retail form; see src/game/game_phase_state_boundary_transition.c.
.text
.extern func_02005058
.extern func_02056f00

    .global GamePhaseState_GetBoundaryDirection
GamePhaseState_GetBoundaryDirection: ; 0x0200efe0
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x10
    mov r4, r0
    add r0, r4, #0x2000
    ldr r1, [r0, #0xe80]
    ldr r0, [r1, #0xd0]
    tst r0, #0x10
    mvnne r0, #0x0
    bne L_0200f0ac
    add r0, sp, #0x0
    add r1, r1, #0x18
    bl func_02056f00
    add r0, r4, #0x2000
    ldr r0, [r0, #0xeb0]
    ldr r1, [sp, #0x4]
    ldr r2, [sp, #0x8]
    mov ip, r1, asr #0xc
    ldr r0, [r0, #0x20]
    cmp ip, #0x20
    mov r1, r0, lsl #0x10
    mov r3, r2, asr #0xc
    mov r0, r0, lsr #0x10
    mov r2, r1, lsr #0xc
    mov r1, r0, lsl #0x4
    bge L_0200f054
    add r0, sp, #0x0
    bl func_02005058
    mov r0, #0x1
    b L_0200f0ac
L_0200f054:
    sub r0, r2, #0x20
    cmp ip, r0
    ble L_0200f070
    add r0, sp, #0x0
    bl func_02005058
    mov r0, #0x2
    b L_0200f0ac
L_0200f070:
    cmp r3, #0x20
    bge L_0200f088
    add r0, sp, #0x0
    bl func_02005058
    mov r0, #0x3
    b L_0200f0ac
L_0200f088:
    sub r0, r1, #0x20
    cmp r3, r0
    add r0, sp, #0x0
    ble L_0200f0a4
    bl func_02005058
    mov r0, #0x4
    b L_0200f0ac
L_0200f0a4:
    bl func_02005058
    mvn r0, #0x0
L_0200f0ac:
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
    .size GamePhaseState_GetBoundaryDirection, . - GamePhaseState_GetBoundaryDirection

