; Matching retail form; see src/game/actor_extended_type2_callback_routing.c.
.text
.extern data_020df9e8
.global func_02040d64
.type func_02040d64, @function
func_02040d64: ; 0x02040d64
    stmdb sp!, {r3, lr}
    ldr r2, .L_02040d90
    add r1, r0, #0x22c
    ldr r3, [r2, #0x130]
    ldr r2, [r2, #0x134]
    str r3, [r0, #0x220]
    str r2, [r0, #0x224]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0xd0]
    blx r2
    ldmia sp!, {r3, pc}
.L_02040d90: .word data_020df9e8
.size func_02040d64, . - func_02040d64

.global func_02040d94
.type func_02040d94, @function
func_02040d94: ; 0x02040d94
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r2, [r4, #0x260]
    mov r5, r1
    bic r2, r2, #0x1
    str r2, [r4, #0x260]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x134]
    blx r2
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldrh r0, [r5, #0x1a]
    tst r0, #0x2
    beq .L_02040e08
    ldrb r0, [r4, #0x24d]
    cmp r0, #0x0
    beq .L_02040df4
    cmp r0, #0x1
    moveq r0, #0x5
    streqb r0, [r4, #0x24c]
    moveq r0, #0xc
    streqh r0, [r4, #0xd6]
    b .L_02040e1c
.L_02040df4:
    mov r0, #0x4
    strb r0, [r4, #0x24c]
    mov r0, #0xb
    strh r0, [r4, #0xd6]
    b .L_02040e1c
.L_02040e08:
    ldr r0, .L_02040e24
    ldr r1, [r0, #0x2a8]
    ldr r0, [r0, #0x2ac]
    str r1, [r4, #0x218]
    str r0, [r4, #0x21c]
.L_02040e1c:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_02040e24: .word data_020df9e8
.size func_02040d94, . - func_02040d94
