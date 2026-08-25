    .text
    .extern data_ov014_021fd928
    .extern func_ov000_021fc59c
    .extern func_ov000_021fc5c4
    .extern func_ov000_021fc5ec
    .extern Overlay014_SetCallbackDescriptor

/* Exact fallback; see src/overlays/ov014/overlay014_state_helpers.c. */
    .global Overlay014_ResetState

Overlay014_ResetState:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x78]
    bl func_ov000_021fc59c
    ldr r0, [r4, #0x78]
    bl func_ov000_021fc5c4
    ldr r0, [r4, #0x78]
    bl func_ov000_021fc5ec
    ldr r1, L_021fd388
    mov r0, r4
    ldmia r1, {r1, r2}
    bl Overlay014_SetCallbackDescriptor
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_021fd388: .word data_ov014_021fd928
    .size Overlay014_ResetState, . - Overlay014_ResetState
