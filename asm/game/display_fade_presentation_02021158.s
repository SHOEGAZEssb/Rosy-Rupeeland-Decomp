; Matching retail form; see src/game/display_fade_presentation.c.
.text
.extern GameWork_ClearFlag
.extern GameWork_TestFlag
.extern GraphicsResourceSet_Destroy
.extern GraphicsResourceSet_Init
.extern GraphicsResourceSet_Load
.extern data_020d63c0
.extern data_020d63d8
.extern data_020d6564
.extern data_020f4e18
.extern TimedSpritePresentation_InitBase
.extern MainBg1_SetControl
.extern MainBg2_SetControl
.extern SubBg1_SetControl
.extern SubBg2_SetControl
.extern PairedReferenceState_SetReferencesAndReset
.extern func_02070638
.extern func_020706c4
.extern GraphicsBgResourceData_GetDecoded
.extern func_02070e0c
.extern func_02070eac
.extern func_02091b6c
.extern func_02091b98
.extern func_02091bac
.extern func_02091c7c
.extern func_020929b0
.extern func_020929f4
.extern func_02092b0c
.extern func_02092b34
.extern func_02092b60
.extern func_02092b68
.extern func_020afd0c
.extern func_020b1ff0
.extern func_020b2058
.extern func_020b44e8
.extern gGameWork

.global DisplayFadePresentation_UpdateFade
    .type DisplayFadePresentation_UpdateFade, @function
DisplayFadePresentation_UpdateFade: ; 0x02021158
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    mov r4, r0
    ldr r0, [r4, #0x10]
    cmp r0, #0x0
    beq .L_02021184
    cmp r0, #0x1
    beq .L_0202119c
    cmp r0, #0x2
    beq .L_020211dc
    b .L_02021258
.L_02021184:
    add r0, r4, #0x14
    mov r1, #0x1e
    bl func_02091b98
    ldr r0, [r4, #0x10]
    add r0, r0, #0x1
    str r0, [r4, #0x10]
.L_0202119c:
    add r0, r4, #0x14
    mov r1, #0x2
    bl func_02091c7c
    cmp r0, #0x0
    beq .L_02021258
    mov r0, #0x10
    str r0, [sp, #0x0]
    ldr r3, [r4, #0x34]
    add r0, r4, #0x14
    mov r1, #0x1
    mov r2, #0x0
    bl func_02091bac
    ldr r0, [r4, #0x10]
    add r0, r0, #0x1
    str r0, [r4, #0x10]
    b .L_02021258
.L_020211dc:
    add r0, r4, #0x14
    mov r1, #0x1
    bl func_02091c7c
    str r0, [r4, #0x38]
    ldr r0, [r4, #0x30]
    ldr r3, [r4, #0x38]
    cmp r0, #0x0
    mov r1, #0x2
    mov r2, #0x4
    bne .L_02021214
    ldr r0, .L_02021264
    str r3, [sp, #0x0]
    bl func_020afd0c
    b .L_02021220
.L_02021214:
    ldr r0, .L_02021268
    str r3, [sp, #0x0]
    bl func_020afd0c
.L_02021220:
    ldr r0, .L_0202126c
    ldr r1, .L_02021270
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    beq .L_02021258
    ldr r0, .L_0202126c
    ldr r1, .L_02021270
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    ldr r1, .L_02021274
    mov r0, r4
    ldmia r1, {r1, r2}
    bl PairedReferenceState_SetReferencesAndReset
.L_02021258:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
.L_02021264: .word 0x4000050
.L_02021268: .word 0x4001050
.L_0202126c: .word gGameWork
.L_02021270: .word 0x3d3
.L_02021274: .word data_020d63d8
    .size DisplayFadePresentation_UpdateFade, .-DisplayFadePresentation_UpdateFade

