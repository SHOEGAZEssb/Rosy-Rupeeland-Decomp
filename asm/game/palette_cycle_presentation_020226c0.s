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

.global PaletteCyclePresentation_AdvancePalette
    .type PaletteCyclePresentation_AdvancePalette, @function
PaletteCyclePresentation_AdvancePalette: ; 0x020226c0
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    mov r9, r0
    ldr r2, [r9, #0xc]
    b .L_020226e0
.L_020226d0:
    add r1, r9, r2, lsl #0x1
    ldrh r0, [r1, #0xe]
    sub r2, r2, #0x1
    strh r0, [r1, #0x10]
.L_020226e0:
    ldr r0, [r9, #0x8]
    cmp r2, r0
    bgt .L_020226d0
    bl genrand_int32
    tst r0, #0x1f
    ldreq r0, .L_0202287c
    mov r1, #0x2
    streqh r0, [r9, #0x34]
    add r0, r9, #0x28
    add r0, r0, #0x400
    bl func_02091c7c
    cmp r0, #0x0
    beq .L_0202272c
    add r0, r9, #0x28
    add r0, r0, #0x400
    mov r1, #0x10
    bl func_02091b98
    add r0, r9, #0x410
    bl func_02091dac
.L_0202272c:
    mov r5, #0x0
    add r4, r9, #0x28
    mov r11, #0x1f
    mov r10, #0x1
.L_0202273c:
    ldr r0, [r9, #0x410]
    mov r6, #0x0
    mov r7, r6
    mov r8, r6
    cmp r0, #0x5
    addls pc, pc, r0, lsl #0x2
    b .L_02022858
.L_02022758: ; jump table
    b .L_02022770 ; case 0
    b .L_02022790 ; case 1
    b .L_020227b0 ; case 2
    b .L_020227d0 ; case 3
    b .L_020227f0 ; case 4
    b .L_02022824 ; case 5
.L_02022770:
    mov r6, #0x1f
    add r0, r4, #0x400
    mov r1, r10
    mov r2, r6
    mov r3, r7
    bl TitleInterpolatedValue_Evaluate
    mov r8, r0
    b .L_02022858
.L_02022790:
    add r0, r4, #0x400
    mov r1, #0x1
    mov r2, r7
    mov r3, #0x10
    mov r6, r11
    bl TitleInterpolatedValue_Evaluate
    mov r7, r0
    b .L_02022858
.L_020227b0:
    mov r6, #0x1f
    add r0, r4, #0x400
    mov r1, #0x1
    mov r2, #0x10
    mov r3, r6
    bl TitleInterpolatedValue_Evaluate
    mov r7, r0
    b .L_02022858
.L_020227d0:
    add r0, r4, #0x400
    mov r1, #0x1
    mov r2, #0x1f
    mov r3, r6
    bl TitleInterpolatedValue_Evaluate
    mov r6, r0
    mov r7, #0x1f
    b .L_02022858
.L_020227f0:
    add r0, r4, #0x400
    mov r1, #0x1
    mov r2, #0x1f
    mov r3, #0x10
    bl TitleInterpolatedValue_Evaluate
    mov r7, r0
    add r0, r4, #0x400
    mov r1, #0x1
    mov r2, r6
    mov r3, #0x1f
    bl TitleInterpolatedValue_Evaluate
    mov r8, r0
    b .L_02022858
.L_02022824:
    add r0, r4, #0x400
    mov r1, #0x1
    mov r2, r6
    mov r3, #0x1f
    bl TitleInterpolatedValue_Evaluate
    mov r6, r0
    add r0, r4, #0x400
    mov r1, #0x1
    mov r2, #0x10
    mov r3, r8
    bl TitleInterpolatedValue_Evaluate
    mov r7, r0
    mov r8, #0x1f
.L_02022858:
    orr r0, r6, r7, lsl #0x5
    orr r1, r0, r8, lsl #0xa
    ldr r0, [r9, #0x8]
    add r5, r5, #0x1
    add r0, r9, r0, lsl #0x1
    strh r1, [r0, #0x10]
    cmp r5, #0x6
    blt .L_0202273c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0202287c: .word 0x7fff
    .size PaletteCyclePresentation_AdvancePalette, .-PaletteCyclePresentation_AdvancePalette

