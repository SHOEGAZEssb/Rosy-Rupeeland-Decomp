    .text
    .extern func_02091bac
    .extern func_02091b98

    /* Exact fallback; see the documented portable reconstruction in
     * src/overlays/ov005/overlay005_scene_selection_set.c. */
    .global func_ov005_021fbd74
func_ov005_021fbd74: ; 0x021fbd74
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    mov r4, r0
    mov r3, #0x0
    b L_021fbda0
L_021fbd88:
    add r0, r4, r3, lsl #0x2
    ldr r2, [r0, #0xc8]
    add r3, r3, #0x1
    ldrh r0, [r2, #0x24]
    orr r0, r0, #0x4
    strh r0, [r2, #0x24]
L_021fbda0:
    ldr r0, [r4, #0x108]
    cmp r3, r0
    ble L_021fbd88
    add r0, r4, r1, lsl #0x2
    ldr r2, [r0, #0xc8]
    mov r3, #0xa000
    cmp r2, #0x0
    ldrneh r0, [r2, #0x24]
    bicne r0, r0, #0x4
    strneh r0, [r2, #0x24]
    str r1, [r4, #0x100]
    mov r0, #0xa
    str r0, [sp, #0x0]
    ldr r2, [r4, #0x120]
    add r0, r4, #0x110
    mov r1, #0x2
    bl func_02091bac
    add r0, r4, #0x12c
    mov r1, #0x1
    bl func_02091b98
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}

    .size func_ov005_021fbd74, .-func_ov005_021fbd74
