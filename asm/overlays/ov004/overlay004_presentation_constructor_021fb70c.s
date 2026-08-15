    .text
    .extern func_02091e28
    .extern data_ov004_021fcda0
    .extern func_02071ea4
    .extern Presentation_InitVariant
    .extern func_02091b6c
    .extern data_020f4e18
    .extern func_02071ee0
    .extern func_020708c4
    .extern data_020f4e14
    .extern GraphicsSpriteGroupOwner_CreateGroup
    .extern gDebugFont
    .extern func_ov004_021fbf40
    .extern func_02091bac
    .extern func_ov004_021fb968
    .extern func_ov004_021fba28
    .extern func_ov004_021fc24c
    .extern data_ov004_021fcd30
    .extern func_ov004_021fb6e4
    .global func_ov004_021fb70c
func_ov004_021fb70c: ; 0x021fb70c
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4
    mov r4, r0
    mov r6, r1
    mov r5, r2
    bl func_02091e28
    ldr r1, L_021fb848
    add r0, r4, #0x54
    str r1, [r4, #0x0]
    bl func_02071ea4
    add r0, r4, #0x6c
    bl Presentation_InitVariant
    add r0, r4, #0x114
    bl func_02091b6c
    add r0, r4, #0x130
    bl func_02091b6c
    str r6, [r4, #0x150]
    str r5, [r4, #0x14c]
    mov r0, #0x0
    str r0, [r4, #0x68]
    ldr r3, L_021fb84c
    add r0, r4, #0x54
    str r3, [sp, #0x0]
    ldr r1, L_021fb850
    sub r2, r3, #0x2
    ldr r1, [r1, #0x0]
    sub r3, r3, #0x1
    bl func_02071ee0
    ldr r0, [r4, #0x58]
    bl func_020708c4
    ldr r0, L_021fb854
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteGroupOwner_CreateGroup
    str r0, [r4, #0x60]
    ldr r0, L_021fb858
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteGroupOwner_CreateGroup
    str r0, [r4, #0x64]
    mov r0, r4
    bl func_ov004_021fbf40
    mov r1, #0x0
    add r0, r4, #0x100
    strh r1, [r0, #0x10]
    mov r0, #0x100
    str r0, [r4, #0x108]
    mov r0, #0xe0
    str r0, [r4, #0x10c]
    sub r0, r0, #0xe1
    str r0, [r4, #0x154]
    mov r0, #0xf0
    str r0, [sp, #0x0]
    add r0, r4, #0x114
    mov r1, #0x2
    mov r2, #0x6000
    ldr r3, L_021fb85c
    bl func_02091bac
    mov r0, #0x50
    str r0, [sp, #0x0]
    add r0, r4, #0x130
    mov r1, #0x4
    mov r2, #0x4000
    ldr r3, L_021fb860
    bl func_02091bac
    mov r0, r4
    bl func_ov004_021fb968
    mov r0, r4
    bl func_ov004_021fba28
    mov r0, r4
    bl func_ov004_021fc24c
    ldr r1, [r4, #0x20]
    mov r0, r4
    orr r1, r1, #0x400
    str r1, [r4, #0x20]
    ldr r1, L_021fb864
    ldmia r1, {r1, r2}
    bl func_ov004_021fb6e4
    mov r0, r4
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
L_021fb848: .word data_ov004_021fcda0
L_021fb84c: .word 0x23b3
L_021fb850: .word data_020f4e18
L_021fb854: .word data_020f4e14
L_021fb858: .word gDebugFont
L_021fb85c: .word 0x119a
L_021fb860: .word 0x466
L_021fb864: .word data_ov004_021fcd30
    .size func_ov004_021fb70c, .-func_ov004_021fb70c

