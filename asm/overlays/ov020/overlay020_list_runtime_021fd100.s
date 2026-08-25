    .text
/* Exact fallback; see src/overlays/ov020/overlay020_list_runtime.c. */
    .extern GraphicsSpriteState_ApplyRenderConfig
    .extern GraphicsSpriteGroup_CreateStateFromSource

.global Overlay020_List_CreateRowSprite
Overlay020_List_CreateRowSprite:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0xc
    mov r6, r0
    ldr r0, [r6, #0x40]
    cmp r1, r0
    bge L_021fd17c
    mov r0, #0xc
    mul r5, r1, r0
    ldr r1, [r6, #0x38]
    add r0, r1, r5
    ldr r0, [r0, #0x4]
    ldr r4, [r1, r5]
    cmp r0, #0x0
    bne L_021fd17c
    ldr r0, [r6, #0x4]
    add r1, r6, #0x8
    mov r2, #0x1
    bl GraphicsSpriteGroup_CreateStateFromSource
    ldr r2, [r6, #0x38]
    mov r1, #0x0
    add r2, r2, r5
    str r0, [r2, #0x4]
    ldr r2, [r6, #0x38]
    str r1, [sp, #0x0]
    str r1, [sp, #0x4]
    str r1, [sp, #0x8]
    add r3, r2, r5
    ldrb r1, [r4, #0x12]
    ldrsh r2, [r3, #0x8]
    ldrsh r3, [r3, #0xa]
    bl GraphicsSpriteState_ApplyRenderConfig
L_021fd17c:
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, r5, r6, pc}
    .size Overlay020_List_CreateRowSprite, . - Overlay020_List_CreateRowSprite
