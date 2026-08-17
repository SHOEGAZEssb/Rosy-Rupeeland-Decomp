.text

/* Exact fallback; see src/overlays/ov023/overlay023_pointer_collection.c. */
.extern data_021f5128
.extern GraphicsSpriteRenderer_SetFontResource
.extern GraphicsSpriteRenderer_DrawText
.extern GraphicsSpriteCanvas_FillRect
.extern RecordMode_GetMessageGroup
.extern gSystemState


    .global func_ov023_021fd7a8
func_ov023_021fd7a8:
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
    ldr r0, [r10, #0x44]
    cmp r0, #0x0
    beq L_021fd8d4
    mov r6, #0x0
    mov r0, #0x20
    mov r7, r6
    sub r5, r0, #0x2
    mov r11, #0xe
    mvn r4, #0x1
    b L_021fd8cc
L_021fd7fc:
    ldr r1, [r10, #0x48]
    ldr r0, [r10, #0x44]
    ldr r1, [r1, #0xc]
    add r1, r7, r1
    cmp r1, r0
    bge L_021fd8d4
    cmp r6, #0x0
    ldr r0, [r10, #0x3c]
    ldr r9, [r0, r1, lsl #0x2]
    bne L_021fd88c
    ldr r0, L_021fd8dc
    ldr r1, [r10, #0x20]
    ldrb r0, [r0, #0x5f]
    mov r8, #0x20
    mov r6, #0x1
    cmp r0, #0x0
    ldr r0, [r10, #0x0]
    movne r8, r5
    bl GraphicsSpriteRenderer_SetFontResource
    ldr r0, L_021fd8e0
    ldr r1, [r0, #0x0]
    ldr r0, [r9, #0x4]
    ldr r0, [r0, #0xc]
    and r0, r0, #0xff
    ldr r0, [r1, r0, lsl #0x2]
    bl RecordMode_GetMessageGroup
    str r11, [sp, #0x0]
    mov r1, #0x8
    str r1, [sp, #0x4]
    mov r1, #0x0
    str r1, [sp, #0x8]
    mov r1, r0
    ldr r0, [r10, #0x0]
    mov r3, r8
    mov r2, #0x40
    bl GraphicsSpriteRenderer_DrawText
L_021fd88c:
    ldr r0, [r10, #0x0]
    ldr r1, [r10, #0x18]
    bl GraphicsSpriteRenderer_SetFontResource
    mov r3, #0x16
    mov r0, #0xe
    mul r3, r7, r3
    str r0, [sp, #0x0]
    mov r0, #0x8
    stmib sp, {r0, r4}
    ldr r1, [r9, #0x4]
    ldr r0, [r10, #0x0]
    add r1, r1, #0x2c
    mov r2, #0x44
    add r3, r3, #0x35
    bl GraphicsSpriteRenderer_DrawText
    add r7, r7, #0x1
L_021fd8cc:
    cmp r7, #0x4
    blt L_021fd7fc
L_021fd8d4:
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_021fd8dc: .word gSystemState
L_021fd8e0: .word data_021f5128
.size func_ov023_021fd7a8, .-func_ov023_021fd7a8

