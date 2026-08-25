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

.global PaletteCyclePresentation_Init
    .type PaletteCyclePresentation_Init, @function
PaletteCyclePresentation_Init: ; 0x02022580
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x10
    mov r4, r0
    bl FieldEffect_Init
    ldr r1, .L_0202266c
    add r0, r4, #0x410
    str r1, [r4, #0x0]
    bl func_02091d08
    add r0, r4, #0x28
    add r0, r0, #0x400
    bl TitleInterpolatedValue_Init
    mov r0, #0x0
    str r0, [r4, #0x444]
    mov r0, #0x1
    str r0, [r4, #0x8]
    mov r0, #0x78
    str r0, [r4, #0xc]
    add r0, sp, #0x4
    bl GraphicsResourceSet_Init
    ldr r3, .L_02022670
    ldr r1, .L_02022674
    str r3, [sp, #0x0]
    sub r2, r3, #0x4
    ldr r1, [r1, #0x0]
    add r0, sp, #0x4
    sub r3, r3, #0x3
    bl GraphicsResourceSet_Load
    ldr r0, [sp, #0x8]
    bl GraphicsBgResourceData_GetDecoded
    add r1, r4, #0x10
    mov r2, #0x200
    bl MIi_CpuCopy16
    mov r0, #0x1
    mov r1, #0x0
    str r0, [sp, #0x0]
    add r0, r4, #0x410
    mov r2, r1
    mov r3, #0x5
    bl func_02091d24
    ldr r5, [r4, #0x8]
    b .L_02022630
.L_02022624:
    mov r0, r4
    bl PaletteCyclePresentation_AdvancePalette
    add r5, r5, #0x1
.L_02022630:
    ldr r0, [r4, #0xc]
    cmp r5, r0
    blt .L_02022624
    ldr r0, .L_02022678
    ldr r1, .L_0202267c
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    ldr r1, [r4, #0x4]
    add r0, sp, #0x4
    orr r1, r1, #0x2
    str r1, [r4, #0x4]
    bl GraphicsResourceSet_Destroy
    mov r0, r4
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, pc}
.L_0202266c: .word gPaletteCyclePresentationVtable
.L_02022670: .word 0x904f
.L_02022674: .word data_020f4e18
.L_02022678: .word gGameWork
.L_0202267c: .word 0x408
    .size PaletteCyclePresentation_Init, .-PaletteCyclePresentation_Init

