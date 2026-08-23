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
.extern FieldEffect_Init
.extern MainBg1_SetControl
.extern MainBg2_SetControl
.extern SubBg1_SetControl
.extern SubBg2_SetControl
.extern PairedReferenceState_SetReferencesAndReset
.extern func_02070638
.extern func_020706c4
.extern GraphicsBgResourceData_GetDecoded
.extern GraphicsBgMapResource_UploadToMainBg
.extern GraphicsBgMapResource_UploadToSubBg
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

.global DisplayFadePresentation_ApplyScrollOffsets
    .type DisplayFadePresentation_ApplyScrollOffsets, @function
DisplayFadePresentation_ApplyScrollOffsets: ; 0x02021290
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r4, r1
    mov r7, r0
    cmp r4, #0xc0
    ldmgeia sp!, {r3, r4, r5, r6, r7, pc}
    add r0, r7, #0x3c
    bl func_02092b0c
    mov r6, r0
    mov r1, r4
    add r0, r7, #0x3c
    bl func_02092b34
    mov r5, r0
    add r0, r7, #0x3c
    bl func_02092b60
    mov r4, r0
    add r0, r7, #0x3c
    bl func_02092b68
    ldr r1, [r7, #0x30]
    ldr r2, .L_02021344
    cmp r1, #0x0
    bne .L_02021314
    mov r1, r2, lsl #0x10
    mov r3, r1
    ldr ip, .L_02021348
    and r6, r6, r2
    and r1, r1, r4, lsl #0x10
    orr r4, r6, r1
    and r1, r5, r2
    and r0, r3, r0, lsl #0x10
    str r4, [ip, #0x0]
    orr r0, r1, r0
    str r0, [ip, #0x4]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_02021314:
    mov r1, r2, lsl #0x10
    mov r3, r1
    ldr ip, .L_0202134c
    and r6, r6, r2
    and r1, r1, r4, lsl #0x10
    orr r4, r6, r1
    and r1, r5, r2
    and r0, r3, r0, lsl #0x10
    str r4, [ip, #0x0]
    orr r0, r1, r0
    str r0, [ip, #0x4]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_02021344: .word 0x1ff
.L_02021348: .word 0x4000014
.L_0202134c: .word 0x4001014
    .size DisplayFadePresentation_ApplyScrollOffsets, .-DisplayFadePresentation_ApplyScrollOffsets

