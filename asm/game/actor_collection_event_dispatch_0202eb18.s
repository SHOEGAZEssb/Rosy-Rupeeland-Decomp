; Matching retail form; see src/game/actor_collection_event_dispatch.c.
.text

    .global func_0202eb18
    .type func_0202eb18, @function
func_0202eb18: ; 0x0202eb18
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0xc
    mov r8, r0
    mov r7, r1
    mov r6, #0x0
    add r9, r8, #0x2000
    add r4, sp, #0x0
    b .L_0202eb90
.L_0202eb38:
    ldr r5, [r8, r6, lsl #0x2]
    cmp r5, #0x0
    beq .L_0202eb8c
    mov r1, r5
    ldr r3, [r1, #0x0]
    mov r0, r4
    ldr r3, [r3, #0x58]
    mov r2, r7
    blx r3
    ldr r0, [r5, #0x10]
    tst r0, #0x4
    bne .L_0202eb7c
    ldr r0, [r5, #0x14]
    tst r0, #0x1000000
    beq .L_0202eb7c
    tst r0, #0x1
    beq .L_0202eb8c
.L_0202eb7c:
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x24]
    blx r1
.L_0202eb8c:
    add r6, r6, #0x1
.L_0202eb90:
    ldr r0, [r9, #0xe74]
    cmp r6, r0
    blt .L_0202eb38
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
    .size func_0202eb18, . - func_0202eb18
