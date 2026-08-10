; Matching retail form; see src/game/actor_attachment_activation_control.c.
.text

    .global Actor_RequestAttachmentActivation
    .type Actor_RequestAttachmentActivation, @function
Actor_RequestAttachmentActivation: ; 0x02033a6c
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r3, [r4, #0x54]
    cmp r3, #0x0
    ldmeqia sp!, {r4, pc}
    cmp r1, #0x0
    beq .L_02033ac8
    ldr r0, [r4, #0x14]
    tst r0, #0x10000000
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xa8]
    blx r1
    cmp r0, #0x0
    ldreq r1, [r4, #0x54]
    ldreqh r0, [r1, #0x24]
    biceq r0, r0, #0x4
    streqh r0, [r1, #0x24]
    ldmia sp!, {r4, pc}
.L_02033ac8:
    ldrh r2, [r3, #0x24]
    mov r1, #0x0
    orr r2, r2, #0x4
    strh r2, [r3, #0x24]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x94]
    blx r2
    ldmia sp!, {r4, pc}
    .size Actor_RequestAttachmentActivation, . - Actor_RequestAttachmentActivation

    .global Actor_SetAttachmentEnabled
