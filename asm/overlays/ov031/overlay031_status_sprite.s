.text

/* Exact fallback; see src/overlays/ov031/overlay031_transition_setup.c for documented portable C. */
.extern data_ov031_021fe6e0
.extern func_02072b68
.extern func_0209189c


    .global func_ov031_021fdf20
func_ov031_021fdf20:
    stmdb sp!, {r4, lr}
    mov r4, r0
    cmp r1, #0x0
    beq L_021fdf50
    mov r0, #0xc8
    str r0, [r4, #0x94]
    ldr r2, [r4, #0x9c]
    ldr r1, L_021fdfa4
    ldr r0, [r4, #0x6c]
    ldrb r1, [r1, r2]
    bl func_02072b68
    b L_021fdf90
L_021fdf50:
    ldr r0, [r4, #0x94]
    cmp r0, #0x0
    subne r0, r0, #0x1
    strne r0, [r4, #0x94]
    bne L_021fdf90
    add r0, r4, #0x14c
    add r0, r0, #0x400
    mov r1, #0x78
    mov r2, #0xf0
    bl func_0209189c
    str r0, [r4, #0x94]
    ldr r2, [r4, #0x9c]
    ldr r1, L_021fdfa4
    ldr r0, [r4, #0x6c]
    ldrb r1, [r1, r2]
    bl func_02072b68
L_021fdf90:
    ldr r1, [r4, #0x6c]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x4
    strh r0, [r1, #0x24]
    ldmia sp!, {r4, pc}
L_021fdfa4: .word data_ov031_021fe6e0
.size func_ov031_021fdf20, .-func_ov031_021fdf20
