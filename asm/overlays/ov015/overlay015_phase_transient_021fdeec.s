    .text
    .extern data_ov015_021febd0
    .extern data_ov015_021fec18
    .extern InventoryRecordCollection_HasInactiveKind1Subtype1
    .extern ModalState_UpdateInput
    .extern func_ov001_021fc384
    .extern func_ov001_021fc39c
    .extern func_ov001_021fc3b4
    .extern func_ov001_021fc3dc
    .extern func_ov015_021fce30
    .extern Overlay015_RebuildSelectionRecords
    .extern Overlay015_CreatePrompt
    .extern Overlay015_DestroyPrompt

/* Exact fallbacks for transient-confirmation phase; see src/overlays/ov015/overlay015_phase_runtime.c. */
    .global Overlay015_UpdateTransientConfirmation

Overlay015_UpdateTransientConfirmation:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    beq L_021fdf0c
    cmp r0, #0x1
    beq L_021fdf98
    b L_021fdfd8
L_021fdf0c:
    ldr r0, [r4, #0xec]
    cmp r0, #0x0
    bne L_021fdf20
    ldr r0, [r4, #0xdc]
    bl func_ov001_021fc3dc
L_021fdf20:
    ldr r0, [r4, #0xdc]
    bl func_ov001_021fc3b4
    mov r0, r4
    bl Overlay015_RebuildSelectionRecords
    ldr r0, [r4, #0xec]
    cmp r0, #0x0
    beq L_021fdf84
    ldr r0, [r4, #0xdc]
    ldr r0, [r0, #0x204]
    bl InventoryRecordCollection_HasInactiveKind1Subtype1
    cmp r0, #0x0
    bne L_021fdf84
    ldr r0, [r4, #0xdc]
    bl func_ov001_021fc39c
    mov r0, r4
    mov r1, #0xf
    mov r2, #0x1
    mov r3, #0x0
    bl Overlay015_CreatePrompt
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021fdfd8
L_021fdf84:
    ldr r1, L_021fdfe0
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov015_021fce30
    b L_021fdfd8
L_021fdf98:
    ldr r1, [r4, #0x20]
    ldr r0, [r4, #0xf8]
    mov r2, r1, lsl #0x1a
    add r1, r4, #0x30
    mov r2, r2, asr #0x1f
    bl ModalState_UpdateInput
    cmp r0, #0x0
    blt L_021fdfd8
    mov r0, r4
    bl Overlay015_DestroyPrompt
    ldr r0, [r4, #0xdc]
    bl func_ov001_021fc384
    ldr r1, L_021fdfe4
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov015_021fce30
L_021fdfd8:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_021fdfe0: .word data_ov015_021febd0
L_021fdfe4: .word data_ov015_021fec18

    .size Overlay015_UpdateTransientConfirmation, . - Overlay015_UpdateTransientConfirmation
