.text

/* Exact fallback; see src/overlays/ov036/overlay036_secondary_resource_object.c for documented portable C. */

    .extern func_020949ec
    .extern Heap_Alloc
    .extern func_02077ca0
    .extern data_ov036_022060d0
    .extern data_ov036_02206140
    .extern gHeapContext
    .extern data_020f4e18

    .global func_ov036_021fffa4
func_ov036_021fffa4:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, r1
    bl func_020949ec
    ldr ip, L_02200000
    ldr r1, L_02200004
    ldr r3, L_02200008
    mov r0, #0x18
    mov r2, #0x4
    str ip, [r5, #0x0]
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021ffff4
    ldr r3, L_0220000c
    ldr r1, L_02200010
    str r3, [sp, #0x0]
    ldr r1, [r1, #0x0]
    mov r2, r4
    sub r3, r3, #0x1
    bl func_02077ca0
L_021ffff4:
    str r0, [r5, #0x9c]
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
L_02200000: .word data_ov036_022060d0
L_02200004: .word data_ov036_02206140
L_02200008: .word gHeapContext
L_0220000c: .word 0x612d
L_02200010: .word data_020f4e18
    .size func_ov036_021fffa4, .-func_ov036_021fffa4

