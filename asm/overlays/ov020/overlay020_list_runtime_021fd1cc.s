    .text
/* Exact fallback; see src/overlays/ov020/overlay020_list_runtime.c. */
    .extern data_021f3ecc
    .extern GraphicsSpriteRenderer_SetFontResource
    .extern GraphicsSpriteRenderer_ClearTextBuffer
    .extern GraphicsSpriteRenderer_DrawText
    .extern RetailTextTable_FindRecordById

.global func_ov020_021fd1cc
func_ov020_021fd1cc:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0xc
    mov r10, r0
    ldr r0, [r10, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    ldr r0, [r10, #0x40]
    cmp r0, #0x0
    beq L_021fd274
    mov r8, #0x0
    mov r7, #0xe
    mov r6, #0x8
    mov r5, r8
    mov r11, #0xc
    mov r4, #0x18
    b L_021fd26c
L_021fd208:
    ldr r1, [r10, #0x44]
    ldr r0, [r10, #0x40]
    ldr r1, [r1, #0xc]
    add r2, r8, r1
    cmp r2, r0
    bge L_021fd274
    mul r1, r2, r11
    ldr r2, [r10, #0x38]
    ldr r0, [r10, #0x0]
    ldr r9, [r2, r1]
    ldr r1, [r10, #0x18]
    bl GraphicsSpriteRenderer_SetFontResource
    ldrh r1, [r9, #0xc]
    ldr r0, L_021fd27c
    bl RetailTextTable_FindRecordById
    mul r3, r8, r4
    str r7, [sp, #0x0]
    str r6, [sp, #0x4]
    str r5, [sp, #0x8]
    add r1, r0, #0x2
    ldr r0, [r10, #0x0]
    mov r2, #0x42
    add r3, r3, #0x15
    bl GraphicsSpriteRenderer_DrawText
    add r8, r8, #0x1
L_021fd26c:
    cmp r8, #0x5
    blt L_021fd208
L_021fd274:
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_021fd27c: .word data_021f3ecc
    .size func_ov020_021fd1cc, . - func_ov020_021fd1cc
