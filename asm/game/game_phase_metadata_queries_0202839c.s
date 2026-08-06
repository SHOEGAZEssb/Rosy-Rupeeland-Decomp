; Matching retail form; see src/game/game_phase_metadata_queries.c.
.text
.extern data_020d4850
.extern data_020d4854
.extern data_020d8b30
.extern data_020d8b32
.extern data_020d8b33

    .global func_0202839c
    .type func_0202839c, @function
func_0202839c: ; 0x0202839c
    stmdb sp!, {r3, lr}
    sub r2, r1, #0x1
    mov r1, #0x58
    mul lr, r2, r1
    ldr r1, .L_020283f0
    ldr r3, .L_020283f4
    ldrsb ip, [r1, lr]
    mov r1, #0x18
    ldr r2, .L_020283f8
    smulbb ip, ip, r1
    ldrsb r3, [r3, lr]
    ldr r1, [r2, ip]
    ldr r2, .L_020283fc
    sub r1, r3, r1
    str r1, [r0, #0x4]
    ldr r1, .L_02028400
    ldrsb r2, [r2, lr]
    ldr r1, [r1, ip]
    sub r1, r2, r1
    str r1, [r0, #0x8]
    ldmia sp!, {r3, pc}
.L_020283f0: .word data_020d8b30
.L_020283f4: .word data_020d8b32
.L_020283f8: .word data_020d4850
.L_020283fc: .word data_020d8b33
.L_02028400: .word data_020d4854
    .size func_0202839c, . - func_0202839c

