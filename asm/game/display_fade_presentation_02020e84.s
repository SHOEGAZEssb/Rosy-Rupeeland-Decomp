; Matching retail form; see src/game/display_fade_presentation.c.
.text
.extern GameWork_ClearFlag
.extern GameWork_TestFlag
.extern GraphicsResourceSet_Destroy
.extern GraphicsResourceSet_Init
.extern GraphicsResourceSet_Load
.extern data_020d63c0
.extern data_020d63d8
.extern data_020d6564
.extern data_020f4e18
.extern func_0201e250
.extern MainBg1_SetControl
.extern MainBg2_SetControl
.extern SubBg1_SetControl
.extern SubBg2_SetControl
.extern PairedReferenceState_SetReferencesAndReset
.extern func_02070638
.extern func_020706c4
.extern func_02070874
.extern func_02070e0c
.extern func_02070eac
.extern func_02091b6c
.extern func_02091b98
.extern func_02091bac
.extern func_02091c7c
.extern func_020929b0
.extern func_020929f4
.extern func_02092b0c
.extern func_02092b34
.extern func_02092b60
.extern func_02092b68
.extern func_020afd0c
.extern func_020b1ff0
.extern func_020b2058
.extern func_020b44e8
.extern gGameWork

.global DisplayFadePresentation_Init
    .type DisplayFadePresentation_Init, @function
DisplayFadePresentation_Init: ; 0x02020e84
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x10
    mov r6, r0
    mov r5, r1
    mov r4, r2
    mov r7, r3
    bl func_0201e250
    ldr r1, .L_020210f0
    add r0, r6, #0x14
    str r1, [r6, #0x0]
    bl func_02091b6c
    add r0, r6, #0x3c
    bl func_020929b0
    str r5, [r6, #0x30]
    str r7, [r6, #0x34]
    mov r0, #0x0
    str r0, [r6, #0x38]
    add r0, sp, #0x4
    bl GraphicsResourceSet_Init
    ldr r3, .L_020210f4
    ldr r1, .L_020210f8
    str r3, [sp, #0x0]
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    add r0, sp, #0x4
    sub r3, r3, #0x1
    bl GraphicsResourceSet_Load
    bl func_020b44e8
    cmp r5, #0x0
    mov r3, #0x0
    mov r1, #0x2
    bne .L_02020fd8
    ldr r0, .L_020210fc
    mov r2, #0x4
    str r3, [sp, #0x0]
    bl func_020afd0c
    mov r0, #0x0
    mov r5, #0x1
    mov r1, r0
    mov r3, r0
    mov r2, #0x1a
    str r5, [sp, #0x0]
    bl MainBg1_SetControl
    mov r0, #0x0
    mov r1, r0
    mov r3, r0
    mov r2, #0x1c
    bl MainBg2_SetControl
    ldr r3, .L_02021100
    mov r5, #0x4000000
    ldrh r0, [r3, #0x0]
    mov r1, #0x1
    mov r2, #0x0
    bic r0, r0, #0x3
    orr r0, r0, #0x1
    strh r0, [r3, #0x0]
    ldrh r0, [r3, #0x2]
    bic r0, r0, #0x3
    orr r0, r0, #0x2
    strh r0, [r3, #0x2]
    ldr r3, [r5, #0x0]
    ldr r0, [r5, #0x0]
    and r3, r3, #0x1f00
    mov ip, r3, lsr #0x8
    bic r3, r0, #0x1f00
    orr r0, ip, #0x6
    orr r0, r3, r0, lsl #0x8
    str r0, [r5, #0x0]
    ldr r0, [sp, #0x4]
    bl func_02070638
    ldr r0, [sp, #0xc]
    mov r1, #0x1
    mov r2, #0x0
    bl func_02070e0c
    ldr r0, [sp, #0xc]
    mov r1, #0x2
    mov r2, #0x0
    bl func_02070e0c
    ldr r0, [sp, #0x8]
    bl func_02070874
    add r0, r0, r4, lsl #0x5
    mov r1, #0x0
    mov r2, #0x20
    bl func_020b2058
    b .L_020210a8
.L_02020fd8:
    ldr r0, .L_02021104
    mov r2, #0x4
    str r3, [sp, #0x0]
    bl func_020afd0c
    mov r0, #0x0
    mov r5, #0x1
    mov r1, r0
    mov r3, r0
    mov r2, #0x1a
    str r5, [sp, #0x0]
    bl SubBg1_SetControl
    mov r0, #0x0
    mov r1, r0
    mov r3, r0
    mov r2, #0x1c
    bl SubBg2_SetControl
    ldr r3, .L_02021108
    mov r1, r5
    ldrh r0, [r3, #0x0]
    sub r5, r3, #0xa
    mov r2, #0x0
    bic r0, r0, #0x3
    orr r0, r0, #0x1
    strh r0, [r3, #0x0]
    ldrh r0, [r3, #0x2]
    bic r0, r0, #0x3
    orr r0, r0, #0x2
    strh r0, [r3, #0x2]
    ldr r3, [r5, #0x0]
    ldr r0, [r5, #0x0]
    and r3, r3, #0x1f00
    mov ip, r3, lsr #0x8
    bic r3, r0, #0x1f00
    orr r0, ip, #0x6
    orr r0, r3, r0, lsl #0x8
    str r0, [r5, #0x0]
    ldr r0, [sp, #0x4]
    bl func_020706c4
    ldr r0, [sp, #0xc]
    mov r1, #0x1
    mov r2, #0x0
    bl func_02070eac
    ldr r0, [sp, #0xc]
    mov r1, #0x2
    mov r2, #0x0
    bl func_02070eac
    ldr r0, [sp, #0x8]
    bl func_02070874
    add r0, r0, r4, lsl #0x5
    mov r1, #0x0
    mov r2, #0x20
    bl func_020b1ff0
.L_020210a8:
    ldr r1, [r6, #0x4]
    ldr r0, .L_0202110c
    orr r2, r1, #0x2
    bic r1, r2, #0x1
    orr r1, r1, #0x1
    str r1, [r6, #0x4]
    ldr r0, [r0, #0x0]
    ldr r1, .L_02021110
    bl GameWork_ClearFlag
    ldr r1, .L_02021114
    mov r0, r6
    ldmia r1, {r1, r2}
    bl PairedReferenceState_SetReferencesAndReset
    add r0, sp, #0x4
    bl GraphicsResourceSet_Destroy
    mov r0, r6
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_020210f0: .word data_020d6564
.L_020210f4: .word 0xc008
.L_020210f8: .word data_020f4e18
.L_020210fc: .word 0x4000050
.L_02021100: .word 0x400000a
.L_02021104: .word 0x4001050
.L_02021108: .word 0x400100a
.L_0202110c: .word gGameWork
.L_02021110: .word 0x3d3
.L_02021114: .word data_020d63c0
    .size DisplayFadePresentation_Init, .-DisplayFadePresentation_Init

