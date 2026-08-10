.text

/* Exact fallback; see src/overlays/ov035/overlay035_transition_object.c for documented portable C. */

    .extern Graphics3DResourceBinding_Destroy
    .extern Heap_Free
    .extern func_ov035_021fcf30
    .extern data_ov035_02203ce8


    .global func_ov035_021fe65c
func_ov035_021fe65c: 
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, L_021fe698
    mov r5, r0
    str r1, [r5, #0x0]
    ldr r4, [r5, #0x9c]
    cmp r4, #0x0
    beq L_021fe688
    mov r0, r4
    bl Graphics3DResourceBinding_Destroy
    mov r0, r4
    bl Heap_Free
L_021fe688:
    mov r0, r5
    bl func_ov035_021fcf30
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
L_021fe698: .word data_ov035_02203ce8
.size func_ov035_021fe65c, .-func_ov035_021fe65c

    .global func_ov035_021fe69c

func_ov035_021fe69c: 
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, L_021fe6e0
    mov r5, r0
    str r1, [r5, #0x0]
    ldr r4, [r5, #0x9c]
    cmp r4, #0x0
    beq L_021fe6c8
    mov r0, r4
    bl Graphics3DResourceBinding_Destroy
    mov r0, r4
    bl Heap_Free
L_021fe6c8:
    mov r0, r5
    bl func_ov035_021fcf30
    mov r0, r5
    bl Heap_Free
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
L_021fe6e0: .word data_ov035_02203ce8
.size func_ov035_021fe69c, .-func_ov035_021fe69c

