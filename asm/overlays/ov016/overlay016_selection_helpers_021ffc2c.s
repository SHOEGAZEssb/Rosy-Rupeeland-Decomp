    .text

/* Exact fallback; see src/overlays/ov016/overlay016_selection_helpers.c. */
    .extern func_ov000_021fb890
    .extern Overlay000_PopulatePresentation
    .extern Overlay000_GetActiveMetadata
    .extern func_ov016_021ff848
.global func_ov016_021ffc2c
func_ov016_021ffc2c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x54]
    cmp r1, #0x1
    bne L_021ffca4
    ldr r1, [r4, #0x47c]
    cmp r1, #0x0
    beq L_021ffc58
    mov r1, #0x20
    bl func_ov016_021ff848
    ldmia sp!, {r4, pc}
L_021ffc58:
    ldr r0, [r4, #0x44c]
    bl Overlay000_GetActiveMetadata
    ldr r1, [r0, #0xc]
    ldr r0, [r4, #0x450]
    cmp r1, #0x0
    beq L_021ffc80
    bl Overlay000_PopulatePresentation
    ldr r0, [r4, #0x4c]
    orr r0, r0, #0x2
    b L_021ffc90
L_021ffc80:
    mov r1, #0x1
    bl func_ov000_021fb890
    ldr r0, [r4, #0x4c]
    bic r0, r0, #0x2
L_021ffc90:
    str r0, [r4, #0x4c]
    mov r0, r4
    mov r1, #0x20
    bl func_ov016_021ff848
    ldmia sp!, {r4, pc}
L_021ffca4:
    mov r1, #0x20
    bl func_ov016_021ff848
    ldmia sp!, {r4, pc}
    .size func_ov016_021ffc2c, . - func_ov016_021ffc2c

