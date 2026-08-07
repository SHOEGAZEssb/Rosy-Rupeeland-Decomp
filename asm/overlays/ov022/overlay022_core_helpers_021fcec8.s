    .text
/* Exact fallback; see src/overlays/ov022/overlay022_core_helpers.c. */
    .extern data_ov022_02200654

.global func_ov022_021fcec8
func_ov022_021fcec8:
    ldr r2, L_021fcee4
    mov r1, #0x0
    str r2, [r0, #0x0]
    str r1, [r0, #0x8]
    str r1, [r0, #0x4]
    str r1, [r0, #0xc]
    bx lr
L_021fcee4: .word data_ov022_02200654
.size func_ov022_021fcec8, . - func_ov022_021fcec8
