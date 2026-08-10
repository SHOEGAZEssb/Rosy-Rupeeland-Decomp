.text

/* Exact fallback; see src/overlays/ov023/overlay023_record_collection.c. */
.extern GraphicsSpriteRenderer_SetFontResource
.extern GraphicsSpriteRenderer_DrawText
.extern GraphicsSpriteCanvas_FillRect


    .global func_ov023_021fd268
func_ov023_021fd268:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0xc
    mov r2, #0xb0
    mov r1, #0x0
    str r2, [sp, #0x0]
    mov r10, r0
    str r1, [sp, #0x4]
    ldr r0, [r10, #0x0]
    mov r2, r1
    mov r3, #0xff
    bl GraphicsSpriteCanvas_FillRect
    ldr r0, [r10, #0x34]
    cmp r0, #0x0
    beq L_021fd320
    mov r8, #0x0
    mov r7, #0xe
    mov r6, #0x8
    mvn r5, #0x1
    mov r11, #0x18
    mov r4, #0x1a
    b L_021fd318
L_021fd2bc:
    ldr r1, [r10, #0x38]
    ldr r0, [r10, #0x34]
    ldr r1, [r1, #0xc]
    add r1, r8, r1
    cmp r1, r0
    bge L_021fd320
    mul r2, r1, r11
    ldr r3, [r10, #0x2c]
    ldr r0, [r10, #0x0]
    ldr r1, [r10, #0x8]
    ldr r9, [r3, r2]
    bl GraphicsSpriteRenderer_SetFontResource
    mul r0, r8, r4
    str r7, [sp, #0x0]
    str r6, [sp, #0x4]
    str r5, [sp, #0x8]
    ldr r1, [r9, #0x4]
    add r3, r0, #0x24
    ldr r0, [r10, #0x0]
    add r1, r1, #0x2c
    mov r2, #0x40
    bl GraphicsSpriteRenderer_DrawText
    add r8, r8, #0x1
L_021fd318:
    cmp r8, #0x4
    blt L_021fd2bc
L_021fd320:
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.size func_ov023_021fd268, .-func_ov023_021fd268

