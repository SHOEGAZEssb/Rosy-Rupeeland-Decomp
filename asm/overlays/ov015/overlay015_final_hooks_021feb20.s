    .text
    .extern Overlay015_UpdateRecords

/* Exact fallbacks for completion and display hooks; see src/overlays/ov015/overlay015_terminal_phases.c. */
    .global Overlay015_FinalizeRecordUpdate
    .global func_ov015_021feb30

Overlay015_FinalizeRecordUpdate:
    stmdb sp!, {r3, lr}
    bl Overlay015_UpdateRecords
    mov r0, #0x1
    ldmia sp!, {r3, pc}

    .global func_ov015_021feb30
func_ov015_021feb30:
    ldr r1, [r0, #0x20]
    mov r1, r1, lsl #0x15
    movs r1, r1, asr #0x1f
    beq L_021feb7c
    mov r3, #0x4000000
    ldr r2, [r3, #0x0]
    ldr r1, [r0, #0x48]
    bic r2, r2, #0x1f00
    orr r1, r2, r1, lsl #0x8
    str r1, [r3, #0x0]
    ldr r1, [r0, #0xec]
    cmp r1, #0x0
    bne L_021feb7c
    add r2, r3, #0x1000
    ldr r1, [r2, #0x0]
    ldr r0, [r0, #0x4c]
    bic r1, r1, #0x1f00
    orr r0, r1, r0, lsl #0x8
    str r0, [r2, #0x0]
L_021feb7c:
    mov r0, #0x0
    bx lr

    .size Overlay015_FinalizeRecordUpdate, func_ov015_021feb30 - Overlay015_FinalizeRecordUpdate
    .size func_ov015_021feb30, . - func_ov015_021feb30
