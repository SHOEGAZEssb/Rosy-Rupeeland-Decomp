    .text
    .extern func_ov000_021fb890
    .extern Overlay000_PopulatePresentation
    .extern Overlay000_GetActiveMetadata

/* Exact fallback; see src/overlays/ov014/overlay014_presentation_toggle.c. */
    .global func_ov014_021fd2f8

func_ov014_021fd2f8:
    stmdb sp!, {r4, lr}
    mov r4, r0
    cmp r1, #0x0
    bne L_021fd334
    ldr r0, [r4, #0x78]
    bl Overlay000_GetActiveMetadata
    ldr r1, [r0, #0xc]
    cmp r1, #0x0
    beq L_021fd334
    ldr r0, [r4, #0x88]
    bl Overlay000_PopulatePresentation
    ldr r0, [r4, #0x4c]
    orr r0, r0, #0x2
    str r0, [r4, #0x4c]
    ldmia sp!, {r4, pc}
L_021fd334:
    ldr r0, [r4, #0x88]
    mov r1, #0x1
    bl func_ov000_021fb890
    ldr r0, [r4, #0x4c]
    bic r0, r0, #0x2
    str r0, [r4, #0x4c]
    ldmia sp!, {r4, pc}
    .size func_ov014_021fd2f8, . - func_ov014_021fd2f8
