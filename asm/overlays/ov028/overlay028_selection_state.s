.text

/* Exact fallback; see src/overlays/ov028/overlay028_selection_runtime.c. */
.extern data_020f4e14
.extern data_ov028_021ff208
.extern func_020755bc
.extern func_ov028_021fd468
.extern func_ov028_021fdad8
.extern func_ov028_021fe438
.extern func_ov028_021fe6bc


    .global func_ov028_021fe714
func_ov028_021fe714:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    bne L_021fe764
    ldr r0, L_021fe774
    ldr r0, [r0, #0x0]
    bl func_020755bc
    mov r0, r4
    bl func_ov028_021fe6bc
    ldr r0, [r4, #0x220]
    bl func_ov028_021fd468
    ldr r1, L_021fe778
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov028_021fdad8
    ldr r0, [r4, #0x20]
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    str r0, [r4, #0x20]
L_021fe764:
    mov r0, r4
    bl func_ov028_021fe438
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_021fe774: .word data_020f4e14
L_021fe778: .word data_ov028_021ff208
.size func_ov028_021fe714, .-func_ov028_021fe714
