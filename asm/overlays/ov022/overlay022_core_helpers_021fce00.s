    .text
/* Exact fallback; see src/overlays/ov022/overlay022_core_helpers.c. */
    .extern data_ov022_02200684
    .extern func_020953c8

.global func_ov022_021fce00
func_ov022_021fce00:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, r2
    bl func_020953c8
    ldr r0, L_021fce2c
    mov r1, #0x1
    str r0, [r5, #0x0]
    str r4, [r5, #0xa0]
    mov r0, r5
    str r1, [r5, #0x88]
    ldmia sp!, {r3, r4, r5, pc}
L_021fce2c: .word data_ov022_02200684
.size func_ov022_021fce00, . - func_ov022_021fce00
