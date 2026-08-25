    .text
    .extern func_0209a2ac

/* Exact fallback; see documented portable reconstruction in
 * src/overlays/ov008/overlay008_particles_update.c. */
    .global Overlay008_UpdateParticles
Overlay008_UpdateParticles: ; 0x021fbd1c
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r1, #0x3c
    mov r8, r0
    sub r7, r1, #0x1
    mvn r6, #0x0
    mov r5, #0x0
    mov r4, #0x1
L_021fbd38:
    add r0, r8, r7, lsl #0x2
    ldr r0, [r0, #0x754]
    cmp r0, #0x0
    blt L_021fbe00
    beq L_021fbd54
    cmp r0, #0xe
    blt L_021fbd68
L_021fbd54:
    add r1, r8, r7, lsl #0x4
    ldr r0, [r1, #0x144]
    add r0, r0, #0x66
    str r0, [r1, #0x144]
    b L_021fbd7c
L_021fbd68:
    add r1, r8, r7, lsl #0x4
    ldr r0, [r1, #0x144]
    add r0, r0, #0x9a
    add r0, r0, #0x100
    str r0, [r1, #0x144]
L_021fbd7c:
    add ip, r8, r7, lsl #0x2
    ldr r0, [ip, #0x664]
    sub r0, r0, #0x1
    str r0, [ip, #0x664]
    cmp r0, #0x0
    bgt L_021fbdb8
    str r6, [ip, #0x754]
    ldr r3, [ip, #0x4c]
    mov r1, r5
    ldrh r0, [r3, #0x42]
    mov r2, r4
    orr r0, r0, #0x4
    strh r0, [r3, #0x42]
    ldr r0, [ip, #0x4c]
    bl func_0209a2ac
L_021fbdb8:
    add r0, r8, r7, lsl #0x2
    ldr lr, [r0, #0x4c]
    add r3, r8, r7, lsl #0x4
    ldr ip, [lr, #0x30]
    ldr r2, [r3, #0x140]
    add r1, r8, r7, lsl #0x1
    add r2, ip, r2
    str r2, [lr, #0x30]
    ldr ip, [r0, #0x4c]
    ldr r2, [r3, #0x144]
    ldr r3, [ip, #0x34]
    add r1, r1, #0x400
    add r2, r3, r2
    str r2, [ip, #0x34]
    ldrh r2, [r1, #0xfc]
    ldr r0, [r0, #0x574]
    add r0, r2, r0
    strh r0, [r1, #0xfc]
L_021fbe00:
    subs r7, r7, #0x1
    bpl L_021fbd38
    ldmia sp!, {r4, r5, r6, r7, r8, pc}

    .size Overlay008_UpdateParticles, . - Overlay008_UpdateParticles
