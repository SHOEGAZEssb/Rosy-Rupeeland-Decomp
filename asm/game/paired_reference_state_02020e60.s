; Matching retail form; see src/game/paired_reference_state.c.
.text

.global PairedReferenceState_SetReferencesAndReset
    .type PairedReferenceState_SetReferencesAndReset, @function
PairedReferenceState_SetReferencesAndReset: ; 0x02020e60
    stmdb sp!, {r0, r1, r2, r3}
    ldr r2, [sp, #0x4]
    ldr r1, [sp, #0x8]
    str r2, [r0, #0x8]
    str r1, [r0, #0xc]
    mov r1, #0x0
    str r1, [r0, #0x10]
    add sp, sp, #0x10
    bx lr
    .size PairedReferenceState_SetReferencesAndReset, .-PairedReferenceState_SetReferencesAndReset
