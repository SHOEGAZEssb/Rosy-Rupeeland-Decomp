; Matching retail form; see src/game/actor_derived_type1_idle_eligibility.c.
.text
.extern func_02035bc8
.extern func_020372b4

    .global func_020397d4
    .type func_020397d4, @function
func_020397d4: ; 0x020397d4
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    ldr r1, [r0, #0x0]
    mov r4, #0x0
    ldr r1, [r1, #0xa8]
    mov r8, r0
    mov r5, r4
    mov r6, r4
    mov r7, r4
    blx r1
    cmp r0, #0x0
    ldreq r0, [r8, #0x26c]
    cmpeq r0, #0x0
    ldreq r0, [r8, #0x270]
    cmpeq r0, #0x0
    bne .L_02039844
    mov r0, r8
    bl func_02035bc8
    cmp r0, #0x0
    beq .L_02039844
    ldr r0, [r8, #0xd0]
    tst r0, #0x100
    bne .L_02039844
    ldr r0, [r8, #0x230]
    tst r0, #0x20000
    movne r0, #0x1
    moveq r0, r4
    cmp r0, #0x0
    moveq r7, #0x1
.L_02039844:
    cmp r7, #0x0
    beq .L_0203985c
    mov r0, r8
    bl func_020372b4
    cmp r0, #0x0
    moveq r6, #0x1
.L_0203985c:
    cmp r6, #0x0
    beq .L_02039880
    add r0, r8, #0x200
    ldrsh r0, [r0, #0x68]
    cmp r0, #0x0
    bne .L_02039880
    ldr r0, [r8, #0xd0]
    tst r0, #0x4000
    moveq r5, #0x1
.L_02039880:
    cmp r5, #0x0
    beq .L_0203989c
    ldr r0, [r8, #0x274]
    cmp r0, #0x0
    ldreq r0, [r8, #0x278]
    cmpeq r0, #0x0
    moveq r4, #0x1
.L_0203989c:
    mov r0, r4
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
    .size func_020397d4, . - func_020397d4
