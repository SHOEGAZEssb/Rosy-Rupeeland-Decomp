    .text
    .extern DebugText_BeginFrame
    .extern Heap_Free
    .extern Scene_Destroy
    .extern data_ov009_021fee8c
    .extern data_ov009_021feec0
    .extern func_02002728
    .extern func_02071eb8
    .extern GraphicsSpriteGroup_Destroy
    .extern func_020923a0
    .extern func_02092418

/* Exact fallback; see documented portable reconstruction in
 * src/overlays/ov009/overlay009_scene_delete.c. */
    .global func_ov009_021fd208
func_ov009_021fd208: ; 0x021fd208
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, L_021fd278
    mov r5, r0
    ldr r0, L_021fd27c
    str r1, [r5, #0x0]
    str r0, [r5, #0x24]
    mov r4, #0x0
L_021fd224:
    add r0, r5, r4, lsl #0x2
    ldr r0, [r0, #0x8c]
    bl func_02002728
    add r4, r4, #0x1
    cmp r4, #0x6
    blt L_021fd224
    ldr r0, [r5, #0x84]
    bl GraphicsSpriteGroup_Destroy
    add r0, r5, #0x13c
    bl func_02092418
    bl DebugText_BeginFrame
    add r0, r5, #0x13c
    bl func_020923a0
    add r0, r5, #0x78
    bl func_02071eb8
    mov r0, r5
    bl Scene_Destroy
    mov r0, r5
    bl Heap_Free
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
L_021fd278: .word data_ov009_021fee8c
L_021fd27c: .word data_ov009_021feec0

    .size func_ov009_021fd208, . - func_ov009_021fd208
