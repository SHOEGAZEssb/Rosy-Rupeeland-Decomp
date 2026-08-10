    .text
    .extern GraphicsSpriteGroup_Destroy
    .extern func_020280d8
    .extern Heap_Free
    .extern func_ov005_021fbb78
    .extern func_020925dc
    .extern func_02071eb8
    .extern data_ov005_021fcad4

    /* Exact fallback; see the documented portable reconstruction in
     * src/overlays/ov005/overlay005_presentation_destroy.c. */
    .global func_ov005_021fc110
func_ov005_021fc110: ; 0x021fc110
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, L_021fc1b8
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0x20]
    bic r0, r0, #0x400
    str r0, [r4, #0x20]
    ldr r0, [r4, #0x64]
    cmp r0, #0x0
    beq L_021fc144
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021fc144:
    ldr r0, [r4, #0x60]
    bl GraphicsSpriteGroup_Destroy
    ldr r5, [r4, #0x78]
    cmp r5, #0x0
    beq L_021fc168
    mov r0, r5
    bl func_020280d8
    mov r0, r5
    bl Heap_Free
L_021fc168:
    ldr r5, [r4, #0x74]
    cmp r5, #0x0
    beq L_021fc184
    mov r0, r5
    bl func_ov005_021fbb78
    mov r0, r5
    bl Heap_Free
L_021fc184:
    mov r0, #0x0
    bl func_020925dc
    ldr r0, L_021fc1bc
    mov r1, #0x0
    strh r1, [r0, #0x0]
    sub r2, r0, #0x50
    ldr r1, [r2, #0x0]
    add r0, r4, #0x54
    bic r1, r1, #0xe000
    str r1, [r2, #0x0]
    bl func_02071eb8
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
L_021fc1b8: .word data_ov005_021fcad4
L_021fc1bc: .word 0x4001050

    .size func_ov005_021fc110, .-func_ov005_021fc110
