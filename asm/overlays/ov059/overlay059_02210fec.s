.text
; Matching fallback for the portable implementation in src/overlays/ov059/overlay059_recovery.c.
.extern Heap_Alloc
.extern SceneManager_SetUpdateEnabled
.extern Scene_GetEmbedded10
.extern Scene_Init
.extern TouchRegionManager_NotifyAll
.extern TouchRegionManager_SetEnabled
.extern TouchRegionManager_Tick
.extern data_ov059_02211b7c
.extern data_ov059_02211ba8
.extern data_ov059_02211bb0
.extern DebugSpriteText_Init
.extern SplineMover_Init
.extern GamePhaseCurrencyHud_SetVisible
.extern GamePhaseVariantMetadata_GetForPhase
.extern func_ov059_022106fc
.extern func_ov059_022109bc
.extern func_ov059_022109f0
.extern gHeapContext
.extern gLupyContext
.extern gSceneManager

.global func_ov059_02210fec
func_ov059_02210fec:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    mov r5, r1
    bl Scene_Init
    ldr r0, .L_0221111c
    mov r1, #0x0
    str r0, [r4, #0x0]
    str r1, [r4, #0x24]
    str r1, [r4, #0x28]
    str r1, [r4, #0x2c]
    str r1, [r4, #0x34]
    add r0, r4, #0x40
    str r1, [r4, #0x38]
    bl DebugSpriteText_Init
    mov r1, #0x0
    str r1, [r4, #0x48]
    sub r0, r1, #0x1
    str r0, [r4, #0x4c]
    add r0, r4, #0x54
    str r1, [r4, #0x50]
    bl SplineMover_Init
    mov r0, r5
    bl GamePhaseVariantMetadata_GetForPhase
    str r0, [r4, #0x30]
    ldr r1, [r5, #0x0]
    bl func_ov059_022109bc
    str r0, [r4, #0x28]
    mov r0, r0, lsl #0x7
    str r0, [r4, #0x50]
    ldr r1, [r4, #0x30]
    mov r0, #0x14
    ldrsh r3, [r1, #0x0]
    ldr r1, .L_02211120
    mov r2, #0x4
    str r3, [r4, #0x2c]
    ldr r3, .L_02211124
    ldr r5, [r4, #0x30]
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_02211094
    mov r1, r5
    bl func_ov059_022109f0
.L_02211094:
    ldr r1, .L_02211128
    str r0, [r4, #0x3c]
    ldr r3, .L_02211124
    mov r0, #0x1c
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_022110c4
    mov r1, r4
    mov r2, #0xe4
    mov r3, #0x60
    bl func_ov059_022106fc
.L_022110c4:
    str r0, [r4, #0x48]
    mov r0, r4
    bl Scene_GetEmbedded10
    mov r1, #0x0
    bl TouchRegionManager_SetEnabled
    mov r0, r4
    bl Scene_GetEmbedded10
    mov r1, #0x0
    bl TouchRegionManager_NotifyAll
    mov r0, r4
    bl Scene_GetEmbedded10
    bl TouchRegionManager_Tick
    ldr r0, .L_0221112c
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    bl GamePhaseCurrencyHud_SetVisible
    ldr r0, .L_02211130
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl SceneManager_SetUpdateEnabled
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
.L_0221111c: .word data_ov059_02211b7c
.L_02211120: .word data_ov059_02211bb0
.L_02211124: .word gHeapContext
.L_02211128: .word data_ov059_02211ba8
.L_0221112c: .word gLupyContext
.L_02211130: .word gSceneManager
.size func_ov059_02210fec, . - func_ov059_02210fec
