    .text
    .extern Heap_Free
    .extern data_020f4e14
    .extern data_ov016_02201540
    .extern AnimationResourceState_Destroy
    .extern GraphicsSpriteGroup_Destroy
    .extern GraphicsSpriteRenderer_QueuePaletteUploads
    .extern TitleScreenResourceCollection_Destroy
    .extern TitleCharacterResourceCollection_Destroy
    .extern func_ov000_021fb848
    .extern Overlay016_List_Destroy
    .extern Overlay016_Panel_Destroy
    .extern Overlay016_SpriteWrapper_NoOp
    .extern Overlay016_ActorGroup_Destroy
    .extern gDebugFont

/* Exact fallback for scene destruction; see src/overlays/ov016/overlay016_scene_destroy.c. */
    .global Overlay016_Scene_Destroy

Overlay016_Scene_Destroy:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, L_021febfc
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0x20]
    bic r0, r0, #0x400
    str r0, [r4, #0x20]
    ldr r5, [r4, #0x470]
    cmp r5, #0x0
    beq L_021feadc
    mov r0, r5
    bl Overlay016_ActorGroup_Destroy
    mov r0, r5
    bl Heap_Free
L_021feadc:
    ldr r5, [r4, #0x450]
    cmp r5, #0x0
    beq L_021feaf8
    mov r0, r5
    bl func_ov000_021fb848 ; func_ov006_021fb848
    mov r0, r5
    bl Heap_Free
L_021feaf8:
    ldr r0, [r4, #0x44c]
    cmp r0, #0x0
    beq L_021feb10
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021feb10:
    ldr r5, [r4, #0x448]
    cmp r5, #0x0
    beq L_021feb2c
    mov r0, r5
    bl Overlay016_Panel_Destroy
    mov r0, r5
    bl Heap_Free
L_021feb2c:
    ldr r5, [r4, #0x444]
    cmp r5, #0x0
    beq L_021feb48
    mov r0, r5
    bl Overlay016_List_Destroy
    mov r0, r5
    bl Heap_Free
L_021feb48:
    ldr r0, [r4, #0x460]
    cmp r0, #0x0
    beq L_021feb60
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021feb60:
    ldr r0, [r4, #0x464]
    cmp r0, #0x0
    beq L_021feb78
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021feb78:
    ldr r0, [r4, #0xe0]
    bl GraphicsSpriteGroup_Destroy
    ldr r0, L_021fec00
    mov r2, #0x0
    strh r2, [r0, #0x0]
    add r1, r0, #0x1000
    ldr r0, L_021fec04
    strh r2, [r1, #0x0]
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_QueuePaletteUploads
    ldr r0, L_021fec08
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_QueuePaletteUploads
    add r0, r4, #0x398
    bl Overlay016_SpriteWrapper_NoOp
    add r0, r4, #0x2ec
    bl Overlay016_SpriteWrapper_NoOp
    add r0, r4, #0x240
    bl Overlay016_SpriteWrapper_NoOp
    add r0, r4, #0x194
    bl Overlay016_SpriteWrapper_NoOp
    add r0, r4, #0xe8
    bl Overlay016_SpriteWrapper_NoOp
    add r0, r4, #0xd4
    bl AnimationResourceState_Destroy
    add r0, r4, #0xc8
    bl AnimationResourceState_Destroy
    add r0, r4, #0x84
    bl TitleScreenResourceCollection_Destroy
    add r0, r4, #0x60
    bl TitleCharacterResourceCollection_Destroy
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
L_021febfc: .word data_ov016_02201540
L_021fec00: .word 0x4000050
L_021fec04: .word data_020f4e14
L_021fec08: .word gDebugFont

    .size Overlay016_Scene_Destroy, . - Overlay016_Scene_Destroy
