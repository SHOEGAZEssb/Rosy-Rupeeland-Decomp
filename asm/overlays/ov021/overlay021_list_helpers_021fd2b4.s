    .text
/* Exact fallback; see src/overlays/ov021/overlay021_list_helpers.c. */
    .extern GraphicsSpriteState_ApplyRenderConfig
    .extern GraphicsSpriteGroup_CreateStateFromSource

.global func_ov021_021fd2b4
func_ov021_021fd2b4:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0xc
    mov r6, r0
    ldr r0, [r6, #0x54]
    cmp r1, r0
    bge L_021fd34c
    mov r0, #0xc
    mul r5, r1, r0
    ldr r0, [r6, #0x4c]
    ldr r4, [r0, r5]
    add r0, r0, r5
    cmp r4, #0x0
    beq L_021fd34c
    ldr r0, [r0, #0x4]
    cmp r0, #0x0
    bne L_021fd34c
    ldr r0, [r6, #0x1c]
    add r1, r6, #0x10
    mov r2, #0x1
    bl GraphicsSpriteGroup_CreateStateFromSource
    ldr r1, [r6, #0x4c]
    mov r2, #0x0
    add r1, r1, r5
    str r0, [r1, #0x4]
    ldr r1, [r4, #0x4]
    ldr r3, [r6, #0x4c]
    ldrh r1, [r1, #0x4]
    add r3, r3, r5
    str r2, [sp, #0x0]
    str r2, [sp, #0x4]
    mov r2, #0x2
    str r2, [sp, #0x8]
    ldrsh r2, [r3, #0x8]
    cmp r1, #0x2
    movge r1, #0x3
    ldrsh r3, [r3, #0xa]
    movlt r1, #0x1
    bl GraphicsSpriteState_ApplyRenderConfig
L_021fd34c:
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, r5, r6, pc}
    .size func_ov021_021fd2b4, . - func_ov021_021fd2b4

