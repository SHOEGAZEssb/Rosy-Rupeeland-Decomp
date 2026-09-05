.text
; Matching fallback for the portable implementation in src/game/auxiliary_interaction_transfer.c.
.extern ActorAttachmentManager_AppendExistingRecord
.extern ActorAttachmentManager_RemoveRecord

.global ActorAttachmentManager_TransferRecords
ActorAttachmentManager_TransferRecords:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x80
    mov r6, r0
    ldr r0, [r6, #0xa0]
    mov r5, r1
    cmp r0, #0x0
    movne r0, #0x0
    bne .L_020695ec
    mov r4, #0x0
    mov r8, r4
    add r7, sp, #0x0
    b .L_020695b0
.L_02069590:
    ldr r1, [r5, r8, lsl #0x2]
    mov r0, r6
    bl ActorAttachmentManager_AppendExistingRecord
    cmp r0, #0x0
    ldrne r0, [r5, r8, lsl #0x2]
    add r8, r8, #0x1
    strne r0, [r7, r4, lsl #0x2]
    addne r4, r4, #0x1
.L_020695b0:
    ldr r0, [r5, #0x84]
    cmp r8, r0
    blt .L_02069590
    mov r8, #0x0
    add r7, sp, #0x0
    mov r6, #0x1
    b .L_020695e0
.L_020695cc:
    ldr r1, [r7, r8, lsl #0x2]
    mov r0, r5
    mov r2, r6
    bl ActorAttachmentManager_RemoveRecord
    add r8, r8, #0x1
.L_020695e0:
    cmp r8, r4
    blt .L_020695cc
    mov r0, #0x1
.L_020695ec:
    add sp, sp, #0x80
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.size ActorAttachmentManager_TransferRecords, . - ActorAttachmentManager_TransferRecords
