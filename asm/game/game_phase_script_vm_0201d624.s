; Matching retail form; see src/game/overlay_transition_scene.c.
.text
.extern Scene_Init
.extern Scene_SetFlags03
.extern Scene_Destroy
.extern Heap_Free
.extern OverlaySlot_Init
.extern OverlaySlot_Destroy
.extern OverlaySlot_LoadOverlay
.extern OverlaySlot_UnloadOverlay
.extern func_02092c8c
.extern DisplayBrightness_IsSubTransitionComplete
.extern func_020122a0
.extern GamePhaseCurrencyHud_SetVisible
.extern GamePhaseRuntime_SetPlacementMode
.extern func_02008570
.extern func_020755bc
.extern GamePhaseRuntime_UpdateActorPresentationState
.extern func_02091fb0
.extern Heap_Alloc
.extern func_ov029_021fd95c
.extern func_ov046_0220c7d8
.extern data_020d5d58
.extern data_020d5d8c
.extern data_020d5d94
.extern data_021052fc
.extern gLupyContext
.extern gDebugFont
.extern gHeapContext
.global func_0201d624
func_0201d624: ; 0x0201d624
    stmdb sp!, {r4, lr}
    ldr r1, L_0201d660
    mov r4, r0
    ldr r0, [r1, #0x0]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    ldr r0, [r4, #0x24]
    cmp r0, #0x0
    beq L_0201d658
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
L_0201d658:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_0201d660: .word data_021052fc


.size func_0201d624, . - func_0201d624
