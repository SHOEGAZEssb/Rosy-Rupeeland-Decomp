.text
; Matching fallback for the portable implementation in src/overlays/ov094/overlay094_recovery.c.
.extern gFx32CosSinTable
.extern data_ov094_02219eb8
.extern GraphicsSpriteState_GetSequenceDuration
.extern PresentationScalar_SetImmediate
.extern PresentationScalar_TransitionTo
.extern Presentation_SetPosition
.extern SpritePresentation_InitVariant
.extern func_020befec

.global func_ov094_022177e0
func_ov094_022177e0:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r8, r0
    mov r7, r2
    mov r5, r3
    ldr r6, [sp, #0x18]
    bl SpritePresentation_InitVariant
    ldr r0, [sp, #0x1c]
    ldr r1, .L_022179a4
    mov r0, r0, asr #0x4
    mov r0, r0, lsl #0x1
    mov r2, r0, lsl #0x1
    add r0, r0, #0x1
    mov r0, r0, lsl #0x1
    ldrsh r3, [r1, r0]
    ldrsh r4, [r1, r2]
    mov r0, #0x30
    smulbb r1, r3, r0
    smulbb r0, r4, r0
    mul r2, r6, r0
    mov r0, r3, lsl #0x4
    ldr ip, .L_022179a8
    mul r1, r6, r1
    mul r3, r6, r0
    mov r0, r1, asr #0x7
    add r0, r1, r0, lsr #0x18
    mov r1, r2, asr #0x7
    add r1, r2, r1, lsr #0x18
    mov r2, r3, asr #0x7
    add r2, r3, r2, lsr #0x18
    str ip, [r8, #0x0]
    str r5, [r8, #0xb4]
    mov r5, r0, asr #0x8
    mov r1, r1, asr #0x8
    mov r2, r2, asr #0x8
    mov r0, r8
    add r1, r1, #0x80000
    sub r2, r2, #0x40000
    mov r3, #0x0
    str r7, [r8, #0xa0]
    add r5, r5, #0x150000
    bl Presentation_SetPosition
    mov r0, r4, lsl #0x7
    mul r1, r6, r0
    mov r0, r1, asr #0x7
    add r0, r1, r0, lsr #0x18
    mov r1, r0, asr #0x8
    add r2, r1, #0x80000
    add r0, r8, #0xc
    mov r1, #0x1
    bl PresentationScalar_TransitionTo
    add r0, r8, #0x1c
    mov r1, #0x1
    mov r2, r5
    bl PresentationScalar_TransitionTo
    ldr r0, [sp, #0x20]
    mov r2, #0x0
    mov r1, r0, lsl #0x10
    mov r1, r1, asr #0x10
    str r1, [r8, #0x7c]
    str r2, [r8, #0x80]
    str r2, [r8, #0xa4]
    str r2, [r8, #0xa8]
    str r2, [r8, #0xac]
    mov r1, #0xa
    bl func_020befec
    str r0, [r8, #0xb0]
    add r0, r8, #0x3c
    mov r1, #0x0
    bl PresentationScalar_SetImmediate
    add r0, r8, #0x4c
    mov r1, #0x0
    bl PresentationScalar_SetImmediate
    ldr r0, [sp, #0x20]
    ands r0, r0, #0x1
    str r0, [r8, #0xb8]
    beq .L_02217930
    ldr r1, [r8, #0x9c]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x40
    strh r0, [r1, #0x24]
    ldr r1, [r8, #0xa0]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x40
    strh r0, [r1, #0x24]
.L_02217930:
    ldr r0, [r8, #0x9c]
    bl GraphicsSpriteState_GetSequenceDuration
    ldr r1, [r8, #0xb0]
    mov r0, r0, lsl #0x8
    bl func_020befec
    mov r0, r0, lsl #0x10
    mov r1, r5, asr #0xb
    add r1, r5, r1, lsr #0x14
    mov r1, r1, asr #0xc
    ldr r2, [r8, #0x9c]
    mov r3, r0, asr #0x10
    strh r3, [r2, #0x36]
    ldr r2, [r8, #0xa0]
    ldr r0, .L_022179ac
    strh r3, [r2, #0x36]
    sub r1, r1, #0xc0
    sub r0, r0, r1
    mov r0, r0, lsl #0x10
    ldr r1, [r8, #0x9c]
    mov r2, #0x1
    strb r2, [r1, #0x3a]
    mov r3, r0, lsr #0x10
    strh r3, [r1, #0x28]
    ldr r1, [r8, #0xa0]
    mov r0, r8
    strb r2, [r1, #0x3a]
    strh r3, [r1, #0x28]
    str r2, [r8, #0x88]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_022179a4: .word gFx32CosSinTable
.L_022179a8: .word data_ov094_02219eb8
.L_022179ac: .word 0x7fff
.size func_ov094_022177e0, . - func_ov094_022177e0
