.text

/* Exact fallback; see src/overlays/ov031/overlay031_effect_runtime.c for documented portable C. */
.extern func_ov031_021fd1c0
.extern func_ov031_021fd1e0
.extern Heap_Free


    .global func_ov031_021fd798
func_ov031_021fd798:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r6, #0x0
    mov r7, r0
    mov r4, r6
L_021fd7a8:
    add r0, r7, r6, lsl #0x2
    ldr r0, [r0, #0x74]
    cmp r0, #0x0
    beq L_021fd7ec
    bl func_ov031_021fd1e0
    cmp r0, #0x0
    beq L_021fd7ec
    add r0, r7, r6, lsl #0x2
    ldr r5, [r0, #0x74]
    cmp r5, #0x0
    beq L_021fd7e4
    mov r0, r5
    bl func_ov031_021fd1c0
    mov r0, r5
    bl Heap_Free
L_021fd7e4:
    add r0, r7, r6, lsl #0x2
    str r4, [r0, #0x74]
L_021fd7ec:
    add r6, r6, #0x1
    cmp r6, #0x10
    blt L_021fd7a8
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.size func_ov031_021fd798, .-func_ov031_021fd798
