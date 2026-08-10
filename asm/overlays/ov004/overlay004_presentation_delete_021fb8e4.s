    .text
    .extern data_ov004_021fcda0
    .extern gSoundContext
    .extern func_020597fc
    .extern GraphicsSpriteGroup_Destroy
    .extern func_ov004_021fb6e0
    .extern func_02071eb8
    .extern Heap_Free
    .global func_ov004_021fb8e4
func_ov004_021fb8e4: ; 0x021fb8e4
    stmdb sp!, {r4, lr}
    ldr r1, L_021fb960
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0x20]
    bic r0, r0, #0x400
    str r0, [r4, #0x20]
    ldr r1, [r4, #0x154]
    cmp r1, #0x0
    blt L_021fb918
    ldr r0, L_021fb964
    ldr r0, [r0, #0x0]
    bl func_020597fc
L_021fb918:
    ldr r0, [r4, #0x68]
    cmp r0, #0x0
    beq L_021fb930
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021fb930:
    ldr r0, [r4, #0x60]
    bl GraphicsSpriteGroup_Destroy
    ldr r0, [r4, #0x64]
    bl GraphicsSpriteGroup_Destroy
    add r0, r4, #0x6c
    bl func_ov004_021fb6e0
    add r0, r4, #0x54
    bl func_02071eb8
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
L_021fb960: .word data_ov004_021fcda0
L_021fb964: .word gSoundContext
    .size func_ov004_021fb8e4, .-func_ov004_021fb8e4

