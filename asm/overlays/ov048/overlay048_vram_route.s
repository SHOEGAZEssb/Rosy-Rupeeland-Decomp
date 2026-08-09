.text
; Matching fallback for the portable implementation in src/overlays/ov048/overlay048_display_recovery.c.
.extern GX_SetBankForLCDC
.extern GX_SetBankForSubBG
.extern func_020ae6c8
.extern func_020ae6dc
.extern func_020aeb08
.extern func_ov048_0220ba54

.global func_ov048_0220b9bc
func_ov048_0220b9bc:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0xc
    mov r4, r0
    ldr r0, [r4, #0x0]
    cmp r0, #0x0
    bne .L_0220ba10
    mov r0, #0x8
    bl func_020aeb08
    bl func_020ae6dc
    mov r0, #0x4
    bl GX_SetBankForLCDC
    mov r1, #0x0
    mov r0, #0x2
    str r0, [sp, #0x0]
    mov r0, #0x10
    stmib sp, {r0, r1}
    mov r0, #0x3
    mov r2, r1
    mov r3, r1
    bl func_ov048_0220ba54
    b .L_0220ba48
.L_0220ba10:
    mov r0, #0x4
    bl GX_SetBankForSubBG
    bl func_020ae6c8
    mov r0, #0x8
    bl GX_SetBankForLCDC
    mov r1, #0x0
    mov r0, #0x3
    str r0, [sp, #0x0]
    mov r2, #0x10
    str r2, [sp, #0x4]
    str r1, [sp, #0x8]
    mov r2, r1
    mov r3, r1
    bl func_ov048_0220ba54
.L_0220ba48:
    ldr r0, [r4, #0x0]
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, pc}
.size func_ov048_0220b9bc, . - func_ov048_0220b9bc
