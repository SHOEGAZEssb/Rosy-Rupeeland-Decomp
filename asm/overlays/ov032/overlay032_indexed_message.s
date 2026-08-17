.text

/* Exact fallback; see src/overlays/ov032/overlay032_text_helpers.c for documented portable C. */
.extern data_020c7ba8
.extern data_021f3ecc
.extern func_020791e0
.extern TitleDialog_SetText
.extern TitleDialog_UpdateTextPage
.extern func_020939c8
.extern TitleDialog_ClearTextRect

    .global func_ov032_021fe440
func_ov032_021fe440:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r1, [r4, #0xc24]
    mov r0, #0x208
    mul r2, r1, r0
    ldr r1, L_021fe4a0
    ldr r0, [r4, #0x18]
    ldr r1, [r1, r2]
    mov r1, r1, lsl #0x10
    mov r5, r1, lsr #0x10
    bl TitleDialog_ClearTextRect
    ldr r0, L_021fe4a4
    mov r1, r5
    bl func_020791e0
    mov r1, r0
    ldr r0, [r4, #0x18]
    mov r2, #0x0
    bl TitleDialog_SetText
    ldr r0, [r4, #0x18]
    bl func_020939c8
    ldr r0, [r4, #0x18]
    mov r1, #0x0
    bl TitleDialog_UpdateTextPage
    ldmia sp!, {r3, r4, r5, pc}
L_021fe4a0: .word data_020c7ba8
L_021fe4a4: .word data_021f3ecc
.size func_ov032_021fe440, .-func_ov032_021fe440

