.text
; Matching fallback for the portable implementation in src/overlays/ov090/overlay090_recovery.c.
.extern Heap_Alloc
.extern data_ov090_0221ccc8
.extern data_ov090_0221ccd0
.extern DisplayController_GetVerticalOffset
.extern UtilAnimationResource_Init
.extern GraphicsSpriteState_SetAnimationIndex
.extern func_ov090_0221b97c
.extern gHeapContext

.global func_ov090_0221c468
func_ov090_0221c468:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x18
    ldr r5, .L_0221c5e0
    mov r10, r0
    ldr r4, [sp, #0x40]
    str r5, [r10, #0x0]
    strh r4, [r10, #0xc]
    ldr r0, [sp, #0x44]
    mov r9, r1
    strh r0, [r10, #0xe]
    ldrh r0, [r10, #0x10]
    mov r8, r3
    str r2, [sp, #0x14]
    bic r0, r0, #0x2
    strh r0, [r10, #0x10]
    ldrh r0, [r10, #0x10]
    ldr r1, .L_0221c5e4
    ldr r3, .L_0221c5e8
    bic r0, r0, #0xff00
    strh r0, [r10, #0x10]
    mov r4, #0x0
    mov r0, #0x20
    mov r2, #0x4
    strh r4, [r10, #0x12]
    ldr r7, [sp, #0x48]
    bl Heap_Alloc
    movs r11, r0
    beq .L_0221c514
    ldr r4, [r8, #0xc]
    ldr r5, [r8, #0x8]
    ldr r6, [r8, #0x4]
    bl DisplayController_GetVerticalOffset
    mov r1, #0x2
    stmia sp, {r1, r6}
    str r5, [sp, #0x8]
    str r4, [sp, #0xc]
    str r0, [sp, #0x10]
    ldr r3, [sp, #0x14]
    mov r0, r11
    mov r2, r9
    mov r1, #0x0
    bl UtilAnimationResource_Init
    mov r11, r0
.L_0221c514:
    mov r0, r11
    mov r1, #0x4
    str r11, [r10, #0x4]
    bl func_ov090_0221b97c
    cmp r7, #0x0
    ble .L_0221c5c0
    ldr r1, .L_0221c5e4
    ldr r3, .L_0221c5e8
    mov r0, #0x20
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_0221c584
    ldr r5, [r8, #0xc]
    ldr r6, [r8, #0x8]
    ldr r8, [r8, #0x4]
    bl DisplayController_GetVerticalOffset
    mov r1, #0x2
    stmia sp, {r1, r8}
    str r6, [sp, #0x8]
    str r5, [sp, #0xc]
    str r0, [sp, #0x10]
    ldr r3, [sp, #0x14]
    mov r0, r4
    mov r2, r9
    mov r1, #0x0
    bl UtilAnimationResource_Init
    mov r4, r0
.L_0221c584:
    str r4, [r10, #0x8]
    ldr r0, [r4, #0x4]
    and r1, r7, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r0, [r4, #0x8]
    and r1, r7, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
    ldrh r1, [r10, #0x10]
    mov r0, r7, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0xfc
    mov r0, r0, lsl #0x1a
    orr r0, r1, r0, lsr #0x18
    strh r0, [r10, #0x10]
    b .L_0221c5d4
.L_0221c5c0:
    mov r0, #0x0
    str r0, [r10, #0x8]
    ldrh r0, [r10, #0x10]
    bic r0, r0, #0xfc
    strh r0, [r10, #0x10]
.L_0221c5d4:
    mov r0, r10
    add sp, sp, #0x18
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0221c5e0: .word data_ov090_0221ccc8
.L_0221c5e4: .word data_ov090_0221ccd0
.L_0221c5e8: .word gHeapContext
.size func_ov090_0221c468, . - func_ov090_0221c468
