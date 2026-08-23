; Matching retail form; see src/game/overlay60_object_spawn.c.
.text
.extern GamePhaseScriptVm_Pop
.extern SignedAbsoluteValueVariant
.extern GraphicsSpriteState_SetAnimationIndex
.extern func_020791e0
.extern Actor_GetOwningCollection
.extern LanguageResourceManager_FindById
.extern DisplayRouting_MatchesRequest
.extern func_0201da34
.extern OverlayManager_GetGlobal
.extern OverlayManager_LoadOverlay
.extern Heap_Alloc
.extern func_ov060_022100e4
.extern data_021f3ecc
.extern data_021f4090
.extern gOverlay60ScriptObjectAllocationTag
.extern gHeapContext
.global DisplayRouting_MatchesRequest
DisplayRouting_MatchesRequest: ; 0x0201d9e4
    ldr r1, L_0201da1c
    ldrh r1, [r1, #0x0]
    and r1, r1, #0x8000
    mov r1, r1, asr #0xf
    cmp r1, #0x1
    bne L_0201da0c
    cmp r0, #0x0
    moveq r0, #0x0
    movne r0, #0x1
    bx lr
L_0201da0c:
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    bx lr
L_0201da1c: .word 0x4000304


.size DisplayRouting_MatchesRequest, . - DisplayRouting_MatchesRequest
