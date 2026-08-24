.text
; Matching fallback for the portable implementation in src/overlays/ov062/overlay062_recovery.c.
.extern Heap_Free
.extern Scene_ClearFlags03
.extern Scene_Destroy
.extern gGamePhaseRuntime
.extern data_ov062_02211c14
.extern OverlayManager_UnloadOverlay
.extern OverlayManager_GetGlobal
.extern VecFx32Object_Destroy
.extern VecFx32Object_Assign
.extern ActorDerivedType1_ResetToBaseState
.extern Type7Actor_LeaveSpecialPresentationState
.extern Sound_ReleaseGroup
.extern GraphicsSpriteState_ReleaseFromGroup
.extern func_ov062_0220fd20
.extern gSoundContext

.global func_ov062_022111e8
func_ov062_022111e8:
    stmdb sp!, {r4, lr}
    ldr r1, .L_0221137c
    mov r4, r0
    str r1, [r4, #0x0]
    bl Scene_ClearFlags03
    ldr r0, .L_02211380
    mov r1, #0x1b8
    ldr r0, [r0, #0x0]
    bl Sound_ReleaseGroup
    ldr r0, [r4, #0x64]
    bl GraphicsSpriteState_ReleaseFromGroup
    ldr r0, [r4, #0x6c]
    bl GraphicsSpriteState_ReleaseFromGroup
    ldr r0, [r4, #0x5c]
    cmp r0, #0x0
    beq .L_02211234
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_02211234:
    ldr r0, [r4, #0x60]
    cmp r0, #0x0
    beq .L_0221124c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_0221124c:
    ldr r0, [r4, #0x68]
    cmp r0, #0x0
    beq .L_02211264
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_02211264:
    ldr r2, [r4, #0x58]
    add r1, r4, #0x24
    ldr r0, [r2, #0x14]
    bic r0, r0, #0x2
    str r0, [r2, #0x14]
    ldr r0, [r4, #0x58]
    add r0, r0, #0x18
    bl VecFx32Object_Assign
    ldr r0, [r4, #0x58]
    add r1, r4, #0x24
    add r0, r0, #0x28
    bl VecFx32Object_Assign
    ldr r2, [r4, #0x58]
    mov r1, #0x1
    ldr r0, [r2, #0x230]
    orr r0, r0, #0x4
    str r0, [r2, #0x230]
    ldr r0, [r4, #0x58]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x54]
    blx r2
    ldr r1, [r4, #0x58]
    ldr r0, [r1, #0x230]
    bic r0, r0, #0x100
    str r0, [r1, #0x230]
    ldr r0, [r4, #0x58]
    bl ActorDerivedType1_ResetToBaseState
    ldr r0, [r4, #0x58]
    mov r1, #0x0
    add r0, r0, #0x38
    mov r2, r1
    mov r3, r1
    bl func_ov062_0220fd20
    ldr r0, [r4, #0x58]
    mov r1, #0x0
    add r0, r0, #0x88
    mov r2, r1
    mov r3, r1
    bl func_ov062_0220fd20
    ldr r0, [r4, #0x58]
    mov r1, #0x0
    add r0, r0, #0x98
    mov r2, r1
    mov r3, r1
    bl func_ov062_0220fd20
    ldr r0, .L_02211384
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea8]
    cmp r0, #0x0
    beq .L_02211334
    bl Type7Actor_LeaveSpecialPresentationState
.L_02211334:
    ldr r0, [r4, #0x78]
    cmp r0, #0x0
    beq .L_0221134c
    bl OverlayManager_GetGlobal
    mov r1, #0x2
    bl OverlayManager_UnloadOverlay
.L_0221134c:
    add r0, r4, #0x44
    bl VecFx32Object_Destroy
    add r0, r4, #0x34
    bl VecFx32Object_Destroy
    add r0, r4, #0x24
    bl VecFx32Object_Destroy
    mov r0, r4
    bl Scene_Destroy
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0221137c: .word data_ov062_02211c14
.L_02211380: .word gSoundContext
.L_02211384: .word gGamePhaseRuntime
.size func_ov062_022111e8, . - func_ov062_022111e8
