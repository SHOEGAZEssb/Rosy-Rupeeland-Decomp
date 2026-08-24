; Matching retail form; see src/game/overlay60_object_spawn.c.
.text
.extern GamePhaseScriptVm_Pop
.extern SignedAbsoluteValueVariant
.extern GraphicsSpriteState_SetAnimationIndex
.extern LanguageLookupDatabase_GetResourceById
.extern Actor_GetOwningCollection
.extern LanguageDatabase_GetRecordById
.extern DisplayRouting_MatchesRequest
.extern func_0201da34
.extern OverlayManager_GetGlobal
.extern OverlayManager_LoadOverlay
.extern Heap_Alloc
.extern func_ov060_022100e4
.extern data_021f3ecc
.extern gLanguageDatabase
.extern gOverlay60ScriptObjectAllocationTag
.extern gHeapContext
.global func_0201da20
func_0201da20: ; 0x0201da20
    ldr ip, L_0201da2c
    ldr r0, L_0201da30
    bx ip
L_0201da2c: .word LanguageDatabase_GetRecordById
L_0201da30: .word gLanguageDatabase


.size func_0201da20, . - func_0201da20
