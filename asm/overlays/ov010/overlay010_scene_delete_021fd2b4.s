    .text
    .extern DebugText_BeginFrame
    .extern Heap_Free
    .extern Scene_Destroy
    .extern data_020f4e14
    .extern data_ov010_021fec34
    .extern data_ov010_021fec68
    .extern func_02002728
    .extern GraphicsResourceSetVariant_Destroy
    .extern func_02075020
    .extern Graphics3DResourceOwner_Destroy
    .extern Graphics3DResourceBinding_Destroy
    .extern func_020923a0
    .extern func_02092418

/* Exact fallback; see src/overlays/ov010/overlay010_scene_delete.c. */
    .global func_ov010_021fd2b4
func_ov010_021fd2b4: ; 0x021fd2b4
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, L_021fd37c
    mov r4, r0
    ldr r0, L_021fd380
    str r1, [r4, #0x0]
    str r0, [r4, #0x24]
    ldr r5, [r4, #0x12c]
    cmp r5, #0x0
    beq L_021fd2e8
    mov r0, r5
    bl Graphics3DResourceBinding_Destroy
    mov r0, r5
    bl Heap_Free
L_021fd2e8:
    ldr r5, [r4, #0x130]
    cmp r5, #0x0
    beq L_021fd304
    mov r0, r5
    bl Graphics3DResourceBinding_Destroy
    mov r0, r5
    bl Heap_Free
L_021fd304:
    mov r5, #0x0
L_021fd308:
    add r0, r4, r5, lsl #0x2
    ldr r0, [r0, #0x90]
    bl func_02002728
    add r5, r5, #0x1
    cmp r5, #0x2
    blt L_021fd308
    ldr r5, [r4, #0x78]
    cmp r5, #0x0
    beq L_021fd33c
    mov r0, r5
    bl Graphics3DResourceOwner_Destroy
    mov r0, r5
    bl Heap_Free
L_021fd33c:
    ldr r0, L_021fd384
    ldr r0, [r0, #0x0]
    bl func_02075020
    add r0, r4, #0x180
    bl func_02092418
    bl DebugText_BeginFrame
    add r0, r4, #0x180
    bl func_020923a0
    add r0, r4, #0x7c
    bl GraphicsResourceSetVariant_Destroy
    mov r0, r4
    bl Scene_Destroy
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
L_021fd37c: .word data_ov010_021fec34
L_021fd380: .word data_ov010_021fec68
L_021fd384: .word data_020f4e14

    .size func_ov010_021fd2b4, . - func_ov010_021fd2b4
