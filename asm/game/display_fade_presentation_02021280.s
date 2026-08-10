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
.extern func_02020e60
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

.global func_02021280
    .type func_02021280, @function
func_02021280: ; 0x02021280
    ldr ip, .L_0202128c
    add r0, r0, #0x3c
    bx ip
.L_0202128c: .word func_020929f4
    .size func_02021280, .-func_02021280

