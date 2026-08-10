; Matching retail form; see src/game/actor_attachment_activation_control.c.
.text

    .global Actor_SetAttachmentEnabled
    .type Actor_SetAttachmentEnabled, @function
Actor_SetAttachmentEnabled: ; 0x02033ae8
    ldr r2, [r0, #0x54]
    cmp r2, #0x0
    bxeq lr
    cmp r1, #0x0
    ldr r1, [r0, #0x14]
    beq .L_02033b1c
    bic r1, r1, #0x10000000
    str r1, [r0, #0x14]
    ldr r1, [r0, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x4
    strh r0, [r1, #0x24]
    bx lr
.L_02033b1c:
    orr r1, r1, #0x10000000
    str r1, [r0, #0x14]
    ldr r1, [r0, #0x54]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x4
    strh r0, [r1, #0x24]
    bx lr
    .size Actor_SetAttachmentEnabled, . - Actor_SetAttachmentEnabled

    .global func_02033b38
