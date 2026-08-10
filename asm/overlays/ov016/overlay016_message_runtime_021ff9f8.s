    .text

/* Exact fallback; see src/overlays/ov016/overlay016_message_runtime.c. */
    .extern Heap_Alloc
    .extern data_020f4e14
    .extern data_021f3ecc
    .extern data_ov016_022015b8
    .extern func_02070e0c
    .extern GraphicsSpriteRenderer_SetFontResource
    .extern GraphicsSpriteRenderer_DrawText
    .extern GraphicsSpriteRenderer_MeasureText
    .extern GraphicsSpriteCanvas_FillRect
    .extern func_020791e0
    .extern func_02092790
    .extern func_02095f8c
    .extern gHeapContext
.global func_ov016_021ff9f8
func_ov016_021ff9f8:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0xc
    mov r4, r1
    mov r5, r0
    mov r6, r2
    ldr r1, L_021ffb2c
    ldr r3, L_021ffb30
    mov r0, #0x1c0
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021ffa50
    mov r2, #0x1
    str r2, [sp, #0x0]
    mov r1, #0x80
    str r1, [sp, #0x4]
    mov r3, #0x48
    ldr r1, L_021ffb34
    str r3, [sp, #0x8]
    ldr r1, [r1, #0x0]
    mov r3, r6
    bl func_02095f8c
L_021ffa50:
    str r0, [r5, #0x464]
    mov r0, #0x74
    str r0, [sp, #0x0]
    mov r1, #0x0
    ldr r0, L_021ffb34
    str r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r1, #0x40
    mov r2, #0x14
    mov r3, #0xc0
    bl GraphicsSpriteCanvas_FillRect
    ldr r0, L_021ffb34
    ldr r1, [r5, #0x64]
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_SetFontResource
    mov r0, r4, lsl #0x10
    mov r4, r0, lsr #0x10
    ldr r0, L_021ffb38
    mov r1, r4
    bl func_020791e0
    mov r1, r0
    ldr r0, L_021ffb34
    mov r2, #0x4
    ldr r0, [r0, #0x0]
    mov r3, #0x0
    bl GraphicsSpriteRenderer_MeasureText
    mov r1, r4
    mov r4, r0
    ldr r0, L_021ffb38
    bl func_020791e0
    add r1, r4, r4, lsr #0x1f
    mov r1, r1, asr #0x1
    rsb r2, r1, #0x80
    mov r1, r0
    mov r0, #0xe
    str r0, [sp, #0x0]
    mov r0, #0x4
    str r0, [sp, #0x4]
    mov r0, #0x0
    str r0, [sp, #0x8]
    ldr r0, L_021ffb34
    mov r3, #0x20
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_DrawText
    add r0, r5, #0x84
    mov r1, #0x4
    bl func_02092790
    mov r1, #0x1
    mov r2, #0x0
    bl func_02070e0c
    ldr r0, [r5, #0x48]
    orr r0, r0, #0x2
    str r0, [r5, #0x48]
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, r5, r6, pc}
L_021ffb2c: .word data_ov016_022015b8
L_021ffb30: .word gHeapContext
L_021ffb34: .word data_020f4e14
L_021ffb38: .word data_021f3ecc
    .size func_ov016_021ff9f8, . - func_ov016_021ff9f8

