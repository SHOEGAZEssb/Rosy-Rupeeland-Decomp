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
.extern TimedSpritePresentation_InitBase
.extern func_0201e28c
.extern PaletteCyclePresentation_AdvancePalette
.extern GraphicsBgResourceData_GetDecoded
.extern func_02091b6c
.extern func_02091b98
.extern func_02091bd0
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

.global PaletteCyclePresentation_UploadPalette
    .type PaletteCyclePresentation_UploadPalette, @function
PaletteCyclePresentation_UploadPalette: ; 0x020228dc
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x444]
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    bl func_020b13d4
    add r0, r4, #0x10
    mov r1, #0x0
    mov r2, #0x200
    bl func_020b1360
    bl func_020b1314
    ldmia sp!, {r4, pc}
    .size PaletteCyclePresentation_UploadPalette, .-PaletteCyclePresentation_UploadPalette

