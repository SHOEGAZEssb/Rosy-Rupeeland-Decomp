.text
; Matching fallback for the portable implementation in src/overlays/ov074/overlay074_recovery.c.
.extern GameWork_SetFlag
.extern Scene_Init
.extern Scene_SetFlags03
.extern data_020f4e14
.extern data_021052fc
.extern data_02105300
.extern data_ov074_02211d8c
.extern func_02004fe0
.extern SplineMover_Init
.extern GamePhaseTouchPrompt_SetEnabled
.extern func_0201df64
.extern func_0201e0ec
.extern func_02028388
.extern ActorDerivedType1_ResetToBaseState
.extern ActorDerivedType1_GetSingletonObject
.extern GridEffectActorRegistry_BroadcastStateValue0
.extern func_02059880
.extern GraphicsSpriteRenderer_ClearTextBuffer
.extern func_020a2324
.extern func_020a2348
.extern func_ov074_0220fd20
.extern func_ov074_0220fd44
.extern func_ov074_0220fd68
.extern func_ov074_02210008
.extern func_ov074_02210b90
.extern func_ov074_0221167c
.extern func_ov088_0221ad9c
.extern gGameWork
.extern gSoundContext

.global func_ov074_0220fda8
func_ov074_0220fda8:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x18
    mov r4, r0
    mov r5, r1
    bl Scene_Init
    ldr r1, .L_0220ffec
    add r0, r4, #0x28
    str r1, [r4, #0x0]
    str r5, [r4, #0x24]
    bl func_02004fe0
    add r0, r4, #0x38
    bl func_ov074_0221167c
    add r0, r4, #0x8c
    bl SplineMover_Init
    add r0, r4, #0xc8
    bl SplineMover_Init
    add r0, r4, #0x104
    bl func_02004fe0
    add r0, r4, #0x114
    bl func_02004fe0
    mov r0, #0x0
    str r0, [r4, #0x124]
    str r0, [r4, #0x128]
    add r0, r4, #0x12c
    bl func_02004fe0
    mov r0, #0x0
    str r0, [r4, #0x140]
    add r0, r4, #0x144
    bl func_ov074_0220fd20
    add r0, r4, #0x15c
    bl func_ov074_0220fd44
    mov r0, #0x3
    str r0, [r4, #0x4]
    ldr r1, .L_0220fff0
    mov r0, r4
    ldr r1, [r1, #0x0]
    add r1, r1, #0x3000
    ldrb r2, [r1, #0xcc]
    orr r2, r2, #0x4
    strb r2, [r1, #0xcc]
    bl func_ov074_02210b90
    ldr r0, .L_0220fff0
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl func_0201e0ec
    mov r5, r0
    bl func_020a2324
    mov r0, r5
    mov r1, #0x1
    mov r2, #0x0
    bl func_020a2348
    ldr r0, .L_0220fff0
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl func_0201df64
    ldr r0, .L_0220fff4
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl func_02059880
    mov r2, #0x4000000
    ldr r1, [r2, #0x0]
    ldr r0, [r2, #0x0]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    bic r0, r3, #0x1
    orr r0, r1, r0, lsl #0x8
    str r0, [r2, #0x0]
    mov r1, #0x0
    str r1, [r2, #0x10]
    ldr r0, .L_0220fff8
    ldr r0, [r0, #0x0]
    ldr r0, [r0, #0x8]
    bl GamePhaseTouchPrompt_SetEnabled
    bl ActorDerivedType1_GetSingletonObject
    cmp r0, #0x0
    beq .L_0220ff10
    bl ActorDerivedType1_GetSingletonObject
    add r0, r0, #0x200
    ldrsh r0, [r0, #0x30]
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_0220ff10
    bl ActorDerivedType1_GetSingletonObject
    mov r1, #0x0
    bl func_ov088_0221ad9c
.L_0220ff10:
    bl GridEffectActorRegistry_BroadcastStateValue0
    ldr r0, .L_0220fffc
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    ldr r0, .L_0220fff0
    ldr r1, [r4, #0x24]
    ldr r0, [r0, #0x0]
    add r0, r0, #0x3000
    ldr r0, [r0, #0xbc]
    add r0, r0, r1, lsl #0x1
    ldrsh r0, [r0, #0x14]
    bl func_02028388
    ldr r1, .L_0220fff0
    ldrsb r2, [r0, #0x4c]
    ldr r0, [r1, #0x0]
    add r0, r0, #0x3000
    ldr r0, [r0, #0xbc]
    ldrsb r0, [r0, #0x4c]
    cmp r0, r2
    beq .L_0220ffc4
    mov r0, #0x1
    str r0, [r4, #0x124]
    ldr r0, [r1, #0x0]
    ldr r1, .L_0220fff0
    add r0, r0, #0x3000
    ldr r0, [r0, #0xbc]
    ldr r0, [r0, #0x40]
    mov r0, r0, lsl #0x5
    movs r0, r0, asr #0x1f
    ldrne r0, [r4, #0x140]
    orrne r0, r0, #0x4
    strne r0, [r4, #0x140]
    ldr r1, [r1, #0x0]
    add r0, sp, #0x0
    add r2, r1, #0x2e00
    ldrsh r1, [r2, #0xf4]
    ldrsh r2, [r2, #0xf6]
    bl func_ov074_0220fd68
    add r1, sp, #0x0
    add r0, r4, #0x144
    bl func_ov074_02210008
    ldr r0, .L_02210000
    ldr r1, .L_02210004
    ldr r0, [r0, #0x0]
    bl GameWork_SetFlag
.L_0220ffc4:
    ldr r0, .L_0220fff0
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea4]
    bl ActorDerivedType1_ResetToBaseState
    mov r0, r4
    bl Scene_SetFlags03
    mov r0, r4
    add sp, sp, #0x18
    ldmia sp!, {r3, r4, r5, pc}
.L_0220ffec: .word data_ov074_02211d8c
.L_0220fff0: .word data_021052fc
.L_0220fff4: .word gSoundContext
.L_0220fff8: .word data_02105300
.L_0220fffc: .word data_020f4e14
.L_02210000: .word gGameWork
.L_02210004: .word 0x412
.size func_ov074_0220fda8, . - func_ov074_0220fda8
