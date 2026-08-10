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
.extern GridEffectActorRegistry_BroadcastSlot1c
.extern func_0205557c
.extern func_02058d40
.extern func_02059278
.extern gHeapContext
.extern gLupyContext
.extern gSoundContext

.global func_ov064_02211374
func_ov064_02211374:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    mov r6, r0
    bl DebugText_BeginFrame
    ldr r0, .L_02211544
    ldr r1, [r6, #0x8]
    ldr r0, [r0, #0x0]
    cmp r1, #0x0
    add r0, r0, #0x2000
    ldr r4, [r0, #0xea4]
    beq .L_022113b4
    cmp r1, #0x1
    beq .L_022113f0
    cmp r1, #0x2
    beq .L_02211514
    b .L_02211530
.L_022113b4:
    add r0, r1, #0x1
    str r0, [r6, #0x8]
    ldr r5, [r4, #0x54]
    ldr r0, .L_02211548
    ldrh r3, [r5, #0x24]
    mov r1, #0x53
    mov r2, #0x0
    orr r3, r3, #0x10
    strh r3, [r5, #0x24]
    ldr r5, [r6, #0x30]
    ldrh r3, [r5, #0x24]
    bic r3, r3, #0x4
    strh r3, [r5, #0x24]
    ldr r0, [r0, #0x0]
    bl Sound_Play
.L_022113f0:
    ldr r0, [r6, #0x30]
    ldrh r0, [r0, #0x24]
    and r0, r0, #0x1
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    beq .L_02211530
    ldr r0, [r6, #0x8]
    mov r2, #0x0
    add r0, r0, #0x1
    str r0, [r6, #0x8]
    strh r2, [r6, #0x74]
    ldr r3, [r6, #0x30]
    ldr r0, .L_0221154c
    ldrh r1, [r3, #0x24]
    orr r1, r1, #0x4
    strh r1, [r3, #0x24]
    ldr r1, [r6, #0x80]
    ldr r0, [r0, #0x0]
    rsb r1, r1, #0x0
    bl GamePhaseCurrencyHud_AddCurrency
    ldr r1, .L_02211550
    ldr r3, .L_02211554
    mov r0, #0x44
    mov r2, #0x4
    bl Heap_Alloc
    movs r5, r0
    beq .L_0221149c
    ldr r0, .L_02211544
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
.L_0221149c:
    ldr r0, .L_02211544
    mov r1, r5
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl func_0201ded4
    ldr r0, .L_02211558
    mov r1, #0x0
    bl DisplayBrightnessPair_GetScreen
    mov r1, #0x0
    sub r2, r1, #0x10
    mov r3, #0x3c
    bl DisplayBrightness_StartTransition
    ldr r0, .L_02211558
    mov r1, #0x1
    bl DisplayBrightnessPair_GetScreen
    mov r1, #0x0
    sub r2, r1, #0x10
    mov r3, #0x3c
    bl DisplayBrightness_StartTransition
    ldr r0, .L_02211548
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    bl func_02058d40
    ldr r0, .L_02211548
    mov r1, #0x27
    ldr r0, [r0, #0x0]
    mov r2, #0x7f
    bl func_02059278
    b .L_02211530
.L_02211514:
    ldrsh r0, [r6, #0x74]
    add r0, r0, #0x1
    strh r0, [r6, #0x74]
    ldrsh r0, [r6, #0x74]
    cmp r0, #0x3c
    movgt r0, #0x1
    bgt .L_0221153c
.L_02211530:
    bl GridEffectActorRegistry_BroadcastSlot1c
    bl func_0205557c
    mov r0, #0x0
.L_0221153c:
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, pc}
.L_02211544: .word data_021052fc
.L_02211548: .word gSoundContext
.L_0221154c: .word gLupyContext
.L_02211550: .word data_ov064_02211ecc
.L_02211554: .word gHeapContext
.L_02211558: .word data_020f4dc8
.size func_ov064_02211374, . - func_ov064_02211374
