.text

/* Exact fallback; see src/overlays/ov028/overlay028_scene_teardown.c. */
.extern data_020f4e14
.extern data_ov028_021ff29c
.extern data_ov028_021ff2ac
.extern func_02071eb8
.extern GraphicsSpriteState_SetAnimationIndex
.extern GraphicsSpriteGroup_ReplaceStateResources
.extern GraphicsSpriteGroup_Destroy
.extern GraphicsSpriteRenderer_QueuePaletteUploads
.extern func_020927b8
.extern func_02095308
.extern func_ov028_021fd1a8
.extern func_ov028_021fd790
.extern func_ov028_021fda94
.extern Heap_Free


    .global func_ov028_021fdf94
func_ov028_021fdf94:
    ldr r2, [r1, #0x0]
    str r2, [r0, #0x0]
    ldr r1, [r1, #0x4]
    str r1, [r0, #0x4]
    bx lr
.size func_ov028_021fdf94, .-func_ov028_021fdf94
    .global func_ov028_021fdfa8
func_ov028_021fdfa8:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, L_021fe09c
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0x20]
    bic r0, r0, #0x400
    str r0, [r4, #0x20]
    ldr r1, [r4, #0x90]
    cmp r1, #0x0
    beq L_021fdff8
    ldr r0, [r4, #0x88]
    str r0, [sp, #0x0]
    ldr r0, [r1, #0x0]
    ldr r2, [r4, #0x80]
    ldr r3, [r4, #0x84]
    bl GraphicsSpriteGroup_ReplaceStateResources
    ldr r1, [r4, #0x94]
    ldr r0, [r4, #0x90]
    and r1, r1, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
L_021fdff8:
    ldr r5, [r4, #0x220]
    cmp r5, #0x0
    beq L_021fe014
    mov r0, r5
    bl func_ov028_021fd1a8
    mov r0, r5
    bl Heap_Free
L_021fe014:
    ldr r5, [r4, #0x224]
    cmp r5, #0x0
    beq L_021fe030
    mov r0, r5
    bl func_ov028_021fd790
    mov r0, r5
    bl Heap_Free
L_021fe030:
    add r0, r4, #0x264
    bl func_02095308
    ldr r0, [r4, #0x54]
    bl GraphicsSpriteGroup_Destroy
    ldr r0, [r4, #0x58]
    bl GraphicsSpriteGroup_Destroy
    ldr r0, L_021fe0a0
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_QueuePaletteUploads
    ldr r1, L_021fe0a4
    add r0, r4, #0x264
    str r1, [r4, #0x264]
    bl func_02095308
    add r0, r4, #0x1fc
    bl func_020927b8
    add r0, r4, #0x144
    bl func_ov028_021fda94
    add r0, r4, #0x98
    bl func_ov028_021fda94
    add r0, r4, #0x74
    bl func_02071eb8
    add r0, r4, #0x68
    bl func_02071eb8
    add r0, r4, #0x5c
    bl func_02071eb8
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
L_021fe09c: .word data_ov028_021ff2ac
L_021fe0a0: .word data_020f4e14
L_021fe0a4: .word data_ov028_021ff29c
.size func_ov028_021fdfa8, .-func_ov028_021fdfa8
    .global func_ov028_021fe0a8
func_ov028_021fe0a8:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, L_021fe1a4
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0x20]
    bic r0, r0, #0x400
    str r0, [r4, #0x20]
    ldr r1, [r4, #0x90]
    cmp r1, #0x0
    beq L_021fe0f8
    ldr r0, [r4, #0x88]
    str r0, [sp, #0x0]
    ldr r0, [r1, #0x0]
    ldr r2, [r4, #0x80]
    ldr r3, [r4, #0x84]
    bl GraphicsSpriteGroup_ReplaceStateResources
    ldr r1, [r4, #0x94]
    ldr r0, [r4, #0x90]
    and r1, r1, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
L_021fe0f8:
    ldr r5, [r4, #0x220]
    cmp r5, #0x0
    beq L_021fe114
    mov r0, r5
    bl func_ov028_021fd1a8
    mov r0, r5
    bl Heap_Free
L_021fe114:
    ldr r5, [r4, #0x224]
    cmp r5, #0x0
    beq L_021fe130
    mov r0, r5
    bl func_ov028_021fd790
    mov r0, r5
    bl Heap_Free
L_021fe130:
    add r0, r4, #0x264
    bl func_02095308
    ldr r0, [r4, #0x54]
    bl GraphicsSpriteGroup_Destroy
    ldr r0, [r4, #0x58]
    bl GraphicsSpriteGroup_Destroy
    ldr r0, L_021fe1a8
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_QueuePaletteUploads
    ldr r1, L_021fe1ac
    add r0, r4, #0x264
    str r1, [r4, #0x264]
    bl func_02095308
    add r0, r4, #0x1fc
    bl func_020927b8
    add r0, r4, #0x144
    bl func_ov028_021fda94
    add r0, r4, #0x98
    bl func_ov028_021fda94
    add r0, r4, #0x74
    bl func_02071eb8
    add r0, r4, #0x68
    bl func_02071eb8
    add r0, r4, #0x5c
    bl func_02071eb8
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
L_021fe1a4: .word data_ov028_021ff2ac
L_021fe1a8: .word data_020f4e14
L_021fe1ac: .word data_ov028_021ff29c
.size func_ov028_021fe0a8, .-func_ov028_021fe0a8
