; Matching retail form; see src/game/overlay33_runtime_scene.c.
.text
.extern Scene_Init
.extern Scene_SetFlags03
.extern Scene_Destroy
.extern Heap_Alloc
.extern Heap_Free
.extern OverlaySlot_Init
.extern OverlaySlot_Destroy
.extern OverlaySlot_LoadOverlay
.extern OverlaySlot_UnloadOverlay
.extern func_ov033_021fd070
.extern func_ov030_021fd260
.extern func_ov014_021fd2f8
.extern func_ov033_021fd37c
.extern func_ov033_021fd324
.extern GamePhaseRuntime_UpdateDualScreenUiPresentation
.extern GamePhaseRuntime_PrepareActorCollections
.extern GamePhaseRuntime_FinalizeActorCollections
.extern GamePhaseRuntime_SynchronizeActorPlacement
.extern RuntimePresentationManager_UpdatePresentations
.extern ActorMotionAreaFollower_GetPosition
.extern GamePhaseCurrencyHud_Update
.extern gOverlay33RuntimeSceneVTable
.extern gOverlay33RuntimeSceneChildAllocationTag
.extern data_020d36e1
.extern data_021052fc
.extern gGamePhaseCurrencyHud
.extern gHeapContext
.global func_0201d754
func_0201d754: ; 0x0201d754
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, L_0201d7e4
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r2, [r4, #0x2c]
    mov r1, #0x0
    ldr r0, [r2, #0x14]
    bic r0, r0, #0x40
    str r0, [r2, #0x14]
    ldr r0, [r4, #0x2c]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x74]
    blx r2
    ldr r1, [r4, #0x2c]
    ldr r0, [r1, #0x10]
    bic r0, r0, #0x8
    str r0, [r1, #0x10]
    ldr r1, [r4, #0x2c]
    ldr r0, [r1, #0x10]
    bic r0, r0, #0x1000000
    str r0, [r1, #0x10]
    ldr r5, [r4, #0x3c]
    cmp r5, #0x0
    beq L_0201d7c4
    mov r0, r5
    bl func_ov030_021fd260 ; func_ov033_021fd260
    mov r0, r5
    bl Heap_Free
L_0201d7c4:
    add r0, r4, #0x30
    bl OverlaySlot_UnloadOverlay
    add r0, r4, #0x30
    bl OverlaySlot_Destroy
    mov r0, r4
    bl Scene_Destroy
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
L_0201d7e4: .word gOverlay33RuntimeSceneVTable


.size func_0201d754, . - func_0201d754
