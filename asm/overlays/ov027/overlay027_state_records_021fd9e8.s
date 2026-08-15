.text

/* Exact fallback; see src/overlays/ov027/overlay027_state_records.c. */
.extern data_ov027_021fee60
.extern PresentationList_DeleteAll


    .global func_ov027_021fd9e8
func_ov027_021fd9e8:
    stmdb sp!, {r4, lr}
    ldr r1, L_021fda04
    mov r4, r0
    str r1, [r4, #0x0]
    bl PresentationList_DeleteAll
    mov r0, r4
    ldmia sp!, {r4, pc}
L_021fda04: .word data_ov027_021fee60
.size func_ov027_021fd9e8, .-func_ov027_021fd9e8

