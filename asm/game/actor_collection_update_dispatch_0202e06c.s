; Matching retail form; see src/game/actor_collection_update_dispatch.c.
.text
.extern func_0203b798

    .global func_0202e06c
    .type func_0202e06c, @function
func_0202e06c: ; 0x0202e06c
    stmdb sp!, {r4, r5, r6, lr}
    add r5, r0, #0x200
    ldr r4, [r0, #0xe20]
    mov r6, #0x0
    b .L_0202e0f8
.L_0202e080:
    ldr r0, [r5, #0x0]
    ldr r1, [r0, #0x10]
    bic r1, r1, #0x80
    str r1, [r0, #0x10]
    tst r1, #0x100
    beq .L_0202e0f0
    tst r1, #0x1000000
    beq .L_0202e0e4
    ldrb r1, [r0, #0x4d]
    cmp r1, #0x1
    beq .L_0202e0bc
    cmp r1, #0x2
    cmpne r1, #0x5
    beq .L_0202e0cc
    b .L_0202e0d4
.L_0202e0bc:
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x1c]
    blx r1
    b .L_0202e0f0
.L_0202e0cc:
    bl func_0203b798
    b .L_0202e0f0
.L_0202e0d4:
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x1c]
    blx r1
    b .L_0202e0f0
.L_0202e0e4:
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x1c]
    blx r1
.L_0202e0f0:
    add r6, r6, #0x1
    add r5, r5, #0x4
.L_0202e0f8:
    cmp r6, r4
    blt .L_0202e080
    ldmia sp!, {r4, r5, r6, pc}
    .size func_0202e06c, . - func_0202e06c
