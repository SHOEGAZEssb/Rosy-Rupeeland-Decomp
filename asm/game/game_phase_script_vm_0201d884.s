; Matching retail form; see src/game/overlay33_runtime_scene.c.
.text
.extern Scene_Init
.extern Scene_SetFlags03
.extern Scene_Destroy
.extern Heap_Alloc
.extern Heap_Free
.extern func_02006268
.extern func_02006280
.extern func_020062a0
.extern func_020062f8
.extern func_ov033_021fd070
.extern func_ov030_021fd260
.extern func_ov014_021fd2f8
.extern func_ov033_021fd37c
.extern func_ov033_021fd324
.extern func_02008b50
.extern func_02007908
.extern func_02007a24
.extern func_02008148
.extern func_0201dcec
.extern func_02009d78
.extern func_02010e68
.extern data_020d5dcc
.extern data_020d5df8
.extern data_020d36e1
.extern data_021052fc
.extern gLupyContext
.extern gHeapContext
.global func_0201d884
func_0201d884: ; 0x0201d884
    stmdb sp!, {r4, lr}
    ldr r1, L_0201d9b4
    mov r4, r0
    ldr r0, [r1, #0x0]
    ldr r2, [r4, #0x28]
    add r0, r0, #0x3000
    ldr r0, [r0, #0xbc]
    ldr r0, [r0, #0x0]
    cmp r2, r0
    beq L_0201d8dc
    str r0, [r4, #0x28]
    ldr r0, [r1, #0x0]
    ldr r1, L_0201d9b8
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea4]
    str r0, [r4, #0x2c]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x74]
    blx r2
    ldr r0, L_0201d9b4
    ldr r0, [r0, #0x0]
    bl func_02008b50
L_0201d8dc:
    ldr r0, L_0201d9b4
    ldr r1, [r4, #0x4]
    ldr r0, [r0, #0x0]
    mov r2, #0x3
    bl func_02007908
    ldr r0, [r4, #0x3c]
    bl func_ov014_021fd2f8 ; func_ov024_021fd2f8, func_ov033_021fd2f8
    cmp r0, #0x0
    beq L_0201d920
    cmp r4, #0x0
    beq L_0201d918
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_0201d918:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
L_0201d920:
    ldr r0, [r4, #0x3c]
    bl func_ov033_021fd37c ; func_ov038_021fd37c
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r0, L_0201d9b4
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    bl func_02008148
    ldr r0, L_0201d9b4
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl func_02008148
    ldr r0, L_0201d9b4
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl func_0201dcec
    ldr r0, L_0201d9b4
    ldr r1, [r4, #0x4]
    ldr r0, [r0, #0x0]
    mov r2, #0x3
    bl func_02007a24
    ldr r0, L_0201d9b4
    ldr r0, [r0, #0x0]
    add r0, r0, #0x3bc
    add r0, r0, #0x2c00
    bl func_02009d78
    mov r1, r0
    ldr r0, [r4, #0x3c]
    bl func_ov033_021fd324 ; func_ov037_021fd324
    ldr r0, L_0201d9bc
    ldr r0, [r0, #0x0]
    bl func_02010e68
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_0201d9b4: .word data_021052fc
L_0201d9b8: .word data_020d36e1
L_0201d9bc: .word gLupyContext


.size func_0201d884, . - func_0201d884
