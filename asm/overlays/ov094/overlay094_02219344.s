.text
; Matching fallback for the portable implementation in src/overlays/ov094/overlay094_recovery.c.
.extern gGamePhaseRuntime
.extern data_ov094_02219e9c
.extern PresentationScalar_TransitionTo
.extern Presentation_SetPosition
.extern SpritePresentation_InitVariant

.global func_ov094_02219344
func_ov094_02219344:
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r0
    mov r6, r2
    mov r5, r3
    bl SpritePresentation_InitVariant
    ldr r0, .L_02219428
    mov r3, #0x0
    str r0, [r4, #0x0]
    str r3, [r4, #0xa0]
    mov r0, r4
    mov r1, r5
    sub r2, r3, #0x110000
    str r6, [r4, #0xa4]
    bl Presentation_SetPosition
    ldr r2, [sp, #0x10]
    add r0, r4, #0x1c
    mov r1, #0x1
    bl PresentationScalar_TransitionTo
    ldr r0, .L_0221942c
    ldr r3, [sp, #0x10]
    ldr r1, [r0, #0x0]
    mov r0, r3, asr #0xb
    add r1, r1, #0x3000
    ldr r2, [r1, #0xbc]
    ldr r1, .L_02219430
    add r0, r3, r0, lsr #0x14
    sub r0, r1, r0, asr #0xc
    ldr r2, [r2, #0x0]
    mov r0, r0, lsl #0x10
    cmp r2, #0xa7
    mov r2, r0, lsr #0x10
    ldr r0, [r4, #0x9c]
    bne .L_022193e8
    mov r2, #0x0
    strb r2, [r0, #0x3a]
    add r1, r1, #0x8000
    strh r1, [r0, #0x28]
    ldr r0, [r4, #0xa4]
    strb r2, [r0, #0x3a]
    strh r1, [r0, #0x28]
    b .L_02219400
.L_022193e8:
    mov r1, #0x1
    strb r1, [r0, #0x3a]
    strh r2, [r0, #0x28]
    ldr r0, [r4, #0xa4]
    strb r1, [r0, #0x3a]
    strh r2, [r0, #0x28]
.L_02219400:
    ldr r0, [sp, #0x14]
    mov r1, #0x0
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0x10
    str r0, [r4, #0x7c]
    str r1, [r4, #0x80]
    mov r1, #0x1
    mov r0, r4
    str r1, [r4, #0x88]
    ldmia sp!, {r4, r5, r6, pc}
.L_02219428: .word data_ov094_02219e9c
.L_0221942c: .word gGamePhaseRuntime
.L_02219430: .word 0x7fff
.size func_ov094_02219344, . - func_ov094_02219344
