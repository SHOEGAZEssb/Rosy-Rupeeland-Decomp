.text
; Matching fallback for the portable implementation in src/overlays/ov066/overlay066_recovery.c.
.extern TouchPanelManager_GetPoint
.extern data_020f4e14
.extern data_021052fc
.extern data_ov066_02210f54
.extern data_ov066_02210f64
.extern data_ov066_02210f74
.extern data_ov066_02210f88
.extern data_ov066_02210f98
.extern data_ov066_02210fb4
.extern GraphicsSpriteRenderer_ClearTextBuffer
.extern GraphicsSpriteRenderer_Printf
.extern GraphicsSpriteCanvas_DrawLine
.extern GraphicsSpriteCanvas_NoOp
.extern func_ov066_0220fee0
.extern func_ov066_02210a9c
.extern gDebugFont
.extern gFrameVCount
.extern gSystemState
.extern gTouchPanelManager

.global func_ov066_0220ff60
func_ov066_0220ff60:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x24
    ldr r1, .L_022103e0
    mov r5, r0
    ldr r0, [r1, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    ldr r0, .L_022103e4
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    ldr r0, [r5, #0x3c]
    cmp r0, #0x0
    beq .L_0220ffa4
    ldr r0, .L_022103e8
    ldr r0, [r0, #0x0]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_0220ffa4:
    ldr r0, .L_022103ec
    ldrh r0, [r0, #0x6]
    tst r0, #0x800
    ldrne r0, [r5, #0x28]
    eorne r0, r0, #0x1
    strne r0, [r5, #0x28]
    bne .L_02210010
    tst r0, #0x2
    beq .L_0220ffe8
    cmp r5, #0x0
    beq .L_0220ffe0
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_0220ffe0:
    mov r0, #0x1
    b .L_022103d8
.L_0220ffe8:
    tst r0, #0x400
    beq .L_02210000
    ldr r0, .L_022103e0
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteCanvas_NoOp
    b .L_02210010
.L_02210000:
    tst r0, #0x1
    beq .L_02210010
    mov r0, r5
    bl func_ov066_0220fee0
.L_02210010:
    ldr r0, .L_022103ec
    ldrh r0, [r0, #0x4]
    tst r0, #0x20
    beq .L_02210044
    ldr r1, [r5, #0x24]
    ldr r0, [r1, #0x194]
    sub r0, r0, #0x6000
    str r0, [r1, #0x194]
    ldr r1, [r5, #0x24]
    ldr r0, [r1, #0x19c]
    sub r0, r0, #0x6000
    str r0, [r1, #0x19c]
    b .L_0221006c
.L_02210044:
    tst r0, #0x10
    beq .L_0221006c
    ldr r1, [r5, #0x24]
    ldr r0, [r1, #0x194]
    add r0, r0, #0x6000
    str r0, [r1, #0x194]
    ldr r1, [r5, #0x24]
    ldr r0, [r1, #0x19c]
    add r0, r0, #0x6000
    str r0, [r1, #0x19c]
.L_0221006c:
    ldr r0, .L_022103ec
    ldrh r0, [r0, #0x4]
    tst r0, #0x40
    beq .L_022100a0
    ldr r1, [r5, #0x24]
    ldr r0, [r1, #0x198]
    sub r0, r0, #0x6000
    str r0, [r1, #0x198]
    ldr r1, [r5, #0x24]
    ldr r0, [r1, #0x1a0]
    sub r0, r0, #0x6000
    str r0, [r1, #0x1a0]
    b .L_022100c8
.L_022100a0:
    tst r0, #0x80
    beq .L_022100c8
    ldr r1, [r5, #0x24]
    ldr r0, [r1, #0x198]
    add r0, r0, #0x6000
    str r0, [r1, #0x198]
    ldr r1, [r5, #0x24]
    ldr r0, [r1, #0x1a0]
    add r0, r0, #0x6000
    str r0, [r1, #0x1a0]
.L_022100c8:
    ldr r0, [r5, #0x28]
    cmp r0, #0x0
    beq .L_0221019c
    ldr r0, .L_022103f0
    ldr r1, [r0, #0x0]
    ldrh r0, [r1, #0x44]
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_02210188
    add r0, sp, #0x18
    bl TouchPanelManager_GetPoint
    ldr r0, [r5, #0x2c]
    cmp r0, #0x0
    beq .L_02210160
    ldr r1, [r5, #0x24]
    ldr r3, [sp, #0x1c]
    ldr r2, [r5, #0x34]
    ldr r0, [r1, #0x194]
    sub r4, r3, r2
    ldr r3, [sp, #0x20]
    ldr r2, [r5, #0x38]
    add r0, r0, r4, lsl #0xc
    str r0, [r1, #0x194]
    ldr r1, [r5, #0x24]
    sub r2, r3, r2
    ldr r0, [r1, #0x19c]
    add r0, r0, r4, lsl #0xc
    str r0, [r1, #0x19c]
    ldr r1, [r5, #0x24]
    ldr r0, [r1, #0x198]
    add r0, r0, r2, lsl #0xc
    str r0, [r1, #0x198]
    ldr r1, [r5, #0x24]
    ldr r0, [r1, #0x1a0]
    add r0, r0, r2, lsl #0xc
    str r0, [r1, #0x1a0]
.L_02210160:
    mov r2, #0x1
    add r1, sp, #0x18
    add r0, r5, #0x30
    str r2, [r5, #0x2c]
    cmp r1, r0
    ldrne r0, [sp, #0x1c]
    strne r0, [r5, #0x34]
    ldrne r0, [sp, #0x20]
    strne r0, [r5, #0x38]
    b .L_02210190
.L_02210188:
    mov r0, #0x0
    str r0, [r5, #0x2c]
.L_02210190:
    ldr r0, [r5, #0x24]
    bl func_ov066_02210a9c
    b .L_022101a4
.L_0221019c:
    mov r0, #0x0
    str r0, [r5, #0x2c]
.L_022101a4:
    ldr r0, [r5, #0x24]
    mov r4, #0x0
    ldr r3, [r0, #0x194]
    ldr r2, [r0, #0x198]
    ldr r1, [r0, #0x19c]
    ldr r0, [r0, #0x1a0]
    cmp r3, #0x0
    str r0, [sp, #0x14]
    orrlt r0, r4, #0x1
    str r3, [sp, #0x8]
    strlt r4, [sp, #0x8]
    movlt r0, r0, lsl #0x10
    str r1, [sp, #0x10]
    movlt r4, r0, lsr #0x10
    ldr r0, [sp, #0x10]
    str r2, [sp, #0xc]
    cmp r0, #0xff000
    orrgt r0, r4, #0x2
    movgt r0, r0, lsl #0x10
    movgt r4, r0, lsr #0x10
    movgt r1, #0xff000
    strgt r1, [sp, #0x10]
    ldr r0, [sp, #0xc]
    ldr ip, [sp, #0x10]
    cmp r0, #0x0
    orrlt r0, r4, #0x4
    movlt r0, r0, lsl #0x10
    movlt r4, r0, lsr #0x10
    movlt r1, #0x0
    ldr r0, [sp, #0x14]
    strlt r1, [sp, #0xc]
    cmp r0, #0xbf000
    orrgt r0, r4, #0x8
    movgt r1, #0xbf000
    movgt r0, r0, lsl #0x10
    ldr r3, [sp, #0x8]
    strgt r1, [sp, #0x14]
    movgt r4, r0, lsr #0x10
    cmp r3, ip
    ldrlt r1, [sp, #0xc]
    ldrlt r0, [sp, #0x14]
    cmplt r1, r0
    bge .L_0221032c
    tst r4, #0x4
    bne .L_0221027c
    mov r2, r1, asr #0xc
    str r2, [sp, #0x0]
    mov r1, #0x2
    ldr r0, .L_022103e0
    str r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r1, r3, asr #0xc
    mov r3, ip, asr #0xc
    bl GraphicsSpriteCanvas_DrawLine
.L_0221027c:
    tst r4, #0x1
    bne .L_022102b8
    ldr r0, [sp, #0x14]
    ldr r1, [sp, #0x8]
    mov r0, r0, asr #0xc
    str r0, [sp, #0x0]
    mov r3, #0x2
    ldr r2, [sp, #0xc]
    mov r1, r1, asr #0xc
    ldr r0, .L_022103e0
    str r3, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r3, r1
    mov r2, r2, asr #0xc
    bl GraphicsSpriteCanvas_DrawLine
.L_022102b8:
    tst r4, #0x8
    bne .L_022102f0
    ldr r0, [sp, #0x14]
    ldr r1, [sp, #0x8]
    mov r2, r0, asr #0xc
    str r2, [sp, #0x0]
    mov ip, #0x2
    ldr r3, [sp, #0x10]
    ldr r0, .L_022103e0
    str ip, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r1, r1, asr #0xc
    mov r3, r3, asr #0xc
    bl GraphicsSpriteCanvas_DrawLine
.L_022102f0:
    tst r4, #0x2
    bne .L_0221032c
    ldr r0, [sp, #0x14]
    ldr r1, [sp, #0x10]
    mov r0, r0, asr #0xc
    str r0, [sp, #0x0]
    mov r3, #0x2
    ldr r2, [sp, #0xc]
    mov r1, r1, asr #0xc
    ldr r0, .L_022103e0
    str r3, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r3, r1
    mov r2, r2, asr #0xc
    bl GraphicsSpriteCanvas_DrawLine
.L_0221032c:
    ldr r0, .L_022103f4
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r0, .L_022103e0
    str r2, [sp, #0x0]
    ldr r0, [r0, #0x0]
    ldr r3, .L_022103f8
    mov r2, r1
    bl GraphicsSpriteRenderer_Printf
    ldr r1, [r5, #0x24]
    ldr r0, .L_022103e0
    ldr r1, [r1, #0x190]
    ldr r3, .L_022103fc
    str r1, [sp, #0x0]
    ldr r0, [r0, #0x0]
    mov r1, #0x1
    mov r2, #0x2
    bl GraphicsSpriteRenderer_Printf
    ldr r0, .L_022103e4
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    ldr r3, .L_02210400
    mov r2, r1
    bl GraphicsSpriteRenderer_Printf
    ldr r0, .L_022103e4
    ldr r3, .L_02210404
    ldr r0, [r0, #0x0]
    mov r1, #0x1
    mov r2, #0x2
    bl GraphicsSpriteRenderer_Printf
    ldr r0, .L_022103e4
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    mov r2, #0x3
    ldr r3, .L_02210408
    bl GraphicsSpriteRenderer_Printf
    ldr r0, .L_022103e4
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    mov r2, #0x4
    ldr r3, .L_0221040c
    bl GraphicsSpriteRenderer_Printf
    mov r0, #0x0
.L_022103d8:
    add sp, sp, #0x24
    ldmia sp!, {r4, r5, pc}
.L_022103e0: .word data_020f4e14
.L_022103e4: .word gDebugFont
.L_022103e8: .word data_021052fc
.L_022103ec: .word gSystemState
.L_022103f0: .word gTouchPanelManager
.L_022103f4: .word gFrameVCount
.L_022103f8: .word data_ov066_02210f54
.L_022103fc: .word data_ov066_02210f64
.L_02210400: .word data_ov066_02210f74
.L_02210404: .word data_ov066_02210f88
.L_02210408: .word data_ov066_02210f98
.L_0221040c: .word data_ov066_02210fb4
.size func_ov066_0220ff60, . - func_ov066_0220ff60
