    .text
/* Exact fallback; see src/overlays/ov021/overlay021_list_helpers.c. */
    .extern Overlay021_List_CreateRowSprite

.global Overlay021List_SyncFirstVisibleRow
Overlay021List_SyncFirstVisibleRow:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r1, [r4, #0x58]
    mov r0, #0x18
    ldr r2, [r1, #0xc]
    ldr r1, [r4, #0x1c]
    mul r0, r2, r0
    rsb r0, r0, #0x1c
    str r0, [r1, #0x1c]
    ldr r0, [r4, #0x58]
    ldr r5, [r0, #0xc]
    b L_021fd294
L_021fd284:
    mov r0, r4
    mov r1, r5
    bl Overlay021_List_CreateRowSprite
    add r5, r5, #0x1
L_021fd294:
    ldr r0, [r4, #0x58]
    ldr r1, [r0, #0xc]
    ldr r0, [r0, #0x8]
    add r0, r1, r0
    sub r0, r0, #0x1
    cmp r5, r0
    ble L_021fd284
    ldmia sp!, {r3, r4, r5, pc}
    .size Overlay021List_SyncFirstVisibleRow, . - Overlay021List_SyncFirstVisibleRow

