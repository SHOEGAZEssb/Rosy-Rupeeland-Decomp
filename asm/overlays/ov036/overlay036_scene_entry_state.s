.text

/* Exact fallback; see src/overlays/ov036/overlay036_scene_state_callbacks.c for documented portable C. */

    .extern func_02059230
    .extern func_ov036_022045ac
    .extern gSoundContext
    .extern data_ov036_02205ad8

    .global func_ov036_02204b80
func_ov036_02204b80:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    beq L_02204ba0
    cmp r0, #0x1
    beq L_02204bc8
    b L_02204be8
L_02204ba0:
    ldr r0, L_02204bf0
    ldr r2, [r4, #0x58]
    ldr r0, [r0, #0x0]
    mov r1, #0x1
    bl func_02059230
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
L_02204bc8:
    ldr r0, [r4, #0x20]
    ldr r1, L_02204bf4
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    str r0, [r4, #0x20]
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov036_022045ac
L_02204be8:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_02204bf0: .word gSoundContext
L_02204bf4: .word data_ov036_02205ad8
    .size func_ov036_02204b80, .-func_ov036_02204b80

