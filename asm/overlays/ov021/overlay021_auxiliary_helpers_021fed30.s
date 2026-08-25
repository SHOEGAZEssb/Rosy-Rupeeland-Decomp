    .text
/* Exact fallback; see src/overlays/ov021/overlay021_auxiliary_helpers.c. */
    .extern data_021e9ac0
    .extern ActorDescriptor_IsInvalid
    .extern InventoryRecordCollection_RebindSecondarySelectionDescriptors

.global Overlay021_IsAuxiliaryRecordAvailable
Overlay021_IsAuxiliaryRecordAvailable:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
    ldr r1, L_021feda8
    ldr r4, [r1, #0x0]
    ldr r1, [r0, #0x54]
    add r0, r4, #0x34
    bl InventoryRecordCollection_RebindSecondarySelectionDescriptors
    mov r5, #0x0
    ldr r6, [r4, #0x40]
    mov r8, r5
    mov r9, #0x1
    mov r7, #0x24
    b L_021fed98
L_021fed60:
    ldr r0, [r4, #0x38]
    mla r10, r5, r7, r0
    mov r0, r10
    bl ActorDescriptor_IsInvalid
    cmp r0, #0x0
    bne L_021fed94
    ldr r0, [r10, #0xc]
    cmp r0, #0x0
    movne r0, r9
    moveq r0, r8
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
L_021fed94:
    add r5, r5, #0x1
L_021fed98:
    cmp r5, r6
    blt L_021fed60
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
L_021feda8: .word data_021e9ac0
    .size Overlay021_IsAuxiliaryRecordAvailable, . - Overlay021_IsAuxiliaryRecordAvailable

