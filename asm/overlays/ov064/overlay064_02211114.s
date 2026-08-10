.text
; Matching fallback for the portable implementation in src/overlays/ov064/overlay064_recovery.c.
.extern DebugText_BeginFrame
.extern Heap_Alloc
.extern Sound_Play
.extern data_020f4dc8
.extern data_021052fc
.extern data_ov064_02211ecc
.extern DisplayBrightness_StartTransition
.extern DisplayBrightnessPair_GetScreen
.extern ActorMotionAreaFollower_GetPosition
.extern GamePhaseCurrencyHud_AddCurrency
.extern func_0201ded4
.extern func_02022cb0
.extern ActorDerivedType1_ApplyResourceIndex
.extern Actor_ReplaceAttachmentSlotResource
.extern GridEffectActorRegistry_BroadcastSlot1c
.extern func_0205557c
.extern func_02058d40
.extern func_02059278
.extern GraphicsSpriteState_SetAnimationIndex
.extern gHeapContext
.extern gLupyContext
.extern gSoundContext

.global func_ov064_02211114
func_ov064_02211114:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    mov r6, r0
    bl DebugText_BeginFrame
    ldr r0, .L_02211358
    ldr r1, [r6, #0x8]
    ldr r0, [r0, #0x0]
    cmp r1, #0x3
    add r0, r0, #0x2000
    ldr r4, [r0, #0xea4]
    addls pc, pc, r1, lsl #0x2
    b .L_02211344
.L_02211144:
    b .L_02211154
    b .L_022111a4
    b .L_022112b0
    b .L_02211328
.L_02211154:
    ldr r5, .L_0221135c
    add r0, r1, #0x1
    str r0, [r6, #0x8]
    mov r0, r4
    sub r2, r5, #0x1
    sub r3, r5, #0x3
    mov r1, #0x0
    str r5, [sp, #0x0]
    bl Actor_ReplaceAttachmentSlotResource
    mov r0, r4
    mov r1, #0x0
    bl ActorDerivedType1_ApplyResourceIndex
    ldr r0, [r4, #0x54]
    mov r1, #0x0
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, .L_02211360
    mov r1, #0x52
    ldr r0, [r0, #0x0]
    mov r2, #0x0
    bl Sound_Play
.L_022111a4:
    ldr r0, [r6, #0x30]
    ldrh r0, [r0, #0x24]
    and r0, r0, #0x1
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    beq .L_02211344
    ldr r1, [r6, #0x8]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r6, #0x8]
    strh r0, [r6, #0x74]
    ldr r2, [r4, #0x54]
    mov r1, #0x11
    ldrh r0, [r2, #0x24]
    orr r0, r0, #0x4
    strh r0, [r2, #0x24]
    ldr r0, [r6, #0x30]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r3, [r6, #0x30]
    ldr r0, .L_02211364
    ldrh r1, [r3, #0x24]
    mov r2, #0x0
    bic r1, r1, #0x1
    strh r1, [r3, #0x24]
    ldr r1, [r6, #0x80]
    ldr r0, [r0, #0x0]
    rsb r1, r1, #0x0
    bl GamePhaseCurrencyHud_AddCurrency
    ldr r1, .L_02211368
    ldr r3, .L_0221136c
    mov r0, #0x44
    mov r2, #0x4
    bl Heap_Alloc
    movs r5, r0
    beq .L_02211270
    ldr r0, .L_02211358
    ldr r0, [r0, #0x0]
    add r0, r0, #0x3bc
    add r0, r0, #0x2c00
    bl ActorMotionAreaFollower_GetPosition
    mov r1, #0x2000
    str r1, [sp, #0x0]
    sub r1, r1, #0x20c0
    str r1, [sp, #0x4]
    ldr r3, [r6, #0x80]
    mov r1, r0
    mov r0, r5
    mov r2, r4
    rsb r3, r3, #0x0
    bl func_02022cb0
    mov r5, r0
.L_02211270:
    ldr r0, .L_02211358
    mov r1, r5
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl func_0201ded4
    ldr r0, .L_02211360
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    bl func_02058d40
    ldr r0, .L_02211360
    mov r1, #0x27
    ldr r0, [r0, #0x0]
    mov r2, #0x7f
    bl func_02059278
    b .L_02211344
.L_022112b0:
    ldrsh r0, [r6, #0x74]
    add r0, r0, #0x1
    strh r0, [r6, #0x74]
    ldrsh r0, [r6, #0x74]
    cmp r0, #0x3c
    ble .L_02211344
    ldr r0, .L_02211370
    mov r1, #0x0
    bl DisplayBrightnessPair_GetScreen
    mov r1, #0x0
    sub r2, r1, #0x10
    mov r3, #0x3c
    bl DisplayBrightness_StartTransition
    ldr r0, .L_02211370
    mov r1, #0x1
    bl DisplayBrightnessPair_GetScreen
    mov r1, #0x0
    sub r2, r1, #0x10
    mov r3, #0x3c
    bl DisplayBrightness_StartTransition
    mov r1, #0x0
    strh r1, [r6, #0x74]
    ldr r2, [r6, #0x8]
    ldr r0, .L_02211360
    add r2, r2, #0x1
    str r2, [r6, #0x8]
    ldr r0, [r0, #0x0]
    mov r2, #0x44
    bl Sound_Play
    b .L_02211344
.L_02211328:
    ldrsh r0, [r6, #0x74]
    add r0, r0, #0x1
    strh r0, [r6, #0x74]
    ldrsh r0, [r6, #0x74]
    cmp r0, #0x3c
    movgt r0, #0x1
    bgt .L_02211350
.L_02211344:
    bl GridEffectActorRegistry_BroadcastSlot1c
    bl func_0205557c
    mov r0, #0x0
.L_02211350:
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, pc}
.L_02211358: .word data_021052fc
.L_0221135c: .word 0x1004
.L_02211360: .word gSoundContext
.L_02211364: .word gLupyContext
.L_02211368: .word data_ov064_02211ecc
.L_0221136c: .word gHeapContext
.L_02211370: .word data_020f4dc8
.size func_ov064_02211114, . - func_ov064_02211114
