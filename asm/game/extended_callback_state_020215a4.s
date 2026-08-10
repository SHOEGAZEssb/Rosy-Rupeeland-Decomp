; Matching retail form; see src/game/extended_callback_state.c.
.text
.global ExtendedCallbackState_SetReferencesAndReset
    .type ExtendedCallbackState_SetReferencesAndReset, @function
ExtendedCallbackState_SetReferencesAndReset:
    stmdb sp!, {r0, r1, r2, r3}
    ldr r2, [sp, #0x4]
    ldr r1, [sp, #0x8]
    str r2, [r0, #0x8]
    str r1, [r0, #0xc]
    mov r1, #0x0
    str r1, [r0, #0x10]
    str r1, [r0, #0x14]
    add sp, sp, #0x10
    bx lr
    .size ExtendedCallbackState_SetReferencesAndReset, .-ExtendedCallbackState_SetReferencesAndReset
