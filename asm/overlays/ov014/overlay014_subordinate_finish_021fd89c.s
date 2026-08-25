    .text
    .extern Overlay000_Grid_Update

/* Exact fallback; see src/overlays/ov014/overlay014_state_helpers.c. */
    .global Overlay014_UpdateSubordinate

Overlay014_UpdateSubordinate:
    stmdb sp!, {r3, lr}
    ldr r0, [r0, #0x78]
    cmp r0, #0x0
    beq L_021fd8b0
    bl Overlay000_Grid_Update
L_021fd8b0:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
    .size Overlay014_UpdateSubordinate, . - Overlay014_UpdateSubordinate
