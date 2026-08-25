    .text
/* Exact fallback; see src/overlays/ov019/overlay019_opening_transition.c. */
    .extern data_ov019_021fd5e8
    .extern GamePhaseCurrencyHud_SetVisible
    .extern SceneSound_PlayPackedEffect
    .extern func_ov002_021fbdc0
    .extern func_ov002_021fbe08
    .extern func_ov002_021fbe60
    .extern func_ov019_021fce00
    .extern func_ov019_021fd170
    .extern gGamePhaseCurrencyHud

.global func_ov019_021fd1b8
func_ov019_021fd1b8:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    beq L_021fd1d8
    cmp r0, #0x1
    beq L_021fd214
    b L_021fd25c
L_021fd1d8:
    ldr r0, L_021fd26c
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl GamePhaseCurrencyHud_SetVisible
    ldr r0, [r4, #0x5c]
    bl func_ov002_021fbdc0
    ldr r1, [r4, #0x20]
    mov r0, #0x0
    bic r1, r1, #0x1
    orr r1, r1, #0x1
    str r1, [r4, #0x20]
    ldr r1, [r4, #0x4]
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
L_021fd214:
    ldr r0, [r4, #0x5c]
    bl func_ov002_021fbe08
    cmp r0, #0x0
    beq L_021fd24c
    ldr r1, L_021fd270
    mov r0, r4
    bl SceneSound_PlayPackedEffect
    mov r0, #0x0
    ldr r1, L_021fd274
    str r0, [r4, #0x60]
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov019_021fce00
    b L_021fd25c
L_021fd24c:
    ldr r0, [r4, #0x5c]
    bl func_ov002_021fbe60
    rsb r0, r0, #0x0
    str r0, [r4, #0x60]
L_021fd25c:
    mov r0, r4
    bl func_ov019_021fd170
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_021fd26c: .word gGamePhaseCurrencyHud
L_021fd270: .word 0x3c84
L_021fd274: .word data_ov019_021fd5e8
    .size func_ov019_021fd1b8, . - func_ov019_021fd1b8
