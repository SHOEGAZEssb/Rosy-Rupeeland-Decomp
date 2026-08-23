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

.global DisplayFadePresentation_ReportComplete
    .type DisplayFadePresentation_ReportComplete, @function
DisplayFadePresentation_ReportComplete: ; 0x02021278
    mov r0, #0x1
    bx lr
    .size DisplayFadePresentation_ReportComplete, .-DisplayFadePresentation_ReportComplete

