    .text
    .extern data_ov011_021fe578
    .extern data_ov011_021fe5ac
    .extern func_ov011_021fce00
    .extern func_02092418
    .extern Heap_FreeCore
    .extern DebugText_BeginFrame
    .extern GraphicsBankStateSnapshot_Destroy
    .extern GraphicsResourceSet_Destroy
    .extern Scene_Destroy
    .extern Heap_Free

    ; Exact matching fallback; see the documented portable reconstruction in
    ; src/overlays/ov011/overlay011_scene_delete.c.
    .global func_ov011_021fd0fc
func_ov011_021fd0fc:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r2, L_021fd16c
    mov r5, r0
    ldr r1, L_021fd170
    str r2, [r5, #0x0]
    mov r0, #0x0
    str r1, [r5, #0x24]
    bl func_ov011_021fce00
    add r0, r5, #0x98
    bl func_02092418
    mov r4, #0x0
L_021fd128:
    add r0, r5, r4, lsl #0x2
    ldr r0, [r0, #0x84]
    bl Heap_FreeCore
    add r4, r4, #0x1
    cmp r4, #0x5
    blt L_021fd128
    bl DebugText_BeginFrame
    add r0, r5, #0x98
    bl GraphicsBankStateSnapshot_Destroy
    add r0, r5, #0x78
    bl GraphicsResourceSet_Destroy
    mov r0, r5
    bl Scene_Destroy
    mov r0, r5
    bl Heap_Free
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
L_021fd16c: .word data_ov011_021fe578
L_021fd170: .word data_ov011_021fe5ac
    .size func_ov011_021fd0fc, . - func_ov011_021fd0fc
