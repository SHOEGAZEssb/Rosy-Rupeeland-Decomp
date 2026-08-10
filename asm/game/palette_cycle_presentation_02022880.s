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
.extern func_0201e250
.extern func_0201e28c
.extern PaletteCyclePresentation_AdvancePalette
.extern func_02070874
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

.global PaletteCyclePresentation_Update
    .type PaletteCyclePresentation_Update, @function
PaletteCyclePresentation_Update: ; 0x02022880
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r1, #0x1
    str r1, [r4, #0x444]
    bl PaletteCyclePresentation_AdvancePalette
    add r0, r4, #0x10
    mov r1, #0x200
    bl func_020b4554
    ldr r0, .L_020228d4
    ldr r1, .L_020228d8
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, .L_020228d4
    ldr r1, .L_020228d8
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_020228d4: .word gGameWork
.L_020228d8: .word 0x408
    .size PaletteCyclePresentation_Update, .-PaletteCyclePresentation_Update

