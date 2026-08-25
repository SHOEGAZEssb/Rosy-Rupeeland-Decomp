; Matching retail form; see src/game/overlay52_scene_lifecycle.c.
.text
.extern Scene_Init
.extern Scene_SetFlags03
.extern Scene_ClearFlags03
.extern Scene_Destroy
.extern Heap_Free
.extern DisplayBrightnessPair_GetScreen
.extern DisplayBrightness_StartTransition
.extern DisplayBrightness_GetCurrent
.extern OverlayManager_GetGlobal
.extern OverlayManager_LoadOverlay
.extern OverlayManager_UnloadOverlay
.extern GraphicsSpriteRenderer_ClearTextBuffer
.extern Heap_Alloc
.extern Overlay052Scene_Init
.extern Overlay052Scene_SetMessageById
.extern Overlay052Scene_UpdateMessageMenu
.extern Overlay052Scene_BeginConfirmationFade
.extern Sound_Play
.extern GamePhaseRuntime_UpdateActorPresentationState
.extern GamePhaseState_UpdateRenderHelpers
.extern gOverlay52SceneVTable
.extern gOverlay52ChildAllocationTag
.extern gDisplayBrightnessPair
.extern gDebugFont
.extern gHeapContext
.extern gSoundContext
.extern gGamePhaseRuntime
.global Overlay52Scene_Update
Overlay52Scene_Update: ; 0x0201d0f4
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x28]
    cmp r0, #0x0
    bne L_0201d1a4
    ldr r0, L_0201d208
    mov r1, #0x1
    bl DisplayBrightnessPair_GetScreen
    bl DisplayBrightness_GetCurrent
    mvn r1, #0xf
    cmp r0, r1
    bne L_0201d1f0
    ldr r0, L_0201d20c
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    ldr r1, L_0201d210
    ldr r3, L_0201d214
    mov r0, #0x34
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_0201d158
    mov r1, #0x1
    mov r2, r1
    bl Overlay052Scene_Init
L_0201d158:
    str r0, [r4, #0x28]
    ldr r1, [r4, #0x24]
    mov r2, #0x0
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    bl Overlay052Scene_SetMessageById
    ldr r0, L_0201d218
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mov r2, #0x6f
    bl Sound_Play
    ldr r0, L_0201d208
    mov r1, #0x1
    bl DisplayBrightnessPair_GetScreen
    mvn r1, #0xf
    mov r2, #0x0
    mov r3, #0x4
    bl DisplayBrightness_StartTransition
    b L_0201d1f0
L_0201d1a4:
    bl Overlay052Scene_UpdateMessageMenu
    cmp r0, #0x0
    beq L_0201d1d0
    cmp r4, #0x0
    beq L_0201d1c8
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_0201d1c8:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
L_0201d1d0:
    ldr r0, [r4, #0x28]
    ldrsh r1, [r0, #0x4]
    cmp r1, #0x1
    moveq r1, #0x1
    movne r1, #0x0
    cmp r1, #0x0
    beq L_0201d1f0
    bl Overlay052Scene_BeginConfirmationFade
L_0201d1f0:
    ldr r0, L_0201d21c
    mov r1, #0x2
    ldr r0, [r0, #0x0]
    bl GamePhaseRuntime_UpdateActorPresentationState
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_0201d208: .word gDisplayBrightnessPair
L_0201d20c: .word gDebugFont
L_0201d210: .word gOverlay52ChildAllocationTag
L_0201d214: .word gHeapContext
L_0201d218: .word gSoundContext
L_0201d21c: .word gGamePhaseRuntime


.size Overlay52Scene_Update, . - Overlay52Scene_Update
