.data
.global data_020d3f34
.global data_020d3f3c
.global data_020d3f50
.global data_020d3f58
.global gThreadVTable
.global gThreadStackTag
.extern data_020f35e0
.extern Thread_Destroy
.extern Thread_DestroyAndFree

/* Allocator-linked CodeWarrior RTTI descriptor for the recovered CThread. */
data_020d3f34:
    .word data_020f35e0
    .word data_020d3f3c
data_020d3f3c:
    .byte 0x37, 0x43, 0x54, 0x68, 0x72, 0x65, 0x61, 0x64
    .byte 0x00, 0x00, 0x00, 0x00
    .word 0
    .word data_020d3f34

data_020d3f50:
gThreadVTable:
    .word Thread_Destroy
    .word Thread_DestroyAndFree

/* Four-character allocation tag; trailing zeros preserve its eight-byte slot. */
data_020d3f58:
gThreadStackTag:
    .byte 0x53, 0x54, 0x41, 0x43, 0x00, 0x00, 0x00, 0x00
