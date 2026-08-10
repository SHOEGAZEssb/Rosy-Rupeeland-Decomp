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
.extern func_0201e250
.extern MainBg1_SetControl
.extern MainBg2_SetControl
.extern SubBg1_SetControl
.extern SubBg2_SetControl
.extern PairedReferenceState_SetReferencesAndReset
.extern func_02070638
.extern func_020706c4
.extern func_02070874
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

.global DisplayFadePresentation_DispatchCallback
    .type DisplayFadePresentation_DispatchCallback, @function
DisplayFadePresentation_DispatchCallback: ; 0x02021118
    stmdb sp!, {r3, lr}
    ldr r1, [r0, #0x8]
    cmp r1, #0x0
    beq .L_02021150
    ldr r1, [r0, #0xc]
    add r2, r0, r1, asr #0x1
    tst r1, #0x1
    ldrne r1, [r2, #0x0]
    ldrne r0, [r0, #0x8]
    ldrne r1, [r1, r0]
    ldreq r1, [r0, #0x8]
    mov r0, r2
    blx r1
    ldmia sp!, {r3, pc}
.L_02021150:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
    .size DisplayFadePresentation_DispatchCallback, .-DisplayFadePresentation_DispatchCallback

