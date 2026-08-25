; Matching retail form; see src/game/palette_cycle_presentation.c.
.text
.extern GameWork_ClearFlag
.extern GameWork_TestFlag
.extern GraphicsResourceSet_Destroy
.extern GraphicsResourceSet_Init
.extern GraphicsResourceSet_Load
.extern Heap_Free
.extern MIi_CpuCopy16
.extern gPaletteCyclePresentationVtable
.extern data_020f4e18
.extern FieldEffect_Init
.extern FieldEffect_DestroyBase
.extern PaletteCyclePresentation_AdvancePalette
.extern GraphicsBgResourceData_GetDecoded
.extern TitleInterpolatedValue_Init
.extern func_02091b98
.extern TitleInterpolatedValue_Evaluate
.extern func_02091c7c
.extern func_02091d08
.extern func_02091d24
.extern func_02091dac
.extern func_020b1314
.extern func_020b1360
.extern func_020b13d4
.extern func_020b4554
.extern gGameWork
.extern genrand_int32

.global PaletteCyclePresentation_DestroyAndFree
    .type PaletteCyclePresentation_DestroyAndFree, @function
PaletteCyclePresentation_DestroyAndFree: ; 0x0202269c
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r1, #0x0
    str r1, [r4, #0x444]
    bl FieldEffect_DestroyBase
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size PaletteCyclePresentation_DestroyAndFree, .-PaletteCyclePresentation_DestroyAndFree

