.text

/* Exact fallback; see src/overlays/ov035/overlay035_transition_object.c for documented portable C. */

    .extern func_020949ec
    .extern Heap_Alloc
    .extern func_02077ca0
    .extern data_ov035_02203ce8
    .extern data_ov035_02203d30
    .extern gHeapContext
    .extern data_020f4e18


    .global func_ov035_021fe5ec
func_ov035_021fe5ec: 
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, r1
    bl func_020949ec
    ldr ip, L_021fe648
    ldr r1, L_021fe64c
    ldr r3, L_021fe650
    mov r0, #0x18
    mov r2, #0x4
    str ip, [r5, #0x0]
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fe63c
    ldr r3, L_021fe654
    ldr r1, L_021fe658
    str r3, [sp, #0x0]
    ldr r1, [r1, #0x0]
    mov r2, r4
    sub r3, r3, #0x1
    bl func_02077ca0
L_021fe63c:
    str r0, [r5, #0x9c]
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
L_021fe648: .word data_ov035_02203ce8
L_021fe64c: .word data_ov035_02203d30
L_021fe650: .word gHeapContext
L_021fe654: .word 0x612f
L_021fe658: .word data_020f4e18
.size func_ov035_021fe5ec, .-func_ov035_021fe5ec

