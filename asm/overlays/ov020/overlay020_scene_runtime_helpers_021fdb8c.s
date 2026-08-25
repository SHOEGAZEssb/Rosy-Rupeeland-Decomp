    .text
/* Exact fallback; see src/overlays/ov020/overlay020_scene_runtime_helpers.c. */
    .extern Heap_Free
    .extern data_ov020_021fe504
    .extern AnimationResourceState_Destroy
    .extern GraphicsSpriteGroup_Destroy
    .extern TitleCharacterResourceCollection_Destroy
    .extern func_ov020_021fcfd4
    .extern func_ov020_021fd404
    .extern func_ov020_021fd818

.global func_ov020_021fdb8c
func_ov020_021fdb8c:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, L_021fdc10
    mov r5, r0
    str r1, [r5, #0x0]
    ldr r0, [r5, #0x20]
    bic r0, r0, #0x400
    str r0, [r5, #0x20]
    ldr r0, [r5, #0x6c]
    bl GraphicsSpriteGroup_Destroy
    ldr r4, [r5, #0x1e0]
    cmp r4, #0x0
    beq L_021fdbcc
    mov r0, r4
    bl func_ov020_021fd404
    mov r0, r4
    bl Heap_Free
L_021fdbcc:
    ldr r4, [r5, #0x1dc]
    cmp r4, #0x0
    beq L_021fdbe8
    mov r0, r4
    bl func_ov020_021fcfd4
    mov r0, r4
    bl Heap_Free
L_021fdbe8:
    add r0, r5, #0x1b8
    bl TitleCharacterResourceCollection_Destroy
    add r0, r5, #0x70
    bl func_ov020_021fd818
    add r0, r5, #0x60
    bl AnimationResourceState_Destroy
    add r0, r5, #0x54
    bl AnimationResourceState_Destroy
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
L_021fdc10: .word data_ov020_021fe504
    .size func_ov020_021fdb8c, . - func_ov020_021fdb8c

