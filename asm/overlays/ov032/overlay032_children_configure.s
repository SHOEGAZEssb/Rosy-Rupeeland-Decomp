.text

/* Exact fallback; see src/overlays/ov032/overlay032_dialog_children.c for documented portable C. */
.extern data_020c7ba8
.extern func_ov032_02201020

    .global func_ov032_021fe848
func_ov032_021fe848:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, lr}
    sub sp, sp, #0x4
    mov r6, r0
    add r0, r6, #0x44
    ldr r9, L_021fe89c
    mov r5, r1
    mov r4, #0x0
    add r10, r0, #0xc00
    mov r7, #0x6c
    mov r8, #0x208
L_021fe870:
    ldr r1, [r6, #0xc1c]
    mla r0, r4, r7, r10
    str r5, [sp, #0x0]
    mla r3, r1, r8, r9
    ldr r2, [r6, #0xc24]
    bl func_ov032_02201020
    add r4, r4, #0x1
    cmp r4, #0x5
    blt L_021fe870
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, pc}
L_021fe89c: .word data_020c7ba8
.size func_ov032_021fe848, .-func_ov032_021fe848

