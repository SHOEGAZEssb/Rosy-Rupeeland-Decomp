    .text
/* Exact fallback; see src/overlays/ov020/overlay020_list_runtime.c. */
    .extern Overlay020_List_CreateRowSprite
    .extern Overlay020_List_DestroyRowSprite
    .extern Overlay020_List_RenderLabels

.global Overlay020_List_UpdateVisibleRows
Overlay020_List_UpdateVisibleRows:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r2, [r4, #0x44]
    ldr r0, [r2, #0x2c]
    ldr r1, [r2, #0x30]
    add r0, r0, r0, lsr #0x1f
    cmp r1, r0, asr #0x1
    bne L_021fd300
    ldr r3, [r2, #0xc]
    ldr r0, [r2, #0x10]
    cmp r3, r0
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    beq L_021fd2f8
    mov r0, #0x18
    mul r1, r3, r0
    ldr r0, [r4, #0x4]
    rsb r1, r1, #0x1c
    str r1, [r0, #0x1c]
    ldr r1, [r4, #0x44]
    mov r0, r4
    ldr r1, [r1, #0x74]
    bl Overlay020_List_DestroyRowSprite
    ldr r1, [r4, #0x44]
    mov r0, r4
    ldr r1, [r1, #0x70]
    bl Overlay020_List_CreateRowSprite
    mov r0, r4
    bl Overlay020_List_RenderLabels
L_021fd2f8:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
L_021fd300:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
    .size Overlay020_List_UpdateVisibleRows, . - Overlay020_List_UpdateVisibleRows
