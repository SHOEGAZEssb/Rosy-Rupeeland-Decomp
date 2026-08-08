.text

/* Exact fallback; see src/overlays/ov032/overlay032_dialog_children.c for documented portable C. */
.extern data_020c7ba8
.extern func_ov032_02201188

    .global func_ov032_021fe8d8
func_ov032_021fe8d8:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
    mov r8, r0
    mov r7, r1
    add r0, r8, #0x44
    ldr r4, L_021fe928
    str r7, [r8, #0xc28]
    mov r6, #0x0
    add r5, r0, #0xc00
    mov r9, #0x6c
    mov r10, #0x208
L_021fe900:
    ldr r1, [r8, #0xc1c]
    mla r0, r6, r9, r5
    mla r3, r1, r10, r4
    ldr r2, [r8, #0xc24]
    mov r1, r7
    bl func_ov032_02201188
    add r6, r6, #0x1
    cmp r6, #0x5
    blt L_021fe900
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
L_021fe928: .word data_020c7ba8
.size func_ov032_021fe8d8, .-func_ov032_021fe8d8

