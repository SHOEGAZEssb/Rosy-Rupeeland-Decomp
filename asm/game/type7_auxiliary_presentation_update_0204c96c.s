; Matching retail form; see src/game/type7_auxiliary_presentation_update.c.
.extern GraphicsSpriteState_SetAnimationIndex
.extern Sound_Play
.extern data_020c9670
.extern data_020c3dfc
.extern data_020e1e60
.extern data_020e1e62
.extern data_020e1e64
.extern gSoundContext
.text
    .global Type7AuxiliaryPresentation_UpdateMotion
Type7AuxiliaryPresentation_UpdateMotion: ; 0x0204c96c
    ldrb r1, [r0, #0x10]
    tst r1, #0x1
    beq .L_0204ca2c
    ldr r1, [r0, #0x28]
    add r2, r1, #0x1e000
    str r2, [r0, #0x18]
    ldr r1, [r0, #0x14]
    cmp r1, r2
    beq .L_0204c9a4
    add r2, r1, #0x1400
    str r2, [r0, #0x14]
    ldr r1, [r0, #0x18]
    cmp r2, r1
    strgt r1, [r0, #0x14]
.L_0204c9a4:
    ldrh r1, [r0, #0x24]
    ldr r2, .L_0204ca3c
    add r1, r1, #0x2
    strh r1, [r0, #0x24]
    ldrh r1, [r0, #0x24]
    and r1, r1, #0xff
    strh r1, [r0, #0x24]
    ldrh r1, [r0, #0x26]
    add r1, r1, #0x3
    strh r1, [r0, #0x26]
    ldrh r1, [r0, #0x26]
    and r1, r1, #0xff
    strh r1, [r0, #0x26]
    ldrh r1, [r0, #0x24]
    mov r1, r1, lsl #0x8
    mov r1, r1, asr #0x4
    mov r1, r1, lsl #0x2
    ldrsh r1, [r2, r1]
    add r1, r1, r1, lsl #0x1
    add r1, r1, r1, lsr #0x1f
    mov r1, r1, asr #0x1
    str r1, [r0, #0x1c]
    ldrh r1, [r0, #0x26]
    mov r1, r1, lsl #0x8
    mov r1, r1, asr #0x4
    mov r1, r1, lsl #0x1
    add r1, r1, #0x1
    mov r1, r1, lsl #0x1
    ldrsh r1, [r2, r1]
    add r1, r1, r1, lsl #0x1
    add r1, r1, r1, lsr #0x1f
    mov r1, r1, asr #0x1
    str r1, [r0, #0x20]
    bx lr
.L_0204ca2c:
    mov r1, #0x0
    str r1, [r0, #0x18]
    str r1, [r0, #0x14]
    bx lr
.L_0204ca3c: .word data_020c9670
.size Type7AuxiliaryPresentation_UpdateMotion, . - Type7AuxiliaryPresentation_UpdateMotion

    .global Type7AuxiliaryPresentation_UpdateAnimationAndPosition
Type7AuxiliaryPresentation_UpdateAnimationAndPosition: ; 0x0204ca40
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldrb r0, [r5, #0x10]
    mov r4, r1
    bic r1, r0, #0x2
    and r0, r1, #0xff
    strb r1, [r5, #0x10]
    tst r0, #0x4
    beq .L_0204caa4
    ldr r0, [r5, #0x4]
    ldrh r0, [r0, #0x24]
    and r0, r0, #0x1
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    beq .L_0204cb80
    ldrb r0, [r5, #0x10]
    bic r1, r0, #0x4
    and r0, r1, #0xff
    orr r0, r0, #0x8
    strb r0, [r5, #0x10]
    ldr r1, [r5, #0x4]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x8
    strh r0, [r1, #0x24]
    b .L_0204cb80
.L_0204caa4:
    tst r0, #0x1
    beq .L_0204cb5c
    ldrsb r0, [r5, #0x12]
    strb r0, [r5, #0x13]
    ldr r1, [r5, #0x4]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x8
    strh r0, [r1, #0x24]
    ldrsb r1, [r5, #0x12]
    cmp r1, #0x0
    beq .L_0204cae8
    ldr r0, [r5, #0x4]
    ldrh r0, [r0, #0x24]
    and r0, r0, #0x1
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    beq .L_0204cb44
.L_0204cae8:
    cmp r1, #0x3
    ldrltsb r0, [r5, #0x12]
    add ip, sp, #0x0
    addlt r0, r0, #0x1
    strltb r0, [r5, #0x12]
    ldr r2, [r5, #0x4]
    ldr r0, .L_0204cc04
    ldrh r1, [r2, #0x24]
    bic r1, r1, #0x1
    strh r1, [r2, #0x24]
    ldrb r3, [r0, #0x0]
    ldrb r2, [r0, #0x1]
    ldrb r1, [r0, #0x2]
    ldrsb r0, [r5, #0x12]
    strb r3, [sp, #0x0]
    strb r2, [sp, #0x1]
    sub r0, r0, #0x1
    strb r1, [sp, #0x2]
    ldrb r1, [ip, r0]
    ldr r0, [r5, #0x4]
    add r1, r1, r4
    and r1, r1, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
.L_0204cb44:
    ldrsb r0, [r5, #0x12]
    cmp r0, #0x3
    ldreqb r0, [r5, #0x10]
    orreq r0, r0, #0x2
    streqb r0, [r5, #0x10]
    b .L_0204cb80
.L_0204cb5c:
    ldr r2, [r5, #0x4]
    ldrh r1, [r2, #0x24]
    and r0, r1, #0x1
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    orrne r0, r1, #0x8
    strneh r0, [r2, #0x24]
    movne r0, #0x0
    strneb r0, [r5, #0x12]
.L_0204cb80:
    ldr r1, [r5, #0x8]
    mov r0, #0x6
    ldr r2, [r1, #0x54]
    ldr r1, [r5, #0x4]
    ldrb r2, [r2, #0x3a]
    mul r0, r4, r0
    strb r2, [r1, #0x3a]
    ldr r1, [r5, #0x8]
    ldr r2, .L_0204cc08
    ldr r1, [r1, #0x54]
    ldrsh ip, [r2, r0]
    ldrsh r3, [r1, #0x2c]
    ldr r1, [r5, #0x4]
    ldr r2, .L_0204cc0c
    add r3, ip, r3
    strh r3, [r1, #0x2c]
    ldr r1, [r5, #0x8]
    ldrsh ip, [r2, r0]
    ldr r2, [r1, #0x54]
    ldr r1, [r5, #0x4]
    ldrsh r3, [r2, #0x2e]
    ldr r2, .L_0204cc10
    add r3, ip, r3
    strh r3, [r1, #0x2e]
    ldr r1, [r5, #0x8]
    ldrsh r2, [r2, r0]
    ldr r1, [r1, #0x54]
    ldr r0, [r5, #0x4]
    ldrh r1, [r1, #0x28]
    add r1, r2, r1
    strh r1, [r0, #0x28]
    strb r4, [r5, #0x11]
    ldmia sp!, {r3, r4, r5, pc}
.L_0204cc04: .word data_020c3dfc
.L_0204cc08: .word data_020e1e60
.L_0204cc0c: .word data_020e1e62
.L_0204cc10: .word data_020e1e64
.size Type7AuxiliaryPresentation_UpdateAnimationAndPosition, . - Type7AuxiliaryPresentation_UpdateAnimationAndPosition

    .global Type7AuxiliaryPresentation_Activate
Type7AuxiliaryPresentation_Activate: ; 0x0204cc14
    ldrb r1, [r0, #0x10]
    tst r1, #0x4
    orreq r1, r1, #0x1
    streqb r1, [r0, #0x10]
    moveq r1, #0x0
    streqb r1, [r0, #0x12]
    bx lr
.size Type7AuxiliaryPresentation_Activate, . - Type7AuxiliaryPresentation_Activate

    .global Type7AuxiliaryPresentation_BeginShutdown
Type7AuxiliaryPresentation_BeginShutdown: ; 0x0204cc30
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrb r1, [r4, #0x10]
    mov r0, #0x0
    bic r2, r1, #0x1
    and r1, r2, #0xff
    orr r1, r1, #0x4
    strb r1, [r4, #0x10]
    str r0, [r4, #0x18]
    str r0, [r4, #0x14]
    strb r0, [r4, #0x12]
    strb r0, [r4, #0x13]
    ldrsb r1, [r4, #0x11]
    cmp r1, #0x0
    movlt r1, r0
    add r1, r1, #0x18
    ldr r0, [r4, #0x4]
    and r1, r1, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r4, [r4, #0x4]
    ldr r0, .L_0204cca4
    ldrh r3, [r4, #0x24]
    mov r1, #0x0
    mov r2, #0x1b
    bic r3, r3, #0x9
    strh r3, [r4, #0x24]
    ldr r0, [r0, #0x0]
    bl Sound_Play
    ldmia sp!, {r4, pc}
.L_0204cca4: .word gSoundContext
.size Type7AuxiliaryPresentation_BeginShutdown, . - Type7AuxiliaryPresentation_BeginShutdown

