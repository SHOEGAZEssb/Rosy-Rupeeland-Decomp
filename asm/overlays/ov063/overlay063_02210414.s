.text
; Matching fallback for the portable implementation in src/overlays/ov063/overlay063_recovery.c.
.extern GX_HBlankIntr
.extern GX_VBlankIntr
.extern Scene_ClearFlags03
.extern data_021052fc
.extern GamePhaseRuntime_GetActorCollection
.extern GamePhaseRuntime_StageAreaRequest
.extern ActorCollection_UnregisterAndDestroyActor
.extern func_02058d28
.extern func_02058d40
.extern gGameWork
.extern gSoundContext

.global func_ov063_02210414
func_ov063_02210414:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x8
    mov r6, r0
    mov r0, #0x0
    mov r7, r1
    bl GX_VBlankIntr
    mov r0, #0x0
    bl GX_HBlankIntr
    mov r0, r6
    bl Scene_ClearFlags03
    ldr r0, [r6, #0x4c]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xe4]
    blx r1
    mov r5, r0
    ldr r0, [r6, #0x4c]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xe8]
    blx r1
    mov r4, r0
    ldr r0, [r6, #0x4c]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xec]
    blx r1
    mov r3, r0
    cmp r7, #0x3
    bne .L_022104b8
    mov r1, #0x0
    str r1, [sp, #0x0]
    ldr r0, .L_0221055c
    str r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r1, r5
    mov r2, r4
    bl GamePhaseRuntime_StageAreaRequest
    ldr r0, .L_02210560
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    add r0, r0, #0x100
    strh r1, [r0, #0xe4]
    b .L_02210518
.L_022104b8:
    cmp r7, #0x1
    bne .L_022104f8
    mov r1, #0x0
    str r1, [sp, #0x0]
    ldr r0, .L_0221055c
    str r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r1, r5
    mov r2, r4
    bl GamePhaseRuntime_StageAreaRequest
    ldr r0, .L_02210560
    mvn r1, #0x0
    ldr r0, [r0, #0x0]
    add r0, r0, #0x100
    strh r1, [r0, #0xe4]
    b .L_02210518
.L_022104f8:
    cmp r7, #0x5
    beq .L_02210518
    ldr r0, .L_0221055c
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl GamePhaseRuntime_GetActorCollection
    ldr r1, [r6, #0x4c]
    bl ActorCollection_UnregisterAndDestroyActor
.L_02210518:
    mov r0, #0x1
    bl GX_VBlankIntr
    mov r0, #0x1
    bl GX_HBlankIntr
    ldr r0, [r6, #0x50]
    mov r0, r0, lsl #0x10
    movs r0, r0, asr #0x1f
    beq .L_02210554
    ldr r0, .L_02210564
    ldr r0, [r0, #0x0]
    bl func_02058d28
    ldr r0, .L_02210564
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    bl func_02058d40
.L_02210554:
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0221055c: .word data_021052fc
.L_02210560: .word gGameWork
.L_02210564: .word gSoundContext
.size func_ov063_02210414, . - func_ov063_02210414
