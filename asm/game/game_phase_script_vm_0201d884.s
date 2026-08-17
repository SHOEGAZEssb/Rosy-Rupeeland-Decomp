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
.extern RuntimePresentationManager_Update
.extern ActorMotionAreaFollower_GetPosition
.extern GamePhaseCurrencyHud_Update
.extern gOverlay33RuntimeSceneVTable
.extern gOverlay33RuntimeSceneChildAllocationTag
.extern data_020d36e1
.extern data_021052fc
.extern gLupyContext
.extern gHeapContext
.global func_0201d884
func_0201d884: ; 0x0201d884
    stmdb sp!, {r4, lr}
    ldr r1, L_0201d9b4
    mov r4, r0
    ldr r0, [r1, #0x0]
    ldr r2, [r4, #0x28]
    add r0, r0, #0x3000
    ldr r0, [r0, #0xbc]
    ldr r0, [r0, #0x0]
    cmp r2, r0
    beq L_0201d8dc
    str r0, [r4, #0x28]
    ldr r0, [r1, #0x0]
    ldr r1, L_0201d9b8
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea4]
    str r0, [r4, #0x2c]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x74]
    blx r2
    ldr r0, L_0201d9b4
    ldr r0, [r0, #0x0]
    bl GamePhaseRuntime_UpdateDualScreenUiPresentation
L_0201d8dc:
    ldr r0, L_0201d9b4
    ldr r1, [r4, #0x4]
    ldr r0, [r0, #0x0]
    mov r2, #0x3
    bl GamePhaseRuntime_PrepareActorCollections
    ldr r0, [r4, #0x3c]
    bl func_ov014_021fd2f8 ; func_ov024_021fd2f8, func_ov033_021fd2f8
    cmp r0, #0x0
    beq L_0201d920
    cmp r4, #0x0
    beq L_0201d918
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_0201d918:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
L_0201d920:
    ldr r0, [r4, #0x3c]
    bl func_ov033_021fd37c ; func_ov038_021fd37c
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r0, L_0201d9b4
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    bl GamePhaseRuntime_SynchronizeActorPlacement
    ldr r0, L_0201d9b4
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl GamePhaseRuntime_SynchronizeActorPlacement
    ldr r0, L_0201d9b4
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl RuntimePresentationManager_Update
    ldr r0, L_0201d9b4
    ldr r1, [r4, #0x4]
    ldr r0, [r0, #0x0]
    mov r2, #0x3
    bl GamePhaseRuntime_FinalizeActorCollections
    ldr r0, L_0201d9b4
    ldr r0, [r0, #0x0]
    add r0, r0, #0x3bc
    add r0, r0, #0x2c00
    bl ActorMotionAreaFollower_GetPosition
    mov r1, r0
    ldr r0, [r4, #0x3c]
    bl func_ov033_021fd324 ; func_ov037_021fd324
    ldr r0, L_0201d9bc
    ldr r0, [r0, #0x0]
    bl GamePhaseCurrencyHud_Update
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_0201d9b4: .word data_021052fc
L_0201d9b8: .word data_020d36e1
L_0201d9bc: .word gLupyContext


.size func_0201d884, . - func_0201d884
