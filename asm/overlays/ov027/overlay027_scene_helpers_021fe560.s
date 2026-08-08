.text

/* Exact fallback; see src/overlays/ov027/overlay027_scene_helpers.c. */
.extern data_ov027_021fe940
.extern func_ov027_021fda08
.extern func_ov027_021fe1c8


    .global func_ov027_021fe560
func_ov027_021fe560:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    beq L_021fe580
    cmp r0, #0x1
    beq L_021fe590
    b L_021fe5b0
L_021fe580:
    add r0, r0, #0x1
    str r0, [r4, #0x4]
    mov r0, #0x0
    str r0, [r4, #0x8]
L_021fe590:
    ldr r0, [r4, #0x20]
    ldr r1, L_021fe5c0
    bic r0, r0, #0x1
    orr r0, r0, #0x1
    str r0, [r4, #0x20]
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov027_021fda08
L_021fe5b0:
    mov r0, r4
    bl func_ov027_021fe1c8
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_021fe5c0: .word data_ov027_021fe940
.size func_ov027_021fe560, .-func_ov027_021fe560

