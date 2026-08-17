.text
; Matching fallback for the portable implementation in src/overlays/ov094/overlay094_recovery.c.
.extern data_020f4e18
.extern data_ov094_02219ef0
.extern AnimationResourceState_InitEmbedded
.extern func_02071ee0
.extern GraphicsSpriteState_SetAnimationIndex
.extern PresentationScalar_SetImmediate
.extern PresentationScalar_TransitionTo
.extern Presentation_SetPosition
.extern SpritePresentation_InitVariant
.extern genrand_int32

.global func_ov094_02218a2c
func_ov094_02218a2c:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4
    mov r4, r0
    mov r6, r2
    mov r5, r3
    bl SpritePresentation_InitVariant
    ldr r1, .L_02218b08
    add r0, r4, #0xa4
    str r1, [r4, #0x0]
    mov r1, #0x0
    str r1, [r4, #0xa0]
    bl AnimationResourceState_InitEmbedded
    bl genrand_int32
    ldr r3, .L_02218b0c
    str r0, [r4, #0xa0]
    ldr r1, .L_02218b10
    str r3, [sp, #0x0]
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    add r0, r4, #0xa4
    sub r3, r3, #0x1
    bl func_02071ee0
    str r5, [r4, #0xb0]
    str r6, [r4, #0xb4]
    ldr r0, [r4, #0x9c]
    mov r1, #0x1
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, [r4, #0xb4]
    mov r1, #0x1
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r2, [r4, #0xb0]
    mov r0, r4
    ldmia r2, {r1, r2}
    add r1, r1, #0x80000
    sub r2, r2, #0xa0000
    mov r3, #0x0
    bl Presentation_SetPosition
    add r0, r4, #0x6c
    mov r1, #0x10
    bl PresentationScalar_SetImmediate
    add r0, r4, #0x6c
    mov r1, #0x1
    mov r2, #0x100
    bl PresentationScalar_TransitionTo
    mov r0, #0x3c
    str r0, [r4, #0x7c]
    mov r0, #0x0
    str r0, [r4, #0x80]
    str r0, [r4, #0xb8]
    str r0, [r4, #0xbc]
    mov r0, #0x1
    str r0, [r4, #0x88]
    mov r0, r4
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_02218b08: .word data_ov094_02219ef0
.L_02218b0c: .word 0x2238
.L_02218b10: .word data_020f4e18
.size func_ov094_02218a2c, . - func_ov094_02218a2c
