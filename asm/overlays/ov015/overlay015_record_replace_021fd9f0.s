    .text
    .extern func_ov015_021fd8a8
    .extern func_ov015_021fd8ec
    .extern func_ov015_021fda50

/* Exact fallback for record replacement; see src/overlays/ov015/overlay015_record_layout.c. */
    .global func_ov015_021fd9f0

func_ov015_021fd9f0:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r0
    mov ip, #0x0
    mov r6, r1
    mov r5, r2
    mov r4, r3
    str ip, [r7, #0x300]
    bl func_ov015_021fda50
    mov r0, r7
    mov r1, r6
    bl func_ov015_021fd8a8
    cmp r5, #0x0
    blt L_021fda44
    mov r0, r7
    mov r1, r5
    bl func_ov015_021fd8a8
    cmp r4, #0x0
    blt L_021fda44
    mov r0, r7
    mov r1, r4
    bl func_ov015_021fd8a8
L_021fda44:
    mov r0, r7
    bl func_ov015_021fd8ec
    ldmia sp!, {r3, r4, r5, r6, r7, pc}

    .size func_ov015_021fd9f0, . - func_ov015_021fd9f0
