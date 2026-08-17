.text

/* Exact fallback; see src/overlays/ov022/overlay022_action_setup.c. */
.extern data_ov022_02200664
.extern GraphicsSpriteText_FormatDecimal
.extern func_0207c460
.extern TitleDialog_ClearTextRect
.extern func_ov022_021ff2c4


    .global func_ov022_021feac8
func_ov022_021feac8:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x10
    mov r4, r0
    ldr r0, [r4, #0x360]
    ldr r3, L_021feb68
    ldrh r1, [r0, #0x1a]
    mov r2, #0x0
    add r0, sp, #0x0
    str r2, [sp, #0x4]
    str r3, [sp, #0x0]
    str r2, [sp, #0x8]
    str r2, [sp, #0xc]
    bl func_0207c460
    ldr r0, [sp, #0x4]
    mov r3, #0x0
    add r2, r0, #0x2c
    b L_021feb2c
L_021feb0c:
    mov r0, r3, lsl #0x1
    ldrh r1, [r2, r0]
    add r0, r4, r3, lsl #0x1
    add r0, r0, #0x200
    strh r1, [r0, #0xd0]
    cmp r1, #0x0
    beq L_021feb34
    add r3, r3, #0x1
L_021feb2c:
    cmp r3, #0x20
    blt L_021feb0c
L_021feb34:
    ldr r0, [r4, #0x360]
    ldr r2, L_021feb6c
    ldrh r1, [r0, #0x18]
    add r0, r4, #0x310
    mov r3, #0x0
    bl GraphicsSpriteText_FormatDecimal
    ldr r0, [r4, #0x2cc]
    bl TitleDialog_ClearTextRect
    ldr r1, L_021feb70
    mov r0, r4
    bl func_ov022_021ff2c4
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
L_021feb68: .word data_ov022_02200664
L_021feb6c: .word 0xff676980
L_021feb70: .word 0x203
.size func_ov022_021feac8, .-func_ov022_021feac8

