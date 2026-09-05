.text
; Matching fallback for the portable implementation in src/game/auxiliary_interaction_transfer.c.

.global ActorAttachmentManager_AppendExistingRecord
ActorAttachmentManager_AppendExistingRecord:
    ldr r2, [r0, #0xa0]
    cmp r2, #0x0
    movne r0, #0x0
    bxne lr
    ldr r3, [r0, #0x84]
    cmp r3, #0x20
    movge r0, #0x0
    bxge lr
    ldr r2, [r1, #0x8]
    cmp r2, #0x0
    beq .L_02069344
    cmp r2, #0x1
    beq .L_0206935c
    cmp r2, #0x2
    streq r3, [r0, #0x90]
    b .L_02069360
.L_02069344:
    mov r2, #0x1e
    str r2, [r0, #0xac]
    ldr r2, [r0, #0x88]
    add r2, r2, #0x1
    str r2, [r0, #0x88]
    b .L_02069360
.L_0206935c:
    str r3, [r0, #0x8c]
.L_02069360:
    ldr r3, [r0, #0x84]
    mov r2, #0x0
    str r0, [r1, #0x4]
    str r3, [r1, #0xc]
    ldr r3, [r0, #0x84]
    str r1, [r0, r3, lsl #0x2]
    ldr r1, [r0, #0x84]
    add r1, r1, #0x1
    str r1, [r0, #0x84]
    str r2, [r0, #0xa4]
    mov r0, #0x1
    bx lr
.size ActorAttachmentManager_AppendExistingRecord, . - ActorAttachmentManager_AppendExistingRecord
