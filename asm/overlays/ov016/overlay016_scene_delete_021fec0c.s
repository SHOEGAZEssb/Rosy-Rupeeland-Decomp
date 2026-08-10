    .text
    .extern Heap_Free
    .extern data_020f4e14
    .extern data_ov016_02201540
    .extern func_02071eb8
    .extern GraphicsSpriteGroup_Destroy
    .extern GraphicsSpriteRenderer_QueuePaletteUploads
    .extern func_020926f8
    .extern func_020927b8
    .extern func_ov000_021fb848
    .extern func_ov016_021fd06c
    .extern func_ov016_021fd97c
    .extern func_ov016_021fe0d4
    .extern func_ov016_021fe24c
    .extern gDebugFont

/* Exact fallback for scene deleting destruction; see src/overlays/ov016/overlay016_scene_destroy.c. */
    .global func_ov016_021fec0c

func_ov016_021fec0c:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, L_021fed6c
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0x20]
    bic r0, r0, #0x400
    str r0, [r4, #0x20]
    ldr r5, [r4, #0x470]
    cmp r5, #0x0
    beq L_021fec44
    mov r0, r5
    bl func_ov016_021fe24c
    mov r0, r5
    bl Heap_Free
L_021fec44:
    ldr r5, [r4, #0x450]
    cmp r5, #0x0
    beq L_021fec60
    mov r0, r5
    bl func_ov000_021fb848 ; func_ov006_021fb848
    mov r0, r5
    bl Heap_Free
L_021fec60:
    ldr r0, [r4, #0x44c]
    cmp r0, #0x0
    beq L_021fec78
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021fec78:
    ldr r5, [r4, #0x448]
    cmp r5, #0x0
    beq L_021fec94
    mov r0, r5
    bl func_ov016_021fd97c
    mov r0, r5
    bl Heap_Free
L_021fec94:
    ldr r5, [r4, #0x444]
    cmp r5, #0x0
    beq L_021fecb0
    mov r0, r5
    bl func_ov016_021fd06c
    mov r0, r5
    bl Heap_Free
L_021fecb0:
    ldr r0, [r4, #0x460]
    cmp r0, #0x0
    beq L_021fecc8
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021fecc8:
    ldr r0, [r4, #0x464]
    cmp r0, #0x0
    beq L_021fece0
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021fece0:
    ldr r0, [r4, #0xe0]
    bl GraphicsSpriteGroup_Destroy
    ldr r0, L_021fed70
    mov r2, #0x0
    strh r2, [r0, #0x0]
    add r1, r0, #0x1000
    ldr r0, L_021fed74
    strh r2, [r1, #0x0]
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_QueuePaletteUploads
    ldr r0, L_021fed78
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_QueuePaletteUploads
    add r0, r4, #0x398
    bl func_ov016_021fe0d4
    add r0, r4, #0x2ec
    bl func_ov016_021fe0d4
    add r0, r4, #0x240
    bl func_ov016_021fe0d4
    add r0, r4, #0x194
    bl func_ov016_021fe0d4
    add r0, r4, #0xe8
    bl func_ov016_021fe0d4
    add r0, r4, #0xd4
    bl func_02071eb8
    add r0, r4, #0xc8
    bl func_02071eb8
    add r0, r4, #0x84
    bl func_020926f8
    add r0, r4, #0x60
    bl func_020927b8
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
L_021fed6c: .word data_ov016_02201540
L_021fed70: .word 0x4000050
L_021fed74: .word data_020f4e14
L_021fed78: .word gDebugFont

    .size func_ov016_021fec0c, . - func_ov016_021fec0c
