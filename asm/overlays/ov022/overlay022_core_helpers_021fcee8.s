    .text
/* Exact fallback; see src/overlays/ov022/overlay022_core_helpers.c. */
    .extern data_ov022_02200654
    .extern PresentationList_DeleteAll

.global func_ov022_021fcee8
func_ov022_021fcee8:
    stmdb sp!, {r4, lr}
    ldr r1, L_021fcf04
    mov r4, r0
    str r1, [r4, #0x0]
    bl PresentationList_DeleteAll
    mov r0, r4
    ldmia sp!, {r4, pc}
L_021fcf04: .word data_ov022_02200654
.size func_ov022_021fcee8, . - func_ov022_021fcee8
