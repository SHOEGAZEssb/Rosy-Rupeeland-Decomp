; Matching retail form; see src/game/actor_collection_update_dispatch.c.
.text
.extern func_0203b798

    .global func_0202dfec
    .type func_0202dfec, @function
func_0202dfec: ; 0x0202dfec
    stmdb sp!, {r4, r5, r6, lr}
    add r5, r0, #0x200
    ldr r4, [r0, #0xe20]
    mov r6, #0x0
    b .L_0202e060
.L_0202e000:
    ldr r0, [r5, #0x0]
    ldr r1, [r0, #0x10]
    tst r1, #0x1000000
    beq .L_0202e04c
    ldrb r1, [r0, #0x4d]
    cmp r1, #0x1
    beq .L_0202e02c
    cmp r1, #0x2
    cmpne r1, #0x5
    beq .L_0202e034
    b .L_0202e03c
.L_0202e02c:
    bl func_0203b798
    b .L_0202e058
.L_0202e034:
    bl func_0203b798
    b .L_0202e058
.L_0202e03c:
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x1c]
    blx r1
    b .L_0202e058
.L_0202e04c:
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x1c]
    blx r1
.L_0202e058:
    add r6, r6, #0x1
    add r5, r5, #0x4
.L_0202e060:
    cmp r6, r4
    blt .L_0202e000
    ldmia sp!, {r4, r5, r6, pc}
    .size func_0202dfec, . - func_0202dfec
