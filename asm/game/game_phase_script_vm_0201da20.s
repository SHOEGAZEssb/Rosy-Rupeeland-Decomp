; Matching retail form; see src/game/overlay60_object_spawn.c.
.text
.extern GamePhaseScriptVm_Pop
.extern func_020be328
.extern GraphicsSpriteState_SetAnimationIndex
.extern func_020791e0
.extern Actor_GetCollection
.extern func_02078e98
.extern func_0201d9e4
.extern func_0201da34
.extern OverlayManager_GetGlobal
.extern OverlayManager_LoadOverlay
.extern Heap_Alloc
.extern func_ov060_022100e4
.extern data_021f3ecc
.extern data_021f4090
.extern data_020d5e00
.extern gHeapContext
.global func_0201da20
func_0201da20: ; 0x0201da20
    ldr ip, L_0201da2c
    ldr r0, L_0201da30
    bx ip
L_0201da2c: .word func_02078e98
L_0201da30: .word data_021f4090


.size func_0201da20, . - func_0201da20
