.text
; Matching fallback for the portable implementation in src/overlays/ov074/overlay074_recovery.c.
.extern GameWork_ClearFlag
.extern Scene_Destroy
.extern data_02105300
.extern data_ov074_02211d8c
.extern OverlayManager_UnloadOverlay
.extern OverlayManager_GetGlobal
.extern func_02005058
.extern SplineMover_Destroy
.extern func_02010520
.extern ActorDerivedType1_GetSingletonObject
.extern func_ov088_0221ad9c
.extern gGameWork

.global func_ov074_02210024
func_ov074_02210024:
    stmdb sp!, {r4, lr}
    ldr r1, .L_022100ec
    mov r4, r0
    ldr r0, .L_022100f0
    str r1, [r4, #0x0]
    ldr r0, [r0, #0x0]
    mov r1, #0x1
    ldr r0, [r0, #0x8]
    bl func_02010520
    bl ActorDerivedType1_GetSingletonObject
    cmp r0, #0x0
    beq .L_02210080
    bl ActorDerivedType1_GetSingletonObject
    add r0, r0, #0x200
    ldrsh r0, [r0, #0x30]
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_02210080
    bl ActorDerivedType1_GetSingletonObject
    mov r1, #0x1
    bl func_ov088_0221ad9c
.L_02210080:
    bl OverlayManager_GetGlobal
    mov r1, #0x2
    bl OverlayManager_UnloadOverlay
    ldr r0, .L_022100f4
    ldr r1, .L_022100f8
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    add r0, r4, #0x12c
    bl func_02005058
    add r0, r4, #0x114
    bl func_02005058
    add r0, r4, #0x104
    bl func_02005058
    add r0, r4, #0xc8
    bl SplineMover_Destroy
    add r0, r4, #0x8c
    bl SplineMover_Destroy
    add r0, r4, #0x50
    bl SplineMover_Destroy
    add r0, r4, #0x40
    bl func_02005058
    add r0, r4, #0x28
    bl func_02005058
    mov r0, r4
    bl Scene_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_022100ec: .word data_ov074_02211d8c
.L_022100f0: .word data_02105300
.L_022100f4: .word gGameWork
.L_022100f8: .word 0x412
.size func_ov074_02210024, . - func_ov074_02210024
