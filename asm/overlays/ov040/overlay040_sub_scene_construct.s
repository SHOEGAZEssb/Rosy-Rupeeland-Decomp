.text
/* Exact fallback; see overlay040_state_setup.c for portable C. */
    .extern func_ov040_021fce00
    .extern func_ov040_0220255c
    .extern GXS_SetGraphicsMode
    .extern GX_SetBankForSubBG
    .extern func_020aea7c
    .extern data_ov040_0220429c
    .global func_ov040_02202590
func_ov040_02202590:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    mov r5, r1
    bl func_ov040_021fce00
    ldr r1, .Lvtable
    mov r0, #0x0
    str r1, [r4]
    str r5, [r4, #0x48]
    bl GXS_SetGraphicsMode
    ldr r2, .Lsub_display
    mov r0, #0x4
    ldr r1, [r2]
    bic r1, r1, #0x1f00
    orr r1, r1, #0x1100
    str r1, [r2]
    bl GX_SetBankForSubBG
    mov r0, #0x80
    bl func_020aea7c
    mov r0, #0x1
    str r0, [sp]
    mov r0, #0x0
    mov r1, r0
    mov r2, #0x1c
    mov r3, r0
    bl func_ov040_0220255c
    ldr r12, .Lsub_bg0
    mov r2, #0x0
    ldrh r3, [r12]
    mov r1, #0x1
    mov r0, r4
    bic r3, r3, #0x3
    orr r3, r3, #0x3
    strh r3, [r12]
    str r2, [r12, #0x8]
    str r1, [r4, #0x50]
    ldmia sp!, {r3, r4, r5, pc}
.Lvtable: .word data_ov040_0220429c
.Lsub_display: .word 0x04001000
.Lsub_bg0: .word 0x04001008
    .size func_ov040_02202590, .-func_ov040_02202590
