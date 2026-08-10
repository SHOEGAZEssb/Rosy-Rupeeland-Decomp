.text

/* Exact fallback; see src/overlays/ov025/overlay025_selection_helpers.c. */
.extern data_ov025_022033b4
.extern func_02071eb8
.extern GraphicsSpriteGroup_Destroy
.extern func_020927b8
.extern func_ov025_021fd5dc
.extern func_ov025_021fd9e4
.extern func_ov025_021fde58
.extern func_ov025_02200564
.extern gHeapContext
.extern Heap_Alloc
.extern Heap_Free


    .global func_ov025_022006c4
func_ov025_022006c4:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r0
    bl func_ov025_02200564
    ldr r0, [r5, #0x54]
    add r0, r5, r0, lsl #0x2
    ldr r0, [r0, #0xe4]
    bl func_ov025_021fde58
    ldr r0, [r5, #0x54]
    add r0, r5, r0, lsl #0x2
    ldr r4, [r0, #0xe4]
    cmp r4, #0x0
    beq L_02200714
    ldr r0, [r4, #0xc]
    bl GraphicsSpriteGroup_Destroy
    add r0, r4, #0x30
    bl func_020927b8
    mov r0, r4
    bl func_02071eb8
    mov r0, r4
    bl Heap_Free
L_02200714:
    ldr r1, L_0220078c
    ldr r3, L_02200790
    mov r0, #0x90
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_02200738
    ldr r1, [r5, #0x54]
    bl func_ov025_021fd5dc
L_02200738:
    ldr r2, [r5, #0x54]
    mov r4, #0x0
    add r2, r5, r2, lsl #0x2
    str r0, [r2, #0xe4]
    ldr r0, [r5, #0x54]
    mov r1, #0x1
    add r0, r5, r0, lsl #0x2
    ldr r0, [r0, #0xe4]
    mov r6, r4
    ldr r0, [r0, #0xc]
    str r1, [r0, #0x20]
L_02200764:
    add r0, r5, r4, lsl #0x2
    ldr r0, [r0, #0xe4]
    mov r1, r6
    bl func_ov025_021fd9e4
    add r4, r4, #0x1
    cmp r4, #0x3
    blt L_02200764
    mvn r0, #0x0
    str r0, [r5, #0x54]
    ldmia sp!, {r4, r5, r6, pc}
L_0220078c: .word data_ov025_022033b4
L_02200790: .word gHeapContext
.size func_ov025_022006c4, .-func_ov025_022006c4

