.text
; Matching fallback for the portable implementation in src/overlays/ov081/overlay081_recovery.c.
.extern func_020593dc
.extern GraphicsSpriteState_SetAnimationIndex
.extern gSoundContext

.global func_ov081_02214f58
func_ov081_02214f58:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    mov r4, r0
    mov r0, #0x4
    strh r0, [r4, #0xd6]
    ldr r0, [r4, #0x230]
    cmp r0, #0x32
    bne .L_02214ff4
    ldrb r0, [r4, #0x257]
    cmp r0, #0x1
    ldr r0, [r4, #0x54]
    bne .L_02214fc8
    mov r1, #0x37
    bl GraphicsSpriteState_SetAnimationIndex
    ldr ip, [r4, #0x54]
    mov r2, #0x0
    ldrh r3, [ip, #0x24]
    mov r1, #0x100
    ldr r0, .L_02215074
    bic r3, r3, #0x3
    strh r3, [ip, #0x24]
    str r2, [sp, #0x0]
    str r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r3, r4
    add r1, r1, #0x33
    bl func_020593dc
    b .L_02215068
.L_02214fc8:
    mov r1, #0x1a
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r1, [r4, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
    ldr r1, [r4, #0x54]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    b .L_02215068
.L_02214ff4:
    ble .L_02215068
    ldrb r0, [r4, #0x257]
    cmp r0, #0x0
    bne .L_02215068
    ldr r0, [r4, #0x10]
    tst r0, #0x2000
    beq .L_02215068
    mov r0, #0x1
    strb r0, [r4, #0x257]
    ldr r0, [r4, #0x54]
    mov r1, #0x37
    bl GraphicsSpriteState_SetAnimationIndex
    ldr ip, [r4, #0x54]
    mov r1, #0x100
    ldrh r3, [ip, #0x24]
    mov r2, #0x0
    ldr r0, .L_02215074
    bic r3, r3, #0x3
    strh r3, [ip, #0x24]
    str r2, [sp, #0x0]
    str r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r3, r4
    add r1, r1, #0x33
    bl func_020593dc
    mov r0, #0x32
    str r0, [r4, #0x230]
    mov r0, #0x5a
    str r0, [r4, #0x234]
.L_02215068:
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
.L_02215074: .word gSoundContext
.size func_ov081_02214f58, . - func_ov081_02214f58
