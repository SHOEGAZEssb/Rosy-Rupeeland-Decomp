.text

/* Exact fallback; see src/overlays/ov028/overlay028_effect_display.c. */
.extern data_020f4e18
.extern data_021f3ecc
.extern data_ov028_021ff29c
.extern func_02071ee0
.extern func_02073e48
.extern GraphicsSpriteGroup_CreateStateFromSource
.extern GraphicsSpriteGroup_AdvanceAnimations
.extern GraphicsSpriteRenderer_SetFontResource
.extern GraphicsSpriteRenderer_DrawText
.extern func_02079d60
.extern func_02079f3c
.extern func_02091b98
.extern func_02091c7c
.extern func_02092e9c
.extern func_02093360
.extern func_02095308
.extern func_ov028_021fd7e0
.extern func_ov028_021fd86c

.global func_ov028_021fd8b8
func_ov028_021fd8b8:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0xc
    mov r5, r1
    mov r6, r0
    mov r4, r2
    bl func_ov028_021fd86c
    cmp r5, #0x0
    beq L_021fd9c0
    mov r0, r5
    bl func_02079d60
    mov r1, r0
    ldr r0, [r6, #0x50]
    mov r2, #0x1
    bl func_02092e9c
    ldr r0, [r6, #0x50]
    mov r1, #0x0
    bl func_02093360
    ldr r0, [r6, #0x0]
    ldr r1, [r6, #0x30]
    bl GraphicsSpriteRenderer_SetFontResource
    mov r0, #0xe
    str r0, [sp, #0x0]
    mov r0, #0x6
    str r0, [sp, #0x4]
    mov r0, #0x0
    str r0, [sp, #0x8]
    ldr r0, [r6, #0x0]
    add r1, r5, #0x18
    mov r2, #0x60
    mov r3, #0x1d
    bl GraphicsSpriteRenderer_DrawText
    ldr r3, [r5, #0x4]
    ldr r1, L_021fda44
    ldr r2, [r3, #0xc]
    add r0, r6, #0x8
    str r2, [sp, #0x0]
    ldr r1, [r1, #0x0]
    ldmib r3, {r2, r3}
    bl func_02071ee0
    ldr r0, [r6, #0x4]
    add r1, r6, #0x8
    mov r2, #0x2
    bl GraphicsSpriteGroup_CreateStateFromSource
    mov r1, #0x1
    str r1, [sp, #0x0]
    mov r1, #0x0
    str r1, [sp, #0x4]
    str r1, [sp, #0x8]
    ldrb r1, [r5, #0xc]
    mov r2, #0x39
    mov r3, #0x38
    bl func_02073e48
    ldr r0, [r6, #0x4]
    add r1, r6, #0x14
    mov r2, #0x2
    bl GraphicsSpriteGroup_CreateStateFromSource
    mov r2, #0x1
    str r2, [sp, #0x0]
    mov r2, #0x0
    str r2, [sp, #0x4]
    str r2, [sp, #0x8]
    add r1, r4, #0x32
    mov r2, #0x3a
    mov r3, #0x5e
    bl func_02073e48
    b L_021fda3c
L_021fd9c0:
    ldr r0, [r6, #0x0]
    ldr r1, [r6, #0x30]
    bl GraphicsSpriteRenderer_SetFontResource
    ldr r0, L_021fda48
    mov r1, #0x188
    bl func_02079f3c
    mov r1, #0x1
    mov r2, r0
    str r1, [sp, #0x0]
    mov r0, #0x6
    str r0, [sp, #0x4]
    mov r0, #0x0
    str r0, [sp, #0x8]
    ldr r0, [r6, #0x0]
    add r1, r2, #0x2
    mov r2, #0x60
    mov r3, #0x1d
    bl GraphicsSpriteRenderer_DrawText
    ldr r0, [r6, #0x4]
    add r1, r6, #0x14
    mov r2, #0x2
    bl GraphicsSpriteGroup_CreateStateFromSource
    mov r1, r4
    mov r2, #0x1
    str r2, [sp, #0x0]
    mov r2, #0x0
    str r2, [sp, #0x4]
    str r2, [sp, #0x8]
    mov r2, #0x3a
    mov r3, #0x5e
    bl func_02073e48
L_021fda3c:
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, r5, r6, pc}
L_021fda44: .word data_020f4e18
L_021fda48: .word data_021f3ecc
.size func_ov028_021fd8b8, .-func_ov028_021fd8b8

.global func_ov028_021fda4c
func_ov028_021fda4c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    beq L_021fda88
    add r0, r4, #0x58
    mov r1, #0x2
    bl func_02091c7c
    cmp r0, #0x0
    beq L_021fda88
    mov r0, r4
    bl func_ov028_021fd7e0
    add r0, r4, #0x58
    mov r1, #0x3
    bl func_02091b98
L_021fda88:
    ldr r0, [r4, #0x4]
    bl GraphicsSpriteGroup_AdvanceAnimations
    ldmia sp!, {r4, pc}
.size func_ov028_021fda4c, .-func_ov028_021fda4c

.global func_ov028_021fda94
func_ov028_021fda94:
    bx lr
.size func_ov028_021fda94, .-func_ov028_021fda94

.global func_ov028_021fda98
func_ov028_021fda98:
    ldr r2, L_021fdab4
    mov r1, #0x0
    str r2, [r0, #0x0]
    str r1, [r0, #0x8]
    str r1, [r0, #0x4]
    str r1, [r0, #0xc]
    bx lr
L_021fdab4: .word data_ov028_021ff29c
.size func_ov028_021fda98, .-func_ov028_021fda98

.global func_ov028_021fdab8
func_ov028_021fdab8:
    stmdb sp!, {r4, lr}
    ldr r1, L_021fdad4
    mov r4, r0
    str r1, [r4, #0x0]
    bl func_02095308
    mov r0, r4
    ldmia sp!, {r4, pc}
L_021fdad4: .word data_ov028_021ff29c
.size func_ov028_021fdab8, .-func_ov028_021fdab8

.global func_ov028_021fdad8
func_ov028_021fdad8:
    stmdb sp!, {r0, r1, r2, r3}
    ldr r2, [sp, #0x4]
    ldr r1, [sp, #0x8]
    str r2, [r0, #0x24]
    str r1, [r0, #0x28]
    mov r1, #0x0
    str r1, [r0, #0x4]
    str r1, [r0, #0x8]
    add sp, sp, #0x10
    bx lr
.size func_ov028_021fdad8, .-func_ov028_021fdad8
