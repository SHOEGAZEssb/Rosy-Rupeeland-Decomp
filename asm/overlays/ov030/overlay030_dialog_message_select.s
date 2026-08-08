.text

/* Exact fallback; see src/overlays/ov030/overlay030_dialog_runtime.c for documented portable C. */
.extern func_ov030_021fe954


    .global func_ov030_021feb0c
func_ov030_021feb0c:
    stmdb sp!, {r3, lr}
    ldr r2, [r0, #0x384]
    cmp r2, #0x0
    ldreq r1, [r0, #0x38c]
    cmpeq r1, #0x0
    bne L_021feb30
    ldr r1, L_021feb58
    bl func_ov030_021fe954
    ldmia sp!, {r3, pc}
L_021feb30:
    cmp r2, #0x0
    ldrne r1, [r0, #0x38c]
    cmpne r1, #0x0
    beq L_021feb4c
    ldr r1, L_021feb5c
    bl func_ov030_021fe954
    ldmia sp!, {r3, pc}
L_021feb4c:
    ldr r1, L_021feb60
    bl func_ov030_021fe954
    ldmia sp!, {r3, pc}
L_021feb58: .word 0x1f6
L_021feb5c: .word 0x1f7
L_021feb60: .word 0x1f1
.size func_ov030_021feb0c, .-func_ov030_021feb0c
