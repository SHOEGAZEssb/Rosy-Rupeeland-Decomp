; Matching retail form; see src/game/type7_actor_random_acceptance.c.
.text
.extern func_02046d8c
.extern func_02047f38
.extern func_020ada8c
.extern genrand_int32
.global func_020486a8
.type func_020486a8, @function

func_020486a8: ; 0x020486a8
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0xd0]
    tst r0, #0x40000
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, pc}
    ldr r0, [r4, #0x29c]
    ldrb r0, [r0, #0x54]
    cmp r0, #0x0
    beq .L_020486f8
    cmp r0, #0x1
    beq .L_020486f0
    cmp r0, #0x2
    beq .L_02048738
    b .L_02048764
.L_020486f0:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_020486f8:
    mov r0, r4
    bl func_02046d8c
    cmp r0, #0x0
    bne .L_02048730
    bl genrand_int32
    bic r0, r0, #0x80000000
    mov r1, #0x5
    bl func_020ada8c
    cmp r0, #0x0
    bne .L_02048730
    mov r0, r4
    bl func_02047f38
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_02048730:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_02048738:
    bl genrand_int32
    bic r0, r0, #0x80000000
    mov r1, #0x3
    bl func_020ada8c
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r4, pc}
    mov r0, r4
    bl func_02047f38
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_02048764:
    mov r0, #0x0
    ldmia sp!, {r4, pc}

.size func_020486a8, . - func_020486a8

