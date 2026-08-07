    .text
    .extern func_02093b20
    .extern func_02093c78
    .extern func_ov006_021fb9b4
    .extern func_02093b30
    .extern func_02093b3c
    .extern func_02093b64
    .extern func_02093bdc
    .extern func_02092260
    .extern func_ov006_021fb950

    /* Exact fallback; see the documented portable reconstruction in
     * src/overlays/ov006/overlay006_selection_interaction_update.c. */
    .global func_ov006_021fbafc
func_ov006_021fbafc: ; 0x021fbafc
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    beq L_021fbb24
    cmp r0, #0x1
    beq L_021fbb40
    cmp r0, #0x2
    beq L_021fbb8c
    b L_021fbbf0
L_021fbb24:
    add r0, r4, #0x58
    bl func_02093b20
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
L_021fbb40:
    add r0, r4, #0x58
    bl func_02093c78
    cmp r0, #0x0
    beq L_021fbb80
    ldr r1, [r4, #0x64]
    ldr r0, [r4, #0x68]
    cmp r1, r0
    beq L_021fbb68
    mov r0, r4
    bl func_ov006_021fb9b4
L_021fbb68:
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021fbb8c
L_021fbb80:
    mov r0, r4
    bl func_ov006_021fb9b4
    b L_021fbbf0
L_021fbb8c:
    add r0, r4, #0x58
    bl func_02093b30
    ldr r0, [r4, #0x2c]
    ldrh r0, [r0, #0x0]
    tst r0, #0x40
    beq L_021fbbb0
    add r0, r4, #0x58
    bl func_02093b3c
    b L_021fbbc0
L_021fbbb0:
    tst r0, #0x80
    beq L_021fbbc0
    add r0, r4, #0x58
    bl func_02093b64
L_021fbbc0:
    add r0, r4, #0x58
    bl func_02093bdc
    cmp r0, #0x0
    beq L_021fbbf0
    mov r0, r4
    mov r1, #0x0
    bl func_02092260
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    sub r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
L_021fbbf0:
    mov r0, r4
    bl func_ov006_021fb950
    mov r0, #0x0
    ldmia sp!, {r4, pc}

    .size func_ov006_021fbafc, .-func_ov006_021fbafc
