    .text
/* Exact fallback; see src/overlays/ov018/overlay018_scene_finalize.c. */
    .extern data_020f4e14
    .extern data_021052fc
    .extern data_ov018_021ffc08
    .extern data_ov018_021ffc30
    .extern DisplayBrightness_IsMainTransitionComplete
    .extern func_02003e38
    .extern GamePhaseCurrencyHud_SetVisible
    .extern func_020755bc
    .extern func_020b1ccc
    .extern func_020b1ff0
    .extern func_ov003_021fb804
    .extern func_ov018_021fcf40
    .extern func_ov018_021fd788
    .extern func_ov018_021fd90c
    .extern func_ov018_021fdb7c
    .extern gDebugFont
    .extern gLupyContext

.global func_ov018_021fe6f0
func_ov018_021fe6f0:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    beq L_021fe710
    cmp r0, #0x1
    beq L_021fe7b0
    b L_021fe82c
L_021fe710:
    ldr r0, L_021fe83c
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl GamePhaseCurrencyHud_SetVisible
    ldr r0, L_021fe840
    ldr r0, [r0, #0x0]
    bl func_020755bc
    ldr r0, L_021fe844
    ldr r0, [r0, #0x0]
    bl func_020755bc
    ldr r0, L_021fe848
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r2, [r0, #0xf6c]
    orr r2, r2, #0x2
    str r2, [r0, #0xf6c]
    ldr r0, [r4, #0x190]
    bl func_ov003_021fb804
    mov r1, #0x0
    mov r5, r0
    mov r2, #0x600
    bl func_020b1ccc
    ldr r0, [r4, #0x190]
    mov r1, #0x20
    add r0, r0, #0x4
    mov r2, r1
    bl func_020b1ff0
    mov r0, r5
    bl func_02003e38
    ldr r1, [r4, #0x20]
    mov r0, #0x0
    bic r1, r1, #0x1
    orr r1, r1, #0x1
    str r1, [r4, #0x20]
    ldr r1, [r4, #0x4]
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021fe82c
L_021fe7b0:
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq L_021fe82c
    ldr r3, [r4, #0xd0]
    ldrh r1, [r3, #0x24]
    and r0, r1, #0x1
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    beq L_021fe82c
    orr r0, r1, #0x2
    strh r0, [r3, #0x24]
    ldrh r2, [r3, #0x24]
    mov r0, r4
    mov r1, #0x0
    bic r2, r2, #0x1
    strh r2, [r3, #0x24]
    bl func_ov018_021fdb7c
    ldr r0, [r4, #0x54]
    cmp r0, #0x1
    bne L_021fe81c
    mov r0, r4
    bl func_ov018_021fd90c
    ldr r1, L_021fe84c
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov018_021fcf40
    b L_021fe82c
L_021fe81c:
    ldr r1, L_021fe850
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov018_021fcf40
L_021fe82c:
    mov r0, r4
    bl func_ov018_021fd788
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
L_021fe83c: .word gLupyContext
L_021fe840: .word data_020f4e14
L_021fe844: .word gDebugFont
L_021fe848: .word data_021052fc
L_021fe84c: .word data_ov018_021ffc30
L_021fe850: .word data_ov018_021ffc08
    .size func_ov018_021fe6f0, . - func_ov018_021fe6f0
