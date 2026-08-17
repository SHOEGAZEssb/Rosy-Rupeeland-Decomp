.text
; Matching fallback for the portable implementation in src/overlays/ov094/overlay094_recovery.c.
.extern data_020f4e18
.extern data_ov094_02219e80
.extern AnimationResourceState_InitEmbedded
.extern func_02071ee0
.extern GraphicsSpriteState_SetAnimationIndex
.extern PresentationScalar_SetImmediate
.extern PresentationScalar_TransitionTo
.extern Presentation_SetPosition
.extern SpritePresentation_InitVariant
.extern genrand_int32

.global func_ov094_02217ec8
func_ov094_02217ec8:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4
    mov r6, r0
    mov r5, r2
    mov r4, r3
    bl SpritePresentation_InitVariant
    ldr r1, .L_02218000
    add r0, r6, #0xb0
    str r1, [r6, #0x0]
    mov r1, #0x0
    str r1, [r6, #0xac]
    bl AnimationResourceState_InitEmbedded
    ldr r0, [sp, #0x20]
    str r0, [r6, #0xa0]
    bl genrand_int32
    ldr r3, .L_02218004
    str r0, [r6, #0xac]
    ldr r1, .L_02218008
    str r3, [sp, #0x0]
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    add r0, r6, #0xb0
    sub r3, r3, #0x1
    bl func_02071ee0
    ldr r0, [sp, #0x1c]
    mov r1, #0x1
    str r0, [r6, #0xbc]
    str r5, [r6, #0xc0]
    ldr r0, [r6, #0x9c]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, [r6, #0xc0]
    mov r1, #0x1
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r2, [sp, #0x18]
    mov r1, r4
    mov r0, r6
    mov r3, #0x0
    bl Presentation_SetPosition
    add r0, r6, #0x6c
    mov r1, #0x10
    bl PresentationScalar_SetImmediate
    add r0, r6, #0x6c
    mov r1, #0x1
    mov r2, #0x100
    bl PresentationScalar_TransitionTo
    ldr r0, [r6, #0xa0]
    cmp r0, #0x2
    mov r0, #0x80000
    streq r0, [r6, #0xa4]
    subeq r0, r0, #0x120000
    strne r0, [r6, #0xa4]
    subne r0, r0, #0x100000
    str r0, [r6, #0xa8]
    ldr r0, [r6, #0xbc]
    ldr r2, [r6, #0xa4]
    ldr r1, [r0, #0x0]
    add r0, r6, #0xc
    add r2, r2, r1
    mov r1, #0x2
    bl PresentationScalar_TransitionTo
    ldr r0, [r6, #0xbc]
    ldr r2, [r6, #0xa8]
    ldr r1, [r0, #0x4]
    add r0, r6, #0x1c
    add r2, r2, r1
    mov r1, #0x2
    bl PresentationScalar_TransitionTo
    mov r0, #0x3c
    str r0, [r6, #0x7c]
    mov r0, #0x0
    str r0, [r6, #0x80]
    str r0, [r6, #0xc4]
    str r0, [r6, #0xc8]
    mov r1, #0x1
    mov r0, r6
    str r1, [r6, #0x88]
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_02218000: .word data_ov094_02219e80
.L_02218004: .word 0x2238
.L_02218008: .word data_020f4e18
.size func_ov094_02217ec8, . - func_ov094_02217ec8
