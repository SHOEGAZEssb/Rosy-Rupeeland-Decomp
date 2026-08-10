.text
; Matching fallback for the portable implementation in src/overlays/ov087/overlay087_recovery.c.
.extern Sound_Play
.extern GraphicsSpriteState_SetAnimationIndex
.extern func_020740c8
.extern gSoundContext

.global func_ov087_02217f44
func_ov087_02217f44:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    mov r4, r0
    add r0, r4, #0x200
    ldrh r1, [r0, #0x1a]
    tst r1, #0x2
    beq .L_02217f84
    bic r1, r1, #0x2
    strh r1, [r0, #0x1a]
    mov r1, #0x2
    ldr r0, .L_0221810c
    strh r1, [r4, #0xd6]
    ldr r0, [r0, #0x0]
    mov r1, #0x67
    mov r2, #0x6
    bl Sound_Play
.L_02217f84:
    ldrsh r2, [r4, #0xd6]
    ldr r1, [r4, #0x54]
    ldr r0, [r1, #0x0]
    cmp r2, #0x5
    addls pc, pc, r2, lsl #0x2
    b .L_02218104
.L_02217f9c:
    b .L_02218104
    b .L_02217fb4
    b .L_02217ff8
    b .L_0221802c
    b .L_02218078
    b .L_022180c4
.L_02217fb4:
    ldr r2, [r4, #0x1f8]
    str r2, [sp, #0x0]
    ldr r2, [r4, #0x1f0]
    ldr r3, [r4, #0x1f4]
    bl func_020740c8
    ldrb r1, [r4, #0xd4]
    ldr r0, [r4, #0x54]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r1, [r4, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
    ldr r1, [r4, #0x54]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    b .L_02218104
.L_02217ff8:
    ldr r3, [r4, #0x220]
    ldr r2, [r3, #0xc]
    str r2, [sp, #0x0]
    ldmib r3, {r2, r3}
    bl func_020740c8
    ldrb r1, [r4, #0xd4]
    ldr r0, [r4, #0x54]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r1, [r4, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x3
    strh r0, [r1, #0x24]
    b .L_02218104
.L_0221802c:
    ldr r3, [r4, #0x220]
    ldr r2, [r3, #0xc]
    str r2, [sp, #0x0]
    ldmib r3, {r2, r3}
    bl func_020740c8
    ldrb r1, [r4, #0xd4]
    ldr r0, [r4, #0x54]
    add r1, r1, #0x10
    and r1, r1, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r1, [r4, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
    ldr r1, [r4, #0x54]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    b .L_02218104
.L_02218078:
    ldr r3, [r4, #0x220]
    ldr r2, [r3, #0xc]
    str r2, [sp, #0x0]
    ldmib r3, {r2, r3}
    bl func_020740c8
    ldrb r1, [r4, #0xd4]
    ldr r0, [r4, #0x54]
    add r1, r1, #0x8
    and r1, r1, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r1, [r4, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
    ldr r1, [r4, #0x54]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    b .L_02218104
.L_022180c4:
    ldr r2, [r4, #0x1f8]
    str r2, [sp, #0x0]
    ldr r2, [r4, #0x1f0]
    ldr r3, [r4, #0x1f4]
    bl func_020740c8
    ldr r0, [r4, #0x54]
    mov r1, #0x13
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r1, [r4, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
    ldr r1, [r4, #0x54]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
.L_02218104:
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
.L_0221810c: .word gSoundContext
.size func_ov087_02217f44, . - func_ov087_02217f44
