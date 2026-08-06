; Matching retail form; see src/game/actor_extended_type2_callback_pair_predicates.c.
.text
.extern data_020df9e8
.extern data_020dfae8
.extern data_020dfab8
.global func_020401a0
.type func_020401a0, @function
func_020401a0: ; 0x020401a0
    stmdb sp!, {r3, lr}
    ldr r1, .L_02040220
    mov ip, #0x1
    ldr r3, [r0, #0x218]
    ldr r1, [r1, #0x100]
    mov lr, ip
    cmp r3, r1
    ldr r1, .L_02040224
    bne .L_020401d8
    ldr r2, [r0, #0x21c]
    ldr r1, [r1, #0x4]
    cmp r2, r1
    cmpne r3, #0x0
    moveq lr, #0x0
.L_020401d8:
    cmp lr, #0x0
    beq .L_02040218
    ldr r1, .L_02040220
    ldr r2, [r0, #0x220]
    ldr r1, [r1, #0xd0]
    mov lr, #0x1
    cmp r2, r1
    ldr r3, .L_02040228
    bne .L_02040210
    ldr r1, [r0, #0x224]
    ldr r0, [r3, #0x4]
    cmp r1, r0
    cmpne r2, #0x0
    moveq lr, #0x0
.L_02040210:
    cmp lr, #0x0
    movne ip, #0x0
.L_02040218:
    mov r0, ip
    ldmia sp!, {r3, pc}
.L_02040220: .word data_020df9e8
.L_02040224: .word data_020dfae8
.L_02040228: .word data_020dfab8
.size func_020401a0, . - func_020401a0
.global func_0204022c
.type func_0204022c, @function

func_0204022c: ; 0x0204022c
    mov r0, #0x0
    bx lr
.size func_0204022c, . - func_0204022c

