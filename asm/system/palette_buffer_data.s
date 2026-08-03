.data
.global gPaletteBufferData
.global data_020d3f14
.extern MainBgExtendedPaletteBuffer_Destroy
.extern MainBgExtendedPaletteBuffer_DestroyAndFree
.extern MainBgPaletteBuffer_Destroy
.extern MainBgPaletteBuffer_DestroyAndFree
.extern PaletteBuffer_Destroy
.extern PaletteBuffer_DestroyAndFree
.extern SubBgPaletteBuffer_Destroy
.extern SubBgPaletteBuffer_DestroyAndFree
.extern SubBgExtendedPaletteBuffer_Destroy
.extern SubBgExtendedPaletteBuffer_DestroyAndFree
.extern ExtendedPaletteBuffer_Destroy
.extern ExtendedPaletteBuffer_DestroyAndFree
.extern data_020d3e3c
.extern data_020d3e44
.extern data_020d3e58
.extern data_020d3e64
.extern data_020d3e70

gPaletteBufferData:
    .word MainBgExtendedPaletteBuffer_Destroy
    .word MainBgExtendedPaletteBuffer_DestroyAndFree
    .word 0
    .word data_020d3e64
    .word MainBgPaletteBuffer_Destroy
    .word MainBgPaletteBuffer_DestroyAndFree
    .word 0
    .word data_020d3e44
    .word PaletteBuffer_Destroy
    .word PaletteBuffer_DestroyAndFree
    .word 0
    .word data_020d3e58
    .word SubBgPaletteBuffer_Destroy
    .word SubBgPaletteBuffer_DestroyAndFree
    .word 0
    .word data_020d3e70
    .word SubBgExtendedPaletteBuffer_Destroy
    .word SubBgExtendedPaletteBuffer_DestroyAndFree
data_020d3f14:
    .byte 0x31, 0x33, 0x43, 0x47, 0x78, 0x73, 0x42, 0x67
    .byte 0x45, 0x78, 0x74, 0x50, 0x6c, 0x74, 0x74, 0x00
    .byte 0x00, 0x00, 0x00, 0x00
    .word data_020d3e3c
    .word ExtendedPaletteBuffer_Destroy
    .word ExtendedPaletteBuffer_DestroyAndFree
