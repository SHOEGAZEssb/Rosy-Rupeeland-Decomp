.text
; Matching fallback for the portable implementation in src/game/auxiliary_interaction_transfer.c.

.global ActorAttachmentManager_RemoveRecord
ActorAttachmentManager_RemoveRecord:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r3, [r1, #0x8]
    mov r5, r0
    cmp r3, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    ldrne r0, [r5, #0x88]
    ldr r4, [r1, #0xc]
    subne r0, r0, #0x1
    strne r0, [r5, #0x88]
    bne .L_020694e4
    cmp r3, #0x2
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    mvnne r0, #0x0
    strne r0, [r5, #0x90]
    bne .L_020694e4
    cmp r3, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    mvnne r0, #0x0
    strne r0, [r5, #0x8c]
.L_020694e4:
    cmp r2, #0x0
    bne .L_02069504
    cmp r1, #0x0
    beq .L_02069504
    mov r0, r1
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_02069504:
    ldr r0, [r5, #0x84]
    sub r0, r0, #0x1
    cmp r4, r0
    beq .L_0206953c
    b .L_0206952c
.L_02069518:
    add r0, r5, r4, lsl #0x2
    ldr r0, [r0, #0x4]
    str r0, [r5, r4, lsl #0x2]
    str r4, [r0, #0xc]
    add r4, r4, #0x1
.L_0206952c:
    ldr r0, [r5, #0x84]
    sub r0, r0, #0x1
    cmp r4, r0
    blt .L_02069518
.L_0206953c:
    ldr r1, [r5, #0x84]
    mov r0, #0x1
    sub r1, r1, #0x1
    str r1, [r5, #0x84]
    ldmia sp!, {r3, r4, r5, pc}
.size ActorAttachmentManager_RemoveRecord, . - ActorAttachmentManager_RemoveRecord
