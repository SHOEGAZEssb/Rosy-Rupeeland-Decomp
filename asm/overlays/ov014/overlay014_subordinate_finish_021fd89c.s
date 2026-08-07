    .text
    .extern func_ov000_021fc164

/* Exact fallback; see src/overlays/ov014/overlay014_state_helpers.c. */
    .global func_ov014_021fd89c

func_ov014_021fd89c:
    stmdb sp!, {r3, lr}
    ldr r0, [r0, #0x78]
    cmp r0, #0x0
    beq L_021fd8b0
    bl func_ov000_021fc164
L_021fd8b0:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
    .size func_ov014_021fd89c, . - func_ov014_021fd89c
