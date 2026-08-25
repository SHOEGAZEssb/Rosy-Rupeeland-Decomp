    .text
    .extern Heap_Free
    .extern data_020f4e14
    .extern data_ov014_021fd994
    .extern GraphicsSpriteRenderer_QueuePaletteUploads
    .extern TitleCharacterResourceCollection_Destroy
    .extern func_ov000_021fb848
    .extern gDebugFont

/* Exact fallback; see the documented portable reconstruction in
 * src/overlays/ov014/overlay014_scene_lifecycle.c. */
    .global Overlay014_Scene_Delete

Overlay014_Scene_Delete:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, L_021fd070
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0x20]
    bic r0, r0, #0x400
    str r0, [r4, #0x20]
    ldr r5, [r4, #0x88]
    cmp r5, #0x0
    beq L_021fd028
    mov r0, r5
    bl func_ov000_021fb848 ; func_ov006_021fb848
    mov r0, r5
    bl Heap_Free
L_021fd028:
    ldr r0, [r4, #0x78]
    cmp r0, #0x0
    beq L_021fd040
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021fd040:
    ldr r0, L_021fd074
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_QueuePaletteUploads
    ldr r0, L_021fd078
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_QueuePaletteUploads
    add r0, r4, #0x54
    bl TitleCharacterResourceCollection_Destroy
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
L_021fd070: .word data_ov014_021fd994
L_021fd074: .word data_020f4e14
L_021fd078: .word gDebugFont
    .size Overlay014_Scene_Delete, . - Overlay014_Scene_Delete
