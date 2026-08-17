    .text
/* Exact fallback; see src/overlays/ov021/overlay021_selection_display.c. */
    .extern Overlay000_GetActiveMetadata
    .extern func_ov021_021ff404
    .extern func_ov021_021ff504
    .extern func_ov021_021ff62c

.global func_ov021_021ff5b8
func_ov021_021ff5b8:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x354]
    bl Overlay000_GetActiveMetadata
    ldr r4, [r0, #0xc]
    mov r0, r5
    mov r1, r4
    bl func_ov021_021ff504
    ldr r0, [r5, #0x354]
    bl Overlay000_GetActiveMetadata
    mov r1, #0x1
    bl func_ov021_021ff62c
    cmp r0, #0x0
    beq L_021ff600
    mov r0, r5
    mov r1, #0x0
    bl func_ov021_021ff404
    ldmia sp!, {r3, r4, r5, pc}
L_021ff600:
    cmp r4, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r1, [r4, #0xc]
    cmp r1, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r0, r5
    bl func_ov021_021ff404
    ldmia sp!, {r3, r4, r5, pc}
    .size func_ov021_021ff5b8, . - func_ov021_021ff5b8

