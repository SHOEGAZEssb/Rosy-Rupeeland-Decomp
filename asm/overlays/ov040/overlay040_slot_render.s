    .text
/* Exact fallback; see overlay040_object_update.c for portable C. */
    .extern VecFx32Object_InitComponents
    .extern VecFx32Object_Destroy
    .extern GraphicsImmediateEffectRenderer_SetupProjection
    .extern GraphicsImmediateEffectRenderer_DrawTexturedQuad

.global func_ov040_0220332c
func_ov040_0220332c: ; 0x0220332c
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x194
    mov r6, #0x14
    add r7, sp, #0xfc
    mvn r10, #0x7
    add ip, sp, #0x124
    add r5, sp, #0x114
    add r2, sp, #0x134
    add r11, sp, #0x144
    mov r4, r0
    mov r8, #0x8
    add r3, sp, #0x12c
    add r9, sp, #0xec
    add r1, sp, #0x13c
    add lr, sp, #0x11c
    mov r0, #0xc
    str r6, [r7, #0x0]
    str r6, [r7, #0x4]
    add r7, sp, #0x10c
    sub r6, r6, #0x20
    str r0, [r7, #0x0]
    str r0, [r7, #0x4]
    add r7, sp, #0x104
    str r10, [ip, #0x0]
    str r10, [ip, #0x4]
    add ip, sp, #0xf4
    str r8, [r3, #0x0]
    str r8, [r3, #0x4]
    sub r3, r8, #0x1c
    str r8, [r9, #0x0]
    str r8, [r9, #0x4]
    str r10, [r5, #0x0]
    str r10, [r5, #0x4]
    add r5, sp, #0x164
    str r6, [r7, #0x0]
    str r6, [r7, #0x4]
    sub r7, r0, #0x16
    add r9, sp, #0x154
    str r3, [ip, #0x0]
    str r3, [ip, #0x4]
    add ip, sp, #0x15c
    mov r3, #0xa
    str r8, [r1, #0x0]
    str r8, [r1, #0x4]
    add r1, sp, #0x14c
    str r10, [sp, #0xe4]
    str r10, [sp, #0xe8]
    str r8, [lr, #0x0]
    str r8, [lr, #0x4]
    str r10, [r2, #0x0]
    str r10, [r2, #0x4]
    str r10, [r11, #0x0]
    str r10, [r11, #0x4]
    str r8, [r1, #0x0]
    str r8, [r1, #0x4]
    str r7, [r9, #0x0]
    str r7, [r9, #0x4]
    str r3, [ip, #0x0]
    str r3, [ip, #0x4]
    str r7, [r5, #0x0]
    str r6, [r5, #0x4]
    add ip, sp, #0x16c
    add r11, sp, #0x174
    add r9, sp, #0x17c
    add r7, sp, #0x184
    add r5, sp, #0x18c
    mov r2, #0x68000
    mov r1, #0xc8000
    add lr, sp, #0x44
    str r3, [ip, #0x0]
    add r3, sp, #0x84
    str r0, [ip, #0x4]
    mov ip, #0xc0000
    str r2, [sp, #0x34]
    add r2, sp, #0x6c
    str r6, [r11, #0x0]
    str r6, [r11, #0x4]
    mov r6, #0xe8000
    str r0, [r9, #0x0]
    str r0, [r9, #0x4]
    mov r0, #0xf0000
    str r10, [r7, #0x0]
    str r10, [r7, #0x4]
    str r8, [r5, #0x0]
    str r8, [r5, #0x4]
    mov r8, #0xd8000
    str r1, [sp, #0x38]
    str ip, [lr, #0x0]
    str r1, [lr, #0x4]
    str ip, [r2, #0x0]
    str r6, [r2, #0x4]
    str r1, [r3, #0x0]
    str r0, [r3, #0x4]
    add r10, sp, #0x3c
    mov r3, #0x78000
    stmia r10, {r3, r8}
    add r11, sp, #0x4c
    add r7, sp, #0x74
    mov r9, #0x98000
    add r5, sp, #0x54
    mov r2, #0xb0000
    str r9, [r7, #0x0]
    str r0, [r7, #0x4]
    add r7, sp, #0x5c
    str r9, [r5, #0x0]
    str r8, [r5, #0x4]
    add ip, sp, #0x64
    str r6, [r11, #0x0]
    str r0, [r11, #0x4]
    str r2, [r7, #0x0]
    str r0, [r7, #0x4]
    stmia ip, {r2, r8}
    mov r10, #0x100000
    add r11, sp, #0x7c
    mov r5, #0xa8000
    stmia r11, {r5, r10}
    add r1, sp, #0x8c
    stmia r1, {r8, r10}
    add r9, sp, #0x94
    add r2, sp, #0x9c
    str r8, [r9, #0x0]
    str r0, [r9, #0x4]
    str r6, [r2, #0x0]
    str r10, [r2, #0x4]
    add r1, sp, #0xa4
    mov r8, #0x20000
    mov r9, #0x58000
    stmia r1, {r8, r9}
    add ip, sp, #0xac
    mov r11, #0x30000
    add r0, sp, #0xb4
    str r11, [ip, #0x0]
    str r3, [ip, #0x4]
    stmia r0, {r8, r9}
    add r7, sp, #0xbc
    add r6, sp, #0xc4
    str r11, [r7, #0x0]
    str r3, [r7, #0x4]
    stmia r6, {r8, r9}
    add lr, sp, #0xcc
    add r2, sp, #0xd4
    str r11, [lr, #0x0]
    str r3, [lr, #0x4]
    stmia r2, {r8, r9}
    add r5, sp, #0xdc
    str r11, [r5, #0x0]
    str r3, [r5, #0x4]
    ldr r0, [r4, #0x0]
    ldr r0, [r0, #0x10]
    bl GraphicsImmediateEffectRenderer_SetupProjection
    mov r0, #0x50
    ldr r6, .L_02203670
    ldr r5, .L_02203674
    sub r10, r0, #0x1
    add r11, sp, #0x24
    add r9, sp, #0xe4
    mov r8, #0x0
    add r7, sp, #0x34
.L_022035a4:
    add r1, r4, r10, lsl #0x2
    ldr r0, [r1, #0x824]
    cmp r0, #0x1
    blt .L_02203660
    ldr r0, [r1, #0x6e4]
    cmp r0, r5
    blt .L_022035d4
    mov r0, r0, asr #0x1
    mov r1, r0, lsr #0x1f
    rsb r0, r1, r0, lsl #0x1f
    adds r0, r1, r0, ror #0x1f
    bne .L_02203660
.L_022035d4:
    add r2, r4, r10, lsl #0x4
    ldr r0, [r2, #0xab0]
    ldr r1, [r2, #0xaa8]
    rsb r3, r0, #0x0
    ldr r2, [r2, #0xaac]
    mov r0, r11
    mov r3, r3, asr #0xc
    bl VecFx32Object_InitComponents
    mov r1, #0x1000
    add r0, sp, #0x14
    mov r2, r1
    mov r3, r1
    bl VecFx32Object_InitComponents
    add r0, r4, r10, lsl #0x2
    ldr r0, [r0, #0x824]
    add r3, r4, r10, lsl #0x1
    mov r2, r0, lsl #0x1
    add r0, r9, r2, lsl #0x3
    str r0, [sp, #0x0]
    add r0, r7, r2, lsl #0x3
    str r8, [sp, #0x4]
    str r0, [sp, #0x8]
    str r6, [sp, #0xc]
    str r8, [sp, #0x10]
    ldr r0, [r4, #0x0]
    add r3, r3, #0x500
    ldrh r3, [r3, #0x4]
    ldr r0, [r0, #0x10]
    mov r1, r11
    add r2, sp, #0x14
    bl GraphicsImmediateEffectRenderer_DrawTexturedQuad
    add r0, sp, #0x14
    bl VecFx32Object_Destroy
    mov r0, r11
    bl VecFx32Object_Destroy
.L_02203660:
    subs r10, r10, #0x1
    bpl .L_022035a4
    add sp, sp, #0x194
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02203670: .word 0x7fff
.L_02203674: .word 0x1b3
    .size func_ov040_0220332c, . - func_ov040_0220332c
