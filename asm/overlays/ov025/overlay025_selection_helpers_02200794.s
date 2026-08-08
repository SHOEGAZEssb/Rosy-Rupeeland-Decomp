.text

/* Exact fallback; see src/overlays/ov025/overlay025_selection_helpers.c. */
.extern data_ov025_022033b4
.extern func_02071eb8
.extern func_0207419c
.extern func_020927b8
.extern func_ov025_021fd5dc
.extern gHeapContext
.extern Heap_Alloc
.extern Heap_Free


    .global func_ov025_02200794
func_ov025_02200794:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r0, [r4, #0x58]
    add r0, r4, r0, lsl #0x2
    ldr r5, [r0, #0xe4]
    cmp r5, #0x0
    beq L_022007d0
    ldr r0, [r5, #0xc]
    bl func_0207419c
    add r0, r5, #0x30
    bl func_020927b8
    mov r0, r5
    bl func_02071eb8
    mov r0, r5
    bl Heap_Free
L_022007d0:
    ldr r1, L_0220081c
    ldr r3, L_02200820
    mov r0, #0x90
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_022007f4
    ldr r1, [r4, #0x58]
    bl func_ov025_021fd5dc
L_022007f4:
    ldr r2, [r4, #0x58]
    mov r1, #0x1
    add r2, r4, r2, lsl #0x2
    str r0, [r2, #0xe4]
    ldr r0, [r4, #0x58]
    add r0, r4, r0, lsl #0x2
    ldr r0, [r0, #0xe4]
    ldr r0, [r0, #0xc]
    str r1, [r0, #0x20]
    ldmia sp!, {r3, r4, r5, pc}
L_0220081c: .word data_ov025_022033b4
L_02200820: .word gHeapContext
.size func_ov025_02200794, .-func_ov025_02200794

