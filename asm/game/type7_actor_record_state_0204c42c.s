; Matching retail form; see src/game/type7_actor_record_state.c.
.extern gGameWork
.extern data_020e16b0
.extern data_020ea9b0
.extern data_020ea650
.text
    .global func_0204c42c
func_0204c42c: ; 0x0204c42c
    ldr r1, .L_0204c4b8
    ldr r2, .L_0204c4bc
    ldr r0, [r1, #0x0]
    ldr r3, [r2, #0x2b4]
    add r0, r0, #0x5000
    str r3, [r0, #0x1d0]
    ldr r0, [r1, #0x0]
    ldr r3, [r2, #0x2b8]
    add r0, r0, #0x5000
    str r3, [r0, #0x1d4]
    ldr r0, [r1, #0x0]
    ldr r3, [r2, #0x2bc]
    add r0, r0, #0x5000
    str r3, [r0, #0x1d8]
    ldr r0, [r1, #0x0]
    ldr r3, [r2, #0x2c0]
    add r0, r0, #0x5000
    str r3, [r0, #0x1dc]
    ldr r0, [r1, #0x0]
    ldr r3, [r2, #0x2c4]
    add r0, r0, #0x5000
    str r3, [r0, #0x1e0]
    ldr r0, [r1, #0x0]
    ldr r3, [r2, #0x2c8]
    add r0, r0, #0x5000
    str r3, [r0, #0x1e4]
    ldr r0, [r1, #0x0]
    ldr r3, [r2, #0x2cc]
    add r0, r0, #0x5000
    str r3, [r0, #0x1e8]
    ldr r0, [r1, #0x0]
    ldr r1, [r2, #0x2d0]
    add r0, r0, #0x5000
    str r1, [r0, #0x1ec]
    bx lr
.L_0204c4b8: .word gGameWork
.L_0204c4bc: .word data_020e16b0
.size func_0204c42c, . - func_0204c42c

    .global func_0204c4c0
func_0204c4c0: ; 0x0204c4c0
    ldr r0, .L_0204c514
    ldr r1, .L_0204c518
    ldr r0, [r0, #0x0]
    add r0, r0, #0x5000
    ldr r2, [r0, #0x1d0]
    str r2, [r1, #0x2b4]
    ldr r2, [r0, #0x1d4]
    str r2, [r1, #0x2b8]
    ldr r2, [r0, #0x1d8]
    str r2, [r1, #0x2bc]
    ldr r2, [r0, #0x1dc]
    str r2, [r1, #0x2c0]
    ldr r2, [r0, #0x1e0]
    str r2, [r1, #0x2c4]
    ldr r2, [r0, #0x1e4]
    str r2, [r1, #0x2c8]
    ldr r2, [r0, #0x1e8]
    str r2, [r1, #0x2cc]
    ldr r0, [r0, #0x1ec]
    str r0, [r1, #0x2d0]
    bx lr
.L_0204c514: .word gGameWork
.L_0204c518: .word data_020e16b0
.size func_0204c4c0, . - func_0204c4c0

    .global func_0204c51c
func_0204c51c: ; 0x0204c51c
    stmdb sp!, {r3, lr}
    mov lr, #0x0
    ldr ip, .L_0204c558
    mov r1, #0x68
    b .L_0204c548
.L_0204c530:
    mul r3, lr, r1
    ldrsh r2, [ip, r3]
    cmp r0, r2
    addeq r0, ip, r3
    ldmeqia sp!, {r3, pc}
    add lr, lr, #0x1
.L_0204c548:
    cmp lr, #0x24
    blt .L_0204c530
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_0204c558: .word data_020ea9b0
.size func_0204c51c, . - func_0204c51c

    .global func_0204c55c
func_0204c55c: ; 0x0204c55c
    stmdb sp!, {r3, lr}
    mov lr, #0x0
    ldr ip, .L_0204c598
    mov r1, #0x18
    b .L_0204c588
.L_0204c570:
    mul r3, lr, r1
    ldrsh r2, [ip, r3]
    cmp r0, r2
    addeq r0, ip, r3
    ldmeqia sp!, {r3, pc}
    add lr, lr, #0x1
.L_0204c588:
    cmp lr, #0x24
    blt .L_0204c570
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_0204c598: .word data_020ea650
.size func_0204c55c, . - func_0204c55c

