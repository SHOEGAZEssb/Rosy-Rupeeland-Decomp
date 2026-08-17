    .text
/* Exact fallback; see src/overlays/ov018/overlay018_scene_lifecycle.c (teardown functions). */
    .extern GameWork_ClearFlag
    .extern Heap_Free
    .extern data_ov018_021ffcf0
    .extern data_ov018_021ffd00
    .extern data_ov018_021ffd3c
    .extern AnimationResourceState_Destroy
    .extern GraphicsSpriteGroup_Destroy
    .extern GraphicsSpriteRenderer_ConfigureTextGridPriority
    .extern func_020927b8
    .extern PresentationList_DeleteAll
    .extern func_ov001_021fb7d4
    .extern func_ov018_021fcefc
    .extern func_ov018_021fdbd4
    .extern func_ov018_021fe5ac
    .extern gDebugFont
    .extern gGameWork
.global func_ov018_021fd36c
func_ov018_021fd36c:
    ldr r2, L_021fd384
    mov r1, #0x0
    str r2, [r0, #0x0]
    str r1, [r0, #0x4]
    str r1, [r0, #0x8]
    bx lr
L_021fd384: .word data_ov018_021ffcf0
    .size func_ov018_021fd36c, . - func_ov018_021fd36c

    .global func_ov018_021fd388
func_ov018_021fd388:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, L_021fd490
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r2, [r4, #0x20]
    ldr r1, L_021fd494
    bic r2, r2, #0x400
    str r2, [r4, #0x20]
    mov r2, #0x0
    strh r2, [r1, #0x0]
    bl func_ov018_021fdbd4
    ldr r0, [r4, #0x418]
    cmp r0, #0x0
    beq L_021fd3cc
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021fd3cc:
    add r0, r4, #0x3cc
    bl PresentationList_DeleteAll
    ldr r0, [r4, #0xc4]
    bl GraphicsSpriteGroup_Destroy
    ldr r0, [r4, #0xcc]
    bl GraphicsSpriteGroup_Destroy
    ldr r0, [r4, #0xc8]
    bl GraphicsSpriteGroup_Destroy
    ldr r0, L_021fd498
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mov r2, #0x10
    bl GraphicsSpriteRenderer_ConfigureTextGridPriority
    ldr r0, [r4, #0x184]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x54]
    blx r2
    ldr r5, [r4, #0x190]
    cmp r5, #0x0
    beq L_021fd430
    mov r0, r5
    bl func_ov001_021fb7d4 ; func_ov003_021fb7d4
    mov r0, r5
    bl Heap_Free
L_021fd430:
    mov r0, r4
    bl func_ov018_021fe5ac
    ldr r0, L_021fd49c
    ldr r1, L_021fd4a0
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    ldr r1, L_021fd4a4
    add r0, r4, #0x3cc
    str r1, [r4, #0x3cc]
    bl PresentationList_DeleteAll
    add r0, r4, #0xd8
    bl func_ov018_021fcefc
    add r0, r4, #0xb8
    bl AnimationResourceState_Destroy
    add r0, r4, #0xac
    bl AnimationResourceState_Destroy
    add r0, r4, #0xa0
    bl AnimationResourceState_Destroy
    add r0, r4, #0x94
    bl AnimationResourceState_Destroy
    add r0, r4, #0x70
    bl func_020927b8
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
L_021fd490: .word data_ov018_021ffd3c
L_021fd494: .word 0x4001050
L_021fd498: .word gDebugFont
L_021fd49c: .word gGameWork
L_021fd4a0: .word 0x418
L_021fd4a4: .word data_ov018_021ffd00
    .size func_ov018_021fd388, . - func_ov018_021fd388

    .global func_ov018_021fd4a8
func_ov018_021fd4a8:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, L_021fd5b8
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r2, [r4, #0x20]
    ldr r1, L_021fd5bc
    bic r2, r2, #0x400
    str r2, [r4, #0x20]
    mov r2, #0x0
    strh r2, [r1, #0x0]
    bl func_ov018_021fdbd4
    ldr r0, [r4, #0x418]
    cmp r0, #0x0
    beq L_021fd4ec
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021fd4ec:
    add r0, r4, #0x3cc
    bl PresentationList_DeleteAll
    ldr r0, [r4, #0xc4]
    bl GraphicsSpriteGroup_Destroy
    ldr r0, [r4, #0xcc]
    bl GraphicsSpriteGroup_Destroy
    ldr r0, [r4, #0xc8]
    bl GraphicsSpriteGroup_Destroy
    ldr r0, L_021fd5c0
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mov r2, #0x10
    bl GraphicsSpriteRenderer_ConfigureTextGridPriority
    ldr r0, [r4, #0x184]
    mov r1, #0x1
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x54]
    blx r2
    ldr r5, [r4, #0x190]
    cmp r5, #0x0
    beq L_021fd550
    mov r0, r5
    bl func_ov001_021fb7d4 ; func_ov003_021fb7d4
    mov r0, r5
    bl Heap_Free
L_021fd550:
    mov r0, r4
    bl func_ov018_021fe5ac
    ldr r0, L_021fd5c4
    ldr r1, L_021fd5c8
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    ldr r1, L_021fd5cc
    add r0, r4, #0x3cc
    str r1, [r4, #0x3cc]
    bl PresentationList_DeleteAll
    add r0, r4, #0xd8
    bl func_ov018_021fcefc
    add r0, r4, #0xb8
    bl AnimationResourceState_Destroy
    add r0, r4, #0xac
    bl AnimationResourceState_Destroy
    add r0, r4, #0xa0
    bl AnimationResourceState_Destroy
    add r0, r4, #0x94
    bl AnimationResourceState_Destroy
    add r0, r4, #0x70
    bl func_020927b8
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
L_021fd5b8: .word data_ov018_021ffd3c
L_021fd5bc: .word 0x4001050
L_021fd5c0: .word gDebugFont
L_021fd5c4: .word gGameWork
L_021fd5c8: .word 0x418
L_021fd5cc: .word data_ov018_021ffd00
    .size func_ov018_021fd4a8, . - func_ov018_021fd4a8
