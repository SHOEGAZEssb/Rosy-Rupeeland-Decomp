.text

/* Exact fallback; see src/overlays/ov036/overlay036_resource_object.c for documented portable C. */

    .extern func_020949ec
    .extern Heap_Alloc
    .extern func_02077ca0
    .extern data_ov036_02205ff0
    .extern data_ov036_02206140
    .extern gHeapContext
    .extern data_020f4e18

    .global func_ov036_021fdf30
func_ov036_021fdf30:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, r1
    bl func_020949ec
    ldr ip, L_021fdf8c
    ldr r1, L_021fdf90
    ldr r3, L_021fdf94
    mov r0, #0x18
    mov r2, #0x4
    str ip, [r5, #0x0]
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fdf80
    ldr r3, L_021fdf98
    ldr r1, L_021fdf9c
    str r3, [sp, #0x0]
    ldr r1, [r1, #0x0]
    mov r2, r4
    sub r3, r3, #0x1
    bl func_02077ca0
L_021fdf80:
    str r0, [r5, #0x9c]
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
L_021fdf8c: .word data_ov036_02205ff0
L_021fdf90: .word data_ov036_02206140
L_021fdf94: .word gHeapContext
L_021fdf98: .word 0x6133
L_021fdf9c: .word data_020f4e18
    .size func_ov036_021fdf30, .-func_ov036_021fdf30
