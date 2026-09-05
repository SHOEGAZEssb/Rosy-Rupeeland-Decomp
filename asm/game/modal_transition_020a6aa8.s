.text
; Matching fallback for the portable implementation in src/game/modal_transition.c.
.extern Graphics3dPresentation_BeginFrame
.extern GraphicsImmediateEffectRenderer_DrawTexturedQuad
.extern GraphicsImmediateEffectRenderer_SetupProjection
.extern RuntimePresentationManager_GetGraphics3dPresentation
.extern VecFx32Object_Assign
.extern VecFx32Object_Destroy
.extern VecFx32Object_InitCopy
.extern data_020c959c
.extern func_0209c7e8
.extern func_0209c87c
.extern gGamePhaseRuntime

.global func_020a6aa8
func_020a6aa8:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x154
    mvn r10, #0x37
    mov r6, r0
    add r0, r10, #0x24
    str r10, [sp, #0xd4]
    mov r8, #0x14
    add r9, sp, #0xdc
    mov r5, r1
    mov lr, #0x20
    add r11, sp, #0xec
    mov r7, #0x3f
    str r0, [sp, #0xd8]
    str r8, [r9, #0x4]
    stmia r11, {r7, lr}
    add ip, sp, #0xfc
    str r8, [ip, #0x4]
    add r1, sp, #0x10c
    stmia r1, {r7, lr}
    add r1, sp, #0xf4
    str r0, [r1, #0x4]
    sub r0, lr, #0x4c
    str r0, [r1, #0x0]
    mov r0, #0x38
    str r0, [r9, #0x0]
    mov r10, #0x2c
    str r10, [ip, #0x0]
    add r3, sp, #0x11c
    mov r1, #0x10000
    mov r0, #0x58000
    stmia r3, {r7, lr}
    sub r9, r8, #0x54
    add r10, sp, #0xe4
    add r3, sp, #0x104
    sub r8, r8, #0x34
    str r1, [sp, #0x54]
    add r1, sp, #0x114
    str r0, [sp, #0x58]
    add r0, sp, #0x124
    mov r4, r2
    str r9, [r10, #0x0]
    str r8, [r10, #0x4]
    str r9, [r3, #0x0]
    str r8, [r3, #0x4]
    str r9, [r1, #0x0]
    str r8, [r1, #0x4]
    str r9, [r0, #0x0]
    str r8, [r0, #0x4]
    add r0, sp, #0x12c
    stmia r0, {r7, lr}
    add r10, sp, #0x134
    str r9, [r10, #0x0]
    str r8, [r10, #0x4]
    add r0, sp, #0x13c
    stmia r0, {r7, lr}
    add r3, sp, #0x144
    add r2, sp, #0x14c
    str r9, [r3, #0x0]
    str r8, [r3, #0x4]
    stmia r2, {r7, lr}
    ldr r0, .L_020a6e88
    ldr r1, .L_020a6e8c
    ldr r0, [r0, #0x0]
    add r8, sp, #0x44
    add r7, r0, #0x37c
    ldmia r1, {r0, r1, r2, r3}
    stmia r8, {r0, r1, r2, r3}
    add r0, r7, #0x2c00
    mov r11, #0x80000
    add ip, sp, #0x5c
    add r10, sp, #0x6c
    mov r9, #0x40000
    add r2, sp, #0xac
    add r8, sp, #0x8c
    add r3, sp, #0x9c
    add lr, sp, #0xbc
    add r1, sp, #0xcc
    add r7, sp, #0x64
    str r11, [r10, #0x0]
    str r9, [r10, #0x4]
    mov r10, #0x0
    str r10, [r7, #0x0]
    str r10, [r7, #0x4]
    add r7, sp, #0x84
    str r10, [r7, #0x0]
    str r10, [r7, #0x4]
    add r7, sp, #0xa4
    str r10, [r7, #0x0]
    str r10, [r7, #0x4]
    add r7, sp, #0x74
    str r11, [r2, #0x0]
    str r9, [r2, #0x4]
    mov r2, #0x50000
    str r2, [r7, #0x0]
    mov r2, #0xa8000
    str r2, [r7, #0x4]
    add r7, sp, #0x7c
    str r2, [r7, #0x0]
    mov r2, #0xd0000
    str r11, [r8, #0x0]
    str r9, [r8, #0x4]
    add r8, sp, #0x94
    str r10, [r8, #0x0]
    str r10, [r8, #0x4]
    add r8, sp, #0xb4
    str r11, [r3, #0x0]
    str r9, [r3, #0x4]
    add r3, sp, #0xc4
    str r11, [ip, #0x0]
    str r11, [ip, #0x4]
    str r10, [r8, #0x0]
    str r2, [r7, #0x4]
    str r10, [r8, #0x4]
    str r11, [lr, #0x0]
    str r9, [lr, #0x4]
    str r10, [r3, #0x0]
    str r10, [r3, #0x4]
    str r11, [r1, #0x0]
    str r9, [r1, #0x4]
    bl RuntimePresentationManager_GetGraphics3dPresentation
    mov r7, r0
    cmp r4, #0x3
    bne .L_020a6cb0
    mov r1, r5
    bl Graphics3dPresentation_BeginFrame
    mov r1, r5
    add r0, r7, #0x84
    bl VecFx32Object_Assign
    mov r0, r7
    bl GraphicsImmediateEffectRenderer_SetupProjection
.L_020a6cb0:
    ldr r0, [r6, #0x20]
    cmp r0, #0x0
    blt .L_020a6e80
    add r0, sp, #0x34
    mov r1, r6
    bl VecFx32Object_InitCopy
    ldr r1, [sp, #0x38]
    ldr r0, [r5, #0x4]
    ldr r2, [sp, #0x3c]
    add r0, r1, r0
    str r0, [sp, #0x38]
    ldr r1, [r5, #0x8]
    sub r0, r4, #0x5
    add r1, r2, r1
    str r1, [sp, #0x3c]
    cmp r0, #0x2
    bhi .L_020a6d2c
    ldr r2, [r6, #0x8]
    ldr r0, .L_020a6e90
    mov r1, #0x0
    umull r8, r3, r2, r0
    mla r3, r2, r1, r3
    mov r1, r2, asr #0x1f
    adds r2, r8, #0x800
    mla r3, r1, r0, r3
    adc r0, r3, #0x0
    mov r1, r2, lsr #0xc
    ldr r2, [r5, #0x8]
    orr r1, r1, r0, lsl #0x14
    add r0, r2, r1
    str r0, [sp, #0x3c]
.L_020a6d2c:
    sub r2, r4, #0x4
    cmp r2, #0x3
    mov r3, #0x0
    bhi .L_020a6e30
    mov r8, r4, lsl #0x1
    add r9, sp, #0xd4
    ldr r1, [r9, r8, lsl #0x3]
    add r4, sp, #0xd8
    add r3, r8, #0x1
    ldr ip, [r9, r3, lsl #0x3]
    ldr r11, [r4, r3, lsl #0x3]
    ldr r0, [r4, r8, lsl #0x3]
    add r3, sp, #0x44
    ldr r4, [r3, r2, lsl #0x2]
    mov r10, #0x4
    ldr r3, [sp, #0x38]
    ldr r9, [sp, #0x3c]
    str r1, [sp, #0x14]
    str r0, [sp, #0x18]
    str r0, [sp, #0x20]
    str ip, [sp, #0x1c]
    str ip, [sp, #0x24]
    str r11, [sp, #0x28]
    str r1, [sp, #0x2c]
    str r11, [sp, #0x30]
    sub r2, r10, #0x1
    add r0, sp, #0x14
.L_020a6d98:
    ldr r11, [r0, r2, lsl #0x3]
    ldr r10, [r6, #0x14]
    add r1, r0, r2, lsl #0x3
    mul r10, r11, r10
    str r10, [r0, r2, lsl #0x3]
    ldr r11, [r1, #0x4]
    ldr r10, [r6, #0x18]
    mul r10, r11, r10
    str r10, [r1, #0x4]
    ldr r10, [r0, r2, lsl #0x3]
    add r10, r10, r3
    str r10, [r0, r2, lsl #0x3]
    ldr r10, [r1, #0x4]
    add r10, r10, r9
    str r10, [r1, #0x4]
    ldr r10, [r0, r2, lsl #0x3]
    mov r10, r10, asr #0xc
    str r10, [r0, r2, lsl #0x3]
    ldr r10, [r1, #0x4]
    subs r2, r2, #0x1
    mov r10, r10, asr #0xc
    str r10, [r1, #0x4]
    bpl .L_020a6d98
    mov r1, r5
    add r0, r7, #0x84
    bl VecFx32Object_Assign
    mov r0, r7
    add r1, r4, #0x1b
    bl func_0209c7e8
    add r0, sp, #0x54
    mov r4, #0x0
    add r2, r0, r8, lsl #0x3
    ldr r3, .L_020a6e94
    add r1, sp, #0x14
    mov r0, r7
    str r4, [sp, #0x0]
    bl func_0209c87c
    b .L_020a6e78
.L_020a6e30:
    add r0, sp, #0xd4
    mov r2, r4, lsl #0x1
    cmp r4, #0x1
    add r1, r0, r2, lsl #0x3
    moveq r3, #0x1d
    stmia sp, {r1, r3}
    add r0, sp, #0x54
    add r0, r0, r2, lsl #0x3
    str r0, [sp, #0x8]
    ldr r2, .L_020a6e94
    add r1, sp, #0x34
    str r2, [sp, #0xc]
    mov r4, #0x190
    mov r0, r7
    add r2, r6, #0x10
    mov r3, #0x0
    str r4, [sp, #0x10]
    bl GraphicsImmediateEffectRenderer_DrawTexturedQuad
.L_020a6e78:
    add r0, sp, #0x34
    bl VecFx32Object_Destroy
.L_020a6e80:
    add sp, sp, #0x154
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_020a6e88: .word gGamePhaseRuntime
.L_020a6e8c: .word data_020c959c
.L_020a6e90: .word 0xab8
.L_020a6e94: .word 0x7fff
.size func_020a6aa8, . - func_020a6aa8
