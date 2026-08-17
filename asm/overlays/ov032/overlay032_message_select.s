.text

/* Exact fallback; see src/overlays/ov032/overlay032_input_runtime.c for documented portable C. */
.extern data_021f4020
.extern RetailSelectionDatabase_FindResource
.extern TitleDialog_SetText

    .global func_ov032_021fe2bc
func_ov032_021fe2bc:
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r2, r1, lsl #0x10
    str r1, [r4, #0xbd4]
    ldr r0, L_021fe2ec
    mov r1, r2, lsr #0x10
    bl RetailSelectionDatabase_FindResource
    mov r1, r0
    ldr r0, [r4, #0x10]
    mov r2, #0x0
    bl TitleDialog_SetText
    ldmia sp!, {r4, pc}
L_021fe2ec: .word data_021f4020
.size func_ov032_021fe2bc, .-func_ov032_021fe2bc

