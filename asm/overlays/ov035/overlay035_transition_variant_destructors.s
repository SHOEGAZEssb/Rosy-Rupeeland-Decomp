.text

/* Exact fallback; see src/overlays/ov035/overlay035_transition_variant.c for documented portable C. */

    .extern func_02077d08
    .extern Heap_Free
    .extern func_ov035_021fcf30
    .extern data_ov035_02203ccc


    .global func_ov035_021fe954
func_ov035_021fe954: 
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, L_021fe990
    mov r5, r0
    str r1, [r5, #0x0]
    ldr r4, [r5, #0x9c]
    cmp r4, #0x0
    beq L_021fe980
    mov r0, r4
    bl func_02077d08
    mov r0, r4
    bl Heap_Free
L_021fe980:
    mov r0, r5
    bl func_ov035_021fcf30
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
L_021fe990: .word data_ov035_02203ccc
.size func_ov035_021fe954, .-func_ov035_021fe954

    .global func_ov035_021fe994

func_ov035_021fe994: 
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, L_021fe9d8
    mov r5, r0
    str r1, [r5, #0x0]
    ldr r4, [r5, #0x9c]
    cmp r4, #0x0
    beq L_021fe9c0
    mov r0, r4
    bl func_02077d08
    mov r0, r4
    bl Heap_Free
L_021fe9c0:
    mov r0, r5
    bl func_ov035_021fcf30
    mov r0, r5
    bl Heap_Free
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
L_021fe9d8: .word data_ov035_02203ccc
.size func_ov035_021fe994, .-func_ov035_021fe994

