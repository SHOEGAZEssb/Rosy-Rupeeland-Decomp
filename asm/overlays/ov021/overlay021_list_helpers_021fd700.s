    .text
/* Exact fallback; see src/overlays/ov021/overlay021_list_helpers.c. */
    .extern Overlay021_List_CreateRowSprite
    .extern Overlay021_List_DestroyRowSprite
    .extern Overlay021_List_RenderVisibleRows
    .extern Overlay021_List_UpdateSelectionDisplay

.global Overlay021_List_UpdateVisibleRows
Overlay021_List_UpdateVisibleRows:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r2, [r4, #0x58]
    ldr r0, [r2, #0x2c]
    ldr r1, [r2, #0x30]
    add r0, r0, r0, lsr #0x1f
    cmp r1, r0, asr #0x1
    bne L_021fd788
    ldr r3, [r2, #0xc]
    ldr r0, [r2, #0x10]
    cmp r3, r0
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    beq L_021fd778
    mov r0, #0x18
    mul r1, r3, r0
    ldr r0, [r4, #0x1c]
    rsb r1, r1, #0x1c
    str r1, [r0, #0x1c]
    ldr r1, [r4, #0x58]
    mov r0, r4
    ldr r1, [r1, #0x74]
    bl Overlay021_List_DestroyRowSprite
    ldr r1, [r4, #0x58]
    mov r0, r4
    ldr r1, [r1, #0x70]
    bl Overlay021_List_CreateRowSprite
    mov r0, r4
    bl Overlay021_List_RenderVisibleRows
L_021fd778:
    mov r0, r4
    bl Overlay021_List_UpdateSelectionDisplay
    mov r0, #0x1
    ldmia sp!, {r4, pc}
L_021fd788:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
    .size Overlay021_List_UpdateVisibleRows, . - Overlay021_List_UpdateVisibleRows

