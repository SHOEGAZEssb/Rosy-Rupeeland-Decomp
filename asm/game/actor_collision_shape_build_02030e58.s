; Matching retail form; see src/game/actor_collision_shape_build.c.
.text
.extern func_02004fe0
.extern func_0200500c
.extern func_02005058
.extern func_020050a4
.extern func_020adae4

    .global Actor_GetCollisionCenter
    .type Actor_GetCollisionCenter, @function
Actor_GetCollisionCenter: ; 0x02030e58
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x10
    mov r5, r1
    mov r6, r0
    bl func_02004fe0
    ldrsb r1, [r5, #0xa]
    ldrsb r0, [r5, #0x8]
    sub r0, r1, r0
    mov r1, r0, lsl #0x18
    movs r1, r1, asr #0x18
    beq .L_02030e9c
    ldrsb r2, [r5, #0xb]
    ldrsb r1, [r5, #0x9]
    sub r1, r2, r1
    mov r1, r1, lsl #0x18
    movs r1, r1, asr #0x18
    bne .L_02030eac
.L_02030e9c:
    mov r0, r6
    add r1, r5, #0x18
    bl func_020050a4
    b .L_02030f08
.L_02030eac:
    mov r1, #0x2
    bl func_020adae4
    ldrsb r1, [r5, #0x8]
    ldrsb r3, [r5, #0xb]
    ldrsb r2, [r5, #0x9]
    add r4, r0, r1
    mov r1, #0x2
    sub r0, r3, r2
    bl func_020adae4
    ldr r1, [r5, #0x1c]
    ldrsb r3, [r5, #0x9]
    add r1, r1, r4, lsl #0xc
    ldr r2, [r5, #0x20]
    add r4, r0, r3
    ldr r3, [r5, #0x24]
    add r0, sp, #0x0
    add r2, r2, r4, lsl #0xc
    bl func_0200500c
    add r1, sp, #0x0
    mov r0, r6
    bl func_020050a4
    add r0, sp, #0x0
    bl func_02005058
.L_02030f08:
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, pc}
    .size Actor_GetCollisionCenter, . - Actor_GetCollisionCenter
