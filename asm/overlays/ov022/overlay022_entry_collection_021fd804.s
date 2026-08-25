    .text
/* Exact fallback; see src/overlays/ov022/overlay022_entry_collection.c. */
    .extern data_ov022_02200674
    .extern CxxArray_DestroyAndFree
    .extern func_ov022_021fd800
    .extern Heap_Free

.global func_ov022_021fd804
func_ov022_021fd804:
    stmdb sp!, {r4, lr}
    ldr r1, L_021fd840
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0x38]
    cmp r0, #0x0
    beq L_021fd830
    mov r1, #0x8
    ldr r3, L_021fd844
    mov r2, r1
    bl CxxArray_DestroyAndFree
L_021fd830:
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
L_021fd840: .word data_ov022_02200674
L_021fd844: .word func_ov022_021fd800
.size func_ov022_021fd804, . - func_ov022_021fd804
