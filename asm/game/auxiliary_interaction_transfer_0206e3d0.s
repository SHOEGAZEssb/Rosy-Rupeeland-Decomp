.text
; Matching fallback for the portable implementation in src/game/auxiliary_interaction_transfer.c.
.extern AuxiliaryInteraction_AdmitTarget
.extern AuxiliaryInteraction_SelectPresentationVariant
.extern ActorAttachmentManager_AppendExistingRecord
.extern ActorAttachmentManager_RemoveRecord
.extern ActorAttachmentManager_TransferRecords
.extern func_0206cc68

.global AuxiliaryInteraction_MergeFrom
AuxiliaryInteraction_MergeFrom:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r5, r0
    ldr r2, [r5, #0x44]
    mov r4, r1
    ldr r1, [r2, #0xa0]
    cmp r1, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r1, [r2, #0x84]
    cmp r1, #0x20
    movge r0, #0x0
    ldmgeia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r1, [r4, #0x10]
    mov r2, #0x0
    bl func_0206cc68
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r0, [r4, #0x44]
    mov r2, #0x1
    ldr r1, [r0, #0x90]
    ldr r6, [r0, r1, lsl #0x2]
    mov r1, r6
    bl ActorAttachmentManager_RemoveRecord
    ldr r0, [r5, #0x44]
    mov r1, r6
    bl ActorAttachmentManager_AppendExistingRecord
    mov r7, #0x0
    mov r6, r7
    b .L_0206e460
.L_0206e448:
    add r0, r4, r7, lsl #0x2
    ldr r1, [r0, #0x54]
    mov r0, r5
    mov r2, r6
    bl AuxiliaryInteraction_AdmitTarget
    add r7, r7, #0x1
.L_0206e460:
    ldrsh r0, [r4, #0xa4]
    cmp r7, r0
    blt .L_0206e448
    mov r7, #0x0
    mov r6, r7
    b .L_0206e490
.L_0206e478:
    add r0, r4, r7, lsl #0x2
    ldr r1, [r0, #0x48]
    mov r0, r5
    mov r2, r6
    bl func_0206cc68
    add r7, r7, #0x1
.L_0206e490:
    ldrsh r0, [r4, #0xa6]
    cmp r7, r0
    blt .L_0206e478
    ldr r0, [r5, #0x44]
    ldr r1, [r4, #0x44]
    bl ActorAttachmentManager_TransferRecords
    mov r1, #0x0
    strh r1, [r5, #0xae]
    mov r0, r5
    strh r1, [r5, #0xac]
    bl AuxiliaryInteraction_SelectPresentationVariant
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.size AuxiliaryInteraction_MergeFrom, . - AuxiliaryInteraction_MergeFrom
