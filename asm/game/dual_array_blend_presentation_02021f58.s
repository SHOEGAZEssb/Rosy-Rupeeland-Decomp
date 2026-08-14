; Matching retail form; see src/game/dual_array_blend_presentation.c.
.text
.extern GameWork_ClearFlag
.extern GameWork_SetFlag
.extern GameWork_TestFlag
.extern Heap_Free
.extern __construct_array
.extern __destroy_arr
.extern data_020c36c4
.extern data_020d63d0
.extern data_020d63e0
.extern gDualArrayBlendPresentationVtable
.extern data_021055dc
.extern func_0201e250
.extern func_0201e28c
.extern BlendElement_DestroyNoOp
.extern ExtendedCallbackState_SetReferencesAndReset
.extern DualArrayBlendPresentation_RetargetMirrored
.extern BlendElement_StartDuration
.extern DualArrayBlendPresentation_RetargetSeparated
.extern DualArrayBlendPresentation_UpdateTransition
.extern DualArrayBlendPresentation_RetargetCompletedRandomly
.extern func_0209189c
.extern func_020918f4
.extern func_02092418
.extern func_020948e4
.extern func_02094ad4
.extern func_02094bbc
.extern func_02094d28
.extern func_020afd0c
.extern gGameWork
.extern gSystemState
.extern genrand_int32

.global DualArrayBlendPresentation_ReportComplete
    .type DualArrayBlendPresentation_ReportComplete, @function
DualArrayBlendPresentation_ReportComplete: ; 0x02021f58
    mov r0, #0x1
    bx lr
    .size DualArrayBlendPresentation_ReportComplete, .-DualArrayBlendPresentation_ReportComplete
