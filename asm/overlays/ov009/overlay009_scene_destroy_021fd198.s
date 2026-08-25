    .text
    .extern DebugText_BeginFrame
    .extern Scene_Destroy
    .extern data_ov009_021fee8c
    .extern data_ov009_021feec0
    .extern Heap_FreeCore
    .extern AnimationResourceState_Destroy
    .extern GraphicsSpriteGroup_Destroy
    .extern GraphicsBankStateSnapshot_Destroy
    .extern GraphicsBankStateSnapshot_Restore

/* Exact fallback; see documented portable reconstruction in
 * src/overlays/ov009/overlay009_scene_destroy.c. */
    .global func_ov009_021fd198
func_ov009_021fd198: ; 0x021fd198
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, L_021fd200
    mov r5, r0
    ldr r0, L_021fd204
    str r1, [r5, #0x0]
    str r0, [r5, #0x24]
    mov r4, #0x0
L_021fd1b4:
    add r0, r5, r4, lsl #0x2
    ldr r0, [r0, #0x8c]
    bl Heap_FreeCore
    add r4, r4, #0x1
    cmp r4, #0x6
    blt L_021fd1b4
    ldr r0, [r5, #0x84]
    bl GraphicsSpriteGroup_Destroy
    add r0, r5, #0x13c
    bl GraphicsBankStateSnapshot_Restore
    bl DebugText_BeginFrame
    add r0, r5, #0x13c
    bl GraphicsBankStateSnapshot_Destroy
    add r0, r5, #0x78
    bl AnimationResourceState_Destroy
    mov r0, r5
    bl Scene_Destroy
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
L_021fd200: .word data_ov009_021fee8c
L_021fd204: .word data_ov009_021feec0

    .size func_ov009_021fd198, . - func_ov009_021fd198
