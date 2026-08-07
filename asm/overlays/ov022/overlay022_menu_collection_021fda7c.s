    .text
/* Exact fallback; see src/overlays/ov022/overlay022_menu_collection.c. */
    .extern data_020d780c
    .extern data_020d7830
    .extern func_02010b64
    .extern gLupyContext

.global func_ov022_021fda7c
func_ov022_021fda7c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r3, [r5, #0x24]
    cmp r3, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r2, [r5, #0x2c]
    ldr r0, [r5, #0x28]
    cmp r2, r0
    ldmgeia sp!, {r3, r4, r5, pc}
    mov r0, #0x34
    mul r4, r1, r0
    ldr r1, L_021fdaf0
    ldr r0, L_021fdaf4
    add r1, r1, r4
    str r1, [r3, r2, lsl #0x3]
    ldr r0, [r0, #0x0]
    bl func_02010b64
    ldr r1, L_021fdaf8
    ldr r1, [r1, r4]
    cmp r1, r0
    ldrge r1, [r5, #0x24]
    ldrge r0, [r5, #0x2c]
    movge r2, #0x1
    addge r0, r1, r0, lsl #0x3
    strge r2, [r0, #0x4]
    ldr r0, [r5, #0x2c]
    add r0, r0, #0x1
    str r0, [r5, #0x2c]
    ldmia sp!, {r3, r4, r5, pc}
L_021fdaf0: .word data_020d780c
L_021fdaf4: .word gLupyContext
L_021fdaf8: .word data_020d7830
.size func_ov022_021fda7c, . - func_ov022_021fda7c
