.text
; Matching fallback for the portable implementation in src/overlays/ov052/overlay052_recovery.c.
.extern data_020f4dc8
.extern data_021052fc
.extern data_ov052_0220e1e0
.extern data_ov052_0220e1e4
.extern data_ov052_0220e1e8
.extern data_ov052_0220e1ec
.extern DisplayBrightness_StartTransition
.extern DisplayBrightness_GetCurrent
.extern DisplayBrightnessPair_GetScreen
.extern GamePhaseAreaScene_SetEnabled
.extern GraphicsSpriteState_SetAnimationIndex
.extern func_020740a4
.extern GraphicsSpriteCanvas_FillRect
.extern func_02093360
.extern func_ov052_0220ddb4
.extern func_ov052_0220df9c
.extern gDebugFont
.extern gPadState1
.extern gTouchPanelManager

.global func_ov052_0220da54
func_ov052_0220da54:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x30
    ldr r3, .L_0220dd90
    add r2, sp, #0x18
    mov r4, r0
    mov r1, #0xb
.L_0220da6c:
    ldrh r0, [r3], #0x2
    subs r1, r1, #0x1
    strh r0, [r2], #0x2
    bne .L_0220da6c
    ldrsh r0, [r4, #0x4]
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    b .L_0220dd7c
.L_0220da8c:
    b .L_0220daa0
    b .L_0220db10
    b .L_0220db34
    b .L_0220dd34
    b .L_0220dd5c
.L_0220daa0:
    ldr r0, .L_0220dd94
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xfb8]
    cmp r0, #0x0
    beq .L_0220dac0
    mov r1, #0x0
    bl GamePhaseAreaScene_SetEnabled
.L_0220dac0:
    mov r0, r4
    bl func_ov052_0220ddb4
    ldr r0, [r4, #0x2c]
    movs r0, r0, asr #0x10
    bne .L_0220daf0
    ldr r0, .L_0220dd98
    mov r1, #0x1
    bl DisplayBrightnessPair_GetScreen
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    bl DisplayBrightness_StartTransition
.L_0220daf0:
    ldr r0, [r4, #0x8]
    mov r0, r0, lsl #0x10
    movs r0, r0, asr #0x10
    movne r0, #0x2
    strneh r0, [r4, #0x4]
    moveq r0, #0x1
    streqh r0, [r4, #0x4]
    b .L_0220dd7c
.L_0220db10:
    mov r0, r4
    mov r1, #0x0
    bl func_ov052_0220df9c
    ldr r2, [r4, #0x28]
    ldr r1, .L_0220dd9c
    ldr r0, [r4, #0x14]
    ldrb r1, [r1, r2]
    bl GraphicsSpriteState_SetAnimationIndex
    b .L_0220dd7c
.L_0220db34:
    ldr r0, .L_0220dda0
    ldr r0, [r0, #0x0]
    ldr r0, [r0, #0x4]
    cmp r0, #0x1
    bne .L_0220db74
    ldr r0, [r4, #0x10]
    ldr r1, [r0, #0x38]
    mov r0, r1, lsl #0x1e
    movs r0, r0, asr #0x1f
    ldrneh r0, [sp, #0x1a]
    str r1, [sp, #0x10]
    orrne r0, r0, #0x1
    strneh r0, [sp, #0x1a]
    ldreqh r0, [sp, #0x1a]
    orreq r0, r0, #0x2
    streqh r0, [sp, #0x1a]
.L_0220db74:
    ldr r0, [r4, #0x10]
    add r1, sp, #0x18
    bl func_02093360
    mov r1, r0, lsl #0x16
    str r0, [sp, #0x8]
    str r0, [sp, #0xc]
    str r0, [sp, #0x14]
    movs r0, r1, asr #0x1f
    beq .L_0220dbc0
    ldr r1, [r4, #0x10]
    ldr r0, .L_0220dd9c
    ldr r1, [r1, #0xe8]
    str r1, [r4, #0x28]
    ldrb r1, [r0, r1]
    ldr r0, [r4, #0x14]
    bl GraphicsSpriteState_SetAnimationIndex
    mov r0, r4
    mov r1, #0x1
    bl func_ov052_0220df9c
.L_0220dbc0:
    ldr r0, [sp, #0x14]
    mov r0, r0, lsl #0x1f
    movs r5, r0, asr #0x1f
    bne .L_0220dbdc
    mov r0, r4
    mov r1, #0x0
    bl func_ov052_0220df9c
.L_0220dbdc:
    ldr r0, [sp, #0x14]
    mov r0, r0, lsl #0x1e
    movs r0, r0, asr #0x1f
    beq .L_0220dc18
    ldr r0, [r4, #0x14]
    ldrh r1, [r0, #0x24]
    and r1, r1, #0x1
    mov r1, r1, lsl #0x10
    movs r1, r1, lsr #0x10
    beq .L_0220dd20
    ldr r2, [r4, #0x28]
    ldr r1, .L_0220dda4
    ldrb r1, [r1, r2]
    bl GraphicsSpriteState_SetAnimationIndex
    b .L_0220dd20
.L_0220dc18:
    cmp r5, #0x0
    beq .L_0220dc64
    mov r0, #0xbf
    mov r1, #0x0
    str r0, [sp, #0x0]
    ldr r0, .L_0220dda8
    str r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r2, r1
    mov r3, #0xff
    bl GraphicsSpriteCanvas_FillRect
    mov r0, #0x1
    strh r0, [r4, #0x4]
    mov r0, #0x10000
    ldr r1, [r4, #0x8]
    rsb r0, r0, #0x0
    and r0, r1, r0
    str r0, [r4, #0x8]
    b .L_0220dd20
.L_0220dc64:
    ldr r1, [r4, #0x14]
    ldr r3, .L_0220dd9c
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x2
    strh r0, [r1, #0x24]
    ldr r0, [r4, #0x14]
    ldr r1, [r4, #0x28]
    ldrb r2, [r0, #0x38]
    ldrb r1, [r3, r1]
    cmp r1, r2
    beq .L_0220dcf4
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r3, [r4, #0x18]
    ldr r2, [r4, #0x28]
    ldr r1, .L_0220ddac
    ldrb r0, [r3, #0x38]
    ldrb r1, [r1, r2]
    cmp r1, r0
    beq .L_0220dcc4
    ldrh r0, [r3, #0x24]
    and r0, r0, #0x1
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    beq .L_0220dd20
.L_0220dcc4:
    mov r0, #0xc8
    str r0, [r4, #0x24]
    ldr r2, [r4, #0x18]
    ldr r1, .L_0220ddb0
    ldrh r0, [r2, #0x24]
    bic r0, r0, #0x1
    strh r0, [r2, #0x24]
    ldr r2, [r4, #0x28]
    ldr r0, [r4, #0x18]
    ldrb r1, [r1, r2]
    bl GraphicsSpriteState_SetAnimationIndex
    b .L_0220dd20
.L_0220dcf4:
    ldrh r2, [r0, #0x24]
    and r1, r2, #0x1
    mov r1, r1, lsl #0x10
    movs r1, r1, lsr #0x10
    beq .L_0220dd20
    bic r1, r2, #0x1
    strh r1, [r0, #0x24]
    ldr r1, [r4, #0x28]
    ldr r0, [r4, #0x14]
    ldrb r1, [r3, r1]
    bl GraphicsSpriteState_SetAnimationIndex
.L_0220dd20:
    ldr r1, [r4, #0x14]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x4
    strh r0, [r1, #0x24]
    b .L_0220dd7c
.L_0220dd34:
    ldr r2, [r4, #0x18]
    mov r0, #0x0
    ldrh r1, [r2, #0x24]
    orr r1, r1, #0x4
    strh r1, [r2, #0x24]
    ldr r2, [r4, #0x14]
    ldrh r1, [r2, #0x24]
    orr r1, r1, #0x4
    strh r1, [r2, #0x24]
    b .L_0220dd88
.L_0220dd5c:
    ldr r0, .L_0220dd98
    mov r1, #0x1
    bl DisplayBrightnessPair_GetScreen
    bl DisplayBrightness_GetCurrent
    mvn r1, #0xf
    cmp r0, r1
    moveq r0, #0x1
    beq .L_0220dd88
.L_0220dd7c:
    ldr r0, [r4, #0x1c]
    bl func_020740a4
    mov r0, #0x0
.L_0220dd88:
    add sp, sp, #0x30
    ldmia sp!, {r3, r4, r5, pc}
.L_0220dd90: .word gPadState1
.L_0220dd94: .word data_021052fc
.L_0220dd98: .word data_020f4dc8
.L_0220dd9c: .word data_ov052_0220e1ec
.L_0220dda0: .word gTouchPanelManager
.L_0220dda4: .word data_ov052_0220e1e0
.L_0220dda8: .word gDebugFont
.L_0220ddac: .word data_ov052_0220e1e8
.L_0220ddb0: .word data_ov052_0220e1e4
.size func_ov052_0220da54, . - func_ov052_0220da54
