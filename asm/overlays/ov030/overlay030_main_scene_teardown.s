.text

/* Exact fallback; see src/overlays/ov030/overlay030_main_scene_teardown.c for documented portable C. */
.extern data_020f4e14
.extern data_020f4e18
.extern data_ov030_021ff8b0
.extern func_02071c38
.extern func_02071eb8
.extern func_0207419c
.extern GraphicsSpriteRenderer_QueuePaletteUploads
.extern func_02075a88
.extern func_020927b8
.extern func_ov030_021fcf18
.extern func_ov030_021fd27c
.extern func_ov045_0220b8cc
.extern func_ov045_0220d2d8
.extern gDebugFont
.extern Heap_Free


    .global func_ov030_021fdf78
func_ov030_021fdf78:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, L_021fe0b0
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0x20]
    mvn r1, #0x0
    bic r0, r0, #0x400
    str r0, [r4, #0x20]
    ldr r0, [r4, #0x35c]
    cmp r0, r1
    beq L_021fdfa8
    bl func_ov045_0220d2d8
L_021fdfa8:
    ldr r0, [r4, #0x78]
    bl func_0207419c
    ldr r5, [r4, #0x2c8]
    cmp r5, #0x0
    beq L_021fdfcc
    mov r0, r5
    bl func_ov045_0220b8cc
    mov r0, r5
    bl Heap_Free
L_021fdfcc:
    ldr r5, [r4, #0x2c4]
    cmp r5, #0x0
    beq L_021fdfe8
    mov r0, r5
    bl func_ov030_021fd27c
    mov r0, r5
    bl Heap_Free
L_021fdfe8:
    ldr r0, [r4, #0x2c0]
    cmp r0, #0x0
    beq L_021fe000
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021fe000:
    ldr r0, [r4, #0x2bc]
    cmp r0, #0x0
    beq L_021fe018
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021fe018:
    ldr r0, L_021fe0b4
    ldr r1, [r4, #0x360]
    ldr r0, [r0, #0x0]
    bl func_02071c38
    ldr r0, L_021fe0b8
    mov r1, #0x0
    strh r1, [r0, #0x0]
    add r0, r0, #0x1000
    strh r1, [r0, #0x0]
    mov r3, #0x4000000
    ldr r2, [r3, #0x0]
    ldr r0, L_021fe0bc
    bic r2, r2, #0xe000
    str r2, [r3, #0x0]
    ldr r0, [r0, #0x0]
    bl func_02075a88
    ldr r0, L_021fe0bc
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_QueuePaletteUploads
    ldr r0, L_021fe0c0
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_QueuePaletteUploads
    add r0, r4, #0x210
    bl func_ov030_021fcf18
    add r0, r4, #0x164
    bl func_ov030_021fcf18
    add r0, r4, #0xb8
    bl func_ov030_021fcf18
    add r0, r4, #0x94
    bl func_02071eb8
    add r0, r4, #0x88
    bl func_02071eb8
    add r0, r4, #0x7c
    bl func_02071eb8
    add r0, r4, #0x54
    bl func_020927b8
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
L_021fe0b0: .word data_ov030_021ff8b0
L_021fe0b4: .word data_020f4e18
L_021fe0b8: .word 0x4000050
L_021fe0bc: .word data_020f4e14
L_021fe0c0: .word gDebugFont
.size func_ov030_021fdf78, .-func_ov030_021fdf78
    .global func_ov030_021fe0c4
func_ov030_021fe0c4:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, L_021fe204
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0x20]
    mvn r1, #0x0
    bic r0, r0, #0x400
    str r0, [r4, #0x20]
    ldr r0, [r4, #0x35c]
    cmp r0, r1
    beq L_021fe0f4
    bl func_ov045_0220d2d8
L_021fe0f4:
    ldr r0, [r4, #0x78]
    bl func_0207419c
    ldr r5, [r4, #0x2c8]
    cmp r5, #0x0
    beq L_021fe118
    mov r0, r5
    bl func_ov045_0220b8cc
    mov r0, r5
    bl Heap_Free
L_021fe118:
    ldr r5, [r4, #0x2c4]
    cmp r5, #0x0
    beq L_021fe134
    mov r0, r5
    bl func_ov030_021fd27c
    mov r0, r5
    bl Heap_Free
L_021fe134:
    ldr r0, [r4, #0x2c0]
    cmp r0, #0x0
    beq L_021fe14c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021fe14c:
    ldr r0, [r4, #0x2bc]
    cmp r0, #0x0
    beq L_021fe164
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021fe164:
    ldr r0, L_021fe208
    ldr r1, [r4, #0x360]
    ldr r0, [r0, #0x0]
    bl func_02071c38
    ldr r0, L_021fe20c
    mov r1, #0x0
    strh r1, [r0, #0x0]
    add r0, r0, #0x1000
    strh r1, [r0, #0x0]
    mov r3, #0x4000000
    ldr r2, [r3, #0x0]
    ldr r0, L_021fe210
    bic r2, r2, #0xe000
    str r2, [r3, #0x0]
    ldr r0, [r0, #0x0]
    bl func_02075a88
    ldr r0, L_021fe210
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_QueuePaletteUploads
    ldr r0, L_021fe214
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_QueuePaletteUploads
    add r0, r4, #0x210
    bl func_ov030_021fcf18
    add r0, r4, #0x164
    bl func_ov030_021fcf18
    add r0, r4, #0xb8
    bl func_ov030_021fcf18
    add r0, r4, #0x94
    bl func_02071eb8
    add r0, r4, #0x88
    bl func_02071eb8
    add r0, r4, #0x7c
    bl func_02071eb8
    add r0, r4, #0x54
    bl func_020927b8
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
L_021fe204: .word data_ov030_021ff8b0
L_021fe208: .word data_020f4e18
L_021fe20c: .word 0x4000050
L_021fe210: .word data_020f4e14
L_021fe214: .word gDebugFont
.size func_ov030_021fe0c4, .-func_ov030_021fe0c4
