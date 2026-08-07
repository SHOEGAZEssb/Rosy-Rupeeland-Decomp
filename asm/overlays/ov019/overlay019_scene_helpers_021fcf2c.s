    .text
/* Exact fallback; see src/overlays/ov019/overlay019_scene_helpers.c. */
    .extern Heap_Free
    .extern data_ov019_021fd638
    .extern func_ov002_021fb9c4

.global func_ov019_021fcf2c
.global func_ov019_021fcf70
func_ov019_021fcf2c:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, L_021fcf6c
    mov r5, r0
    str r1, [r5, #0x0]
    ldr r0, [r5, #0x20]
    bic r0, r0, #0x400
    str r0, [r5, #0x20]
    ldr r4, [r5, #0x5c]
    cmp r4, #0x0
    beq L_021fcf64
    mov r0, r4
    bl func_ov002_021fb9c4
    mov r0, r4
    bl Heap_Free
L_021fcf64:
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
L_021fcf6c: .word data_ov019_021fd638
    .size func_ov019_021fcf2c, . - func_ov019_021fcf2c
func_ov019_021fcf70:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, L_021fcfb8
    mov r5, r0
    str r1, [r5, #0x0]
    ldr r0, [r5, #0x20]
    bic r0, r0, #0x400
    str r0, [r5, #0x20]
    ldr r4, [r5, #0x5c]
    cmp r4, #0x0
    beq L_021fcfa8
    mov r0, r4
    bl func_ov002_021fb9c4
    mov r0, r4
    bl Heap_Free
L_021fcfa8:
    mov r0, r5
    bl Heap_Free
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
L_021fcfb8: .word data_ov019_021fd638
    .size func_ov019_021fcf70, . - func_ov019_021fcf70
