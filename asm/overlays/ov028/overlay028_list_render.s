.text

/* Exact fallback; see src/overlays/ov028/overlay028_list_render.c. */
.extern data_021f3ecc
.extern GraphicsSpriteRenderer_SetFontResource
.extern GraphicsSpriteRenderer_ClearTextBuffer
.extern func_02076148
.extern func_02079f3c
.extern func_020befec
.extern func_ov028_021fd390
.extern func_ov028_021fd420
.extern func_ov028_021fd468

.global func_ov028_021fd468
func_ov028_021fd468:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0xc
    mov r10, r0
    ldr r0, [r10, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    ldr r0, [r10, #0x40]
    cmp r0, #0x0
    beq L_021fd54c
    ldr r0, [r10, #0x0]
    ldr r1, [r10, #0x14]
    bl GraphicsSpriteRenderer_SetFontResource
    mov r9, #0x0
    mov r4, #0x6
    mov r5, #0x1
    mov r11, r9
    mov r8, #0xe
    mov r7, r4
    mov r6, r9
    b L_021fd544
L_021fd4b4:
    ldr r1, [r10, #0x44]
    ldr r0, [r10, #0x40]
    ldr r1, [r1, #0xc]
    add r1, r9, r1
    cmp r1, r0
    bge L_021fd54c
    mov r0, #0xc
    mul r0, r1, r0
    ldr r1, [r10, #0x38]
    ldr r0, [r1, r0]
    cmp r0, #0x0
    beq L_021fd510
    mov r3, #0x18
    mul r3, r9, r3
    str r8, [sp, #0x0]
    str r7, [sp, #0x4]
    str r6, [sp, #0x8]
    add r1, r0, #0x18
    ldr r0, [r10, #0x0]
    mov r2, #0x42
    add r3, r3, #0x15
    bl func_02076148
    b L_021fd540
L_021fd510:
    ldr r0, L_021fd554
    mov r1, #0x188
    bl func_02079f3c
    mov r3, #0x18
    mul r3, r9, r3
    str r5, [sp, #0x0]
    stmib sp, {r4, r11}
    add r1, r0, #0x2
    ldr r0, [r10, #0x0]
    mov r2, #0x42
    add r3, r3, #0x15
    bl func_02076148
L_021fd540:
    add r9, r9, #0x1
L_021fd544:
    cmp r9, #0x5
    blt L_021fd4b4
L_021fd54c:
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_021fd554: .word data_021f3ecc
.size func_ov028_021fd468, .-func_ov028_021fd468

.global func_ov028_021fd558
func_ov028_021fd558:
    stmdb sp!, {r4, lr}
    ldr r2, [r1, #0x4]
    ldr r1, [r1, #0x8]
    mov r4, r0
    sub r0, r1, #0x10
    subs r2, r2, #0x20
    mvnmi r0, #0x0
    ldmmiia sp!, {r4, pc}
    cmp r2, #0xac
    mvngt r0, #0x0
    ldmgtia sp!, {r4, pc}
    cmp r0, #0x0
    mvnlt r0, #0x0
    ldmltia sp!, {r4, pc}
    cmp r0, #0x78
    mvngt r0, #0x0
    ldmgtia sp!, {r4, pc}
    mov r1, #0x18
    bl func_020befec
    ldr r2, [r4, #0x44]
    cmp r0, #0x5
    ldr r2, [r2, #0xc]
    movge r0, #0x4
    ldr r1, [r4, #0x40]
    add r0, r0, r2
    cmp r0, r1
    mvnge r0, #0x0
    ldmia sp!, {r4, pc}
.size func_ov028_021fd558, .-func_ov028_021fd558

.global func_ov028_021fd5c8
func_ov028_021fd5c8:
    ldr r1, [r0, #0x44]
    ldr r2, [r0, #0x38]
    ldr r1, [r1, #0x14]
    mov r0, #0xc
    mla r0, r1, r0, r2
    bx lr
.size func_ov028_021fd5c8, .-func_ov028_021fd5c8
