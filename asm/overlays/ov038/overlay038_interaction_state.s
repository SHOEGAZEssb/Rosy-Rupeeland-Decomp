.text

/* Exact fallback; see src/overlays/ov038/overlay038_interaction_state.c for documented portable C. */

    .extern func_02094874
    .extern func_02093ffc
    .extern func_ov038_021fd578
    .extern func_02093de4
    .extern func_02093e0c
    .extern func_02093e20
    .extern func_ov038_021fd670
    .extern func_02094638
    .extern func_02094668
    .extern func_020945c8
    .extern func_02094600
    .extern func_02094698
    .extern func_02093e3c
    .extern func_02093e58
    .extern func_02092260
    .extern func_02093d50
    .extern func_ov038_021fd508
    .extern func_02028100
    .extern func_ov046_0220c3bc
    .extern func_ov046_0220c410
    .extern func_ov046_0220c46c
    .extern func_ov038_021fd540
    .extern func_ov046_0220bffc
    .extern func_ov038_021fd624
    .extern func_02095860
    .extern func_02094758
    .extern func_ov038_021fce04
    .extern func_ov038_021fd37c
    .extern data_ov038_021fdca8
    .extern data_ov038_021fdcb8

    .global func_ov038_021fd7f8
func_ov038_021fd7f8:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    beq L_021fd820
    cmp r0, #0x1
    beq L_021fd83c
    cmp r0, #0x2
    beq L_021fd870
    b L_021fdab4
L_021fd820:
    ldr r0, [r4, #0x314]
    bl func_02094874
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
L_021fd83c:
    ldr r0, [r4, #0x314]
    bl func_02093ffc
    cmp r0, #0x0
    beq L_021fd864
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021fd870
L_021fd864:
    mov r0, r4
    bl func_ov038_021fd578
    b L_021fdab4
L_021fd870:
    ldr r0, [r4, #0x314]
    bl func_02093de4
    ldr r0, [r4, #0x2c]
    ldrh r0, [r0, #0x0]
    tst r0, #0x40
    beq L_021fd894
    ldr r0, [r4, #0x314]
    bl func_02093e0c
    b L_021fda84
L_021fd894:
    tst r0, #0x80
    beq L_021fd8a8
    ldr r0, [r4, #0x314]
    bl func_02093e20
    b L_021fda84
L_021fd8a8:
    ldr r0, [r4, #0x20]
    mov r0, r0, lsl #0x1b
    movs r0, r0, asr #0x1f
    beq L_021fda84
    mov r0, r4
    bl func_ov038_021fd670
    mov r5, r0
    ldr r0, [r4, #0x314]
    add r1, r4, #0x30
    bl func_02094638
    cmp r0, #0x0
    ldr r0, [r4, #0x314]
    beq L_021fd8e4
    bl func_02093e3c
    b L_021fda84
L_021fd8e4:
    add r1, r4, #0x30
    bl func_02094668
    cmp r0, #0x0
    beq L_021fd900
    ldr r0, [r4, #0x314]
    bl func_02093e58
    b L_021fda84
L_021fd900:
    ldr r0, [r4, #0x20]
    mov r0, r0, lsl #0x1a
    movs r0, r0, asr #0x1f
    beq L_021fda84
    ldr r0, [r4, #0x314]
    add r1, r4, #0x30
    bl func_020945c8
    cmp r0, #0x0
    ldr r0, [r4, #0x314]
    beq L_021fd944
    bl func_02093e3c
    cmp r0, #0x0
    bne L_021fda84
    mov r0, r4
    mov r1, #0x16
    bl func_02092260
    b L_021fda84
L_021fd944:
    add r1, r4, #0x30
    bl func_02094600
    cmp r0, #0x0
    ldr r0, [r4, #0x314]
    beq L_021fd974
    bl func_02093e58
    cmp r0, #0x0
    bne L_021fda84
    mov r0, r4
    mov r1, #0x16
    bl func_02092260
    b L_021fda84
L_021fd974:
    add r1, r4, #0x30
    bl func_02094698
    cmp r0, #0x0
    beq L_021fd998
    ldr r1, L_021fdac4
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov038_021fce04
    b L_021fdab4
L_021fd998:
    cmp r5, #0x0
    blt L_021fda4c
    ldr r0, [r4, #0x314]
    ldr r0, [r0, #0x14]
    cmp r5, r0
    beq L_021fda84
    mov r0, r4
    mov r1, #0x0
    bl func_02092260
    ldr r0, [r4, #0x314]
    mov r1, r5
    bl func_02093d50
    mov r0, r4
    bl func_ov038_021fd508
    mov r1, r0
    ldr r0, [r4, #0x344]
    bl func_02028100
    mov r0, r4
    bl func_ov038_021fd508
    mov r1, r0
    ldr r0, [r4, #0x340]
    bl func_ov046_0220c3bc
    mov r5, r0
    mov r0, r4
    bl func_ov038_021fd508
    mov r1, r0
    ldr r0, [r4, #0x340]
    bl func_ov046_0220c410
    mov r1, r5
    mov r2, r0
    ldr r0, [r4, #0x340]
    bl func_ov046_0220c46c
    mov r0, r4
    bl func_ov038_021fd508
    mov r5, r0
    mov r0, r4
    bl func_ov038_021fd540
    mov r1, r5
    mov r3, r0
    ldr r0, [r4, #0x340]
    mov r2, #0x1
    bl func_ov046_0220bffc
    mov r0, r4
    bl func_ov038_021fd624
    b L_021fda84
L_021fda4c:
    add r0, r4, #0x64
    add r1, r4, #0x30
    mov r2, #0x0
    mov r3, #0x4
    bl func_02095860
    cmp r0, #0x0
    beq L_021fda84
    mov r0, r4
    mov r1, #0x3
    bl func_02092260
    ldr r1, L_021fdac8
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov038_021fce04
L_021fda84:
    ldr r0, [r4, #0x314]
    bl func_02094758
    cmp r0, #0x0
    beq L_021fdab4
    mov r0, r4
    mov r1, #0x0
    bl func_02092260
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    sub r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
L_021fdab4:
    mov r0, r4
    bl func_ov038_021fd37c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
L_021fdac4: .word data_ov038_021fdca8
L_021fdac8: .word data_ov038_021fdcb8
    .size func_ov038_021fd7f8, .-func_ov038_021fd7f8

