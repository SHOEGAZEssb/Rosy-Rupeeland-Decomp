    .text
/* Exact fallback; see src/overlays/ov022/overlay022_graphics_setup.c. */
    .extern data_020f4e14
    .extern GraphicsSpriteRenderer_GetObjectPaletteAddress
    .extern TitleDisplay_ConfigureMain2dEngine
    .extern TitleDisplay_ConfigureSub2dEngine
    .extern TitleDisplay_ResetSubBgScroll
    .extern TitleDisplay_SetSubBgPriorities
    .extern func_020afd0c

.global func_ov022_021fe3c0
func_ov022_021fe3c0:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    ldr r3, L_021fe484
    mov r4, r0
    ldrh r2, [r3, #0x0]
    mov r1, #0x1c
    mov r0, #0x0
    bic r2, r2, #0x8000
    strh r2, [r3, #0x0]
    str r1, [r4, #0x48]
    bl TitleDisplay_ConfigureMain2dEngine
    mov r1, #0x1c
    mov r0, #0x0
    str r1, [r4, #0x4c]
    bl TitleDisplay_ConfigureSub2dEngine
    ldr r1, L_021fe488
    ldrh r0, [r1, #0x0]
    and r0, r0, #0x43
    orr r0, r0, #0x1e00
    strh r0, [r1, #0x0]
    ldrh r0, [r1, #0x2]
    and r0, r0, #0x43
    orr r0, r0, #0x1e00
    strh r0, [r1, #0x2]
    bl TitleDisplay_ResetSubBgScroll
    mov r0, #0x0
    mov r1, #0x1
    mov r2, #0x2
    mov r3, #0x3
    bl TitleDisplay_SetSubBgPriorities
    ldr r0, L_021fe48c
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_GetObjectPaletteAddress
    ldrh r1, [r0, #0x16]
    ldr ip, L_021fe490
    mov r3, #0x8
    strh r1, [r0, #0x6]
    ldrh lr, [r0, #0x1e]
    mov r1, #0x4
    mov r2, #0x18
    strh lr, [r0, #0x8]
    strh ip, [r0, #0xa]
    ldrh ip, [r0, #0x1e]
    strh ip, [r0, #0xc]
    str r3, [sp, #0x0]
    ldr r0, L_021fe494
    bl func_020afd0c
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
L_021fe484: .word 0x4000304
L_021fe488: .word 0x400100c
L_021fe48c: .word data_020f4e14
L_021fe490: .word 0x4210
L_021fe494: .word 0x4001050
.size func_ov022_021fe3c0, . - func_ov022_021fe3c0
