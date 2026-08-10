.text

/* Exact fallback; see src/overlays/ov025/overlay025_name_entry.c. */
.extern data_020f4e14
.extern GraphicsSpriteRenderer_SetFontResource
.extern func_02075e48
.extern func_02075ea8
.extern func_02075ecc
.extern GraphicsSpriteCanvas_FillRect


    .global func_ov025_021fd03c
func_ov025_021fd03c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
    sub sp, sp, #0x8
    ldr r3, L_021fd15c
    mov r9, r0
    ldr r0, [r3, #0x0]
    mov r8, r2
    bl GraphicsSpriteRenderer_SetFontResource
    mov r0, #0x18
    mov r1, #0x0
    str r0, [sp, #0x0]
    ldr r0, L_021fd15c
    str r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r2, r1
    mov r3, #0xff
    bl GraphicsSpriteCanvas_FillRect
    mov r7, #0x0
    mov r6, #0xe
    mov r5, #0x6
    ldr r4, L_021fd15c
    b L_021fd0dc
L_021fd090:
    add r0, r9, r7, lsl #0x1
    add r0, r0, #0x100
    ldrh r0, [r0, #0x80]
    bl func_02075ecc
    mov r10, r0
    ldr r0, [r4, #0x0]
    mov r1, r10
    bl func_02075ea8
    str r6, [sp, #0x0]
    add r3, r9, r7, lsl #0x2
    ldr ip, [r3, #0x10]
    add r2, r0, r0, lsr #0x1f
    ldrsh ip, [ip, #0x2c]
    ldr r0, [r4, #0x0]
    mov r1, r10
    mov r3, r5
    sub r2, ip, r2, asr #0x1
    bl func_02075e48
    add r7, r7, #0x1
L_021fd0dc:
    ldr r0, [r9, #0x17c]
    cmp r7, r0
    blt L_021fd090
    mov r0, #0x0
    mov r2, #0x100
    mov r5, r0
L_021fd0f4:
    ldr r1, [r9, #0x17c]
    cmp r1, r0
    bne L_021fd12c
    cmp r8, #0x0
    beq L_021fd12c
    add r4, r9, r0, lsl #0x2
    ldr r3, [r4, #0x10]
    ldrh r1, [r3, #0x24]
    orr r1, r1, #0x2
    bic r1, r1, #0x1
    strh r1, [r3, #0x24]
    ldr r1, [r4, #0x10]
    strh r5, [r1, #0x28]
    b L_021fd148
L_021fd12c:
    add r4, r9, r0, lsl #0x2
    ldr r3, [r4, #0x10]
    ldrh r1, [r3, #0x24]
    bic r1, r1, #0x2
    strh r1, [r3, #0x24]
    ldr r1, [r4, #0x10]
    strh r2, [r1, #0x28]
L_021fd148:
    add r0, r0, #0x1
    cmp r0, #0x8
    blt L_021fd0f4
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
L_021fd15c: .word data_020f4e14
.size func_ov025_021fd03c, .-func_ov025_021fd03c

