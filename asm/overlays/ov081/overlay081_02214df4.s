.text
; Matching fallback for the portable implementation in src/overlays/ov081/overlay081_recovery.c.
.extern VecFx32Object_Destroy
.extern VecFx32Object_Assign
.extern func_020adcac
.extern func_020befec
.extern func_ov081_02213528
.extern func_ov081_022135a4
.extern func_ov081_02214f20

.global func_ov081_02214df4
func_ov081_02214df4:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x30
    mov r4, r0
    ldr r1, [r4, #0xd0]
    orr r1, r1, #0x2
    str r1, [r4, #0xd0]
    ldr r1, [r4, #0x210]
    cmp r1, #0x0
    bne .L_02214e24
    bl func_ov081_022135a4
    mov r0, #0x0
    b .L_02214f18
.L_02214e24:
    ldr r3, [r1, #0x0]
    add r0, sp, #0x20
    ldr r3, [r3, #0xb4]
    mov r2, r4
    blx r3
    adds r1, r4, #0x18
    add r0, sp, #0x20
    addne r1, r1, #0x4
    add r0, r0, #0x4
    bl func_020adcac
    cmp r0, #0xc000
    bge .L_02214e94
    add r0, sp, #0x10
    add r2, sp, #0x20
    add r1, r4, #0x18
    bl func_ov081_02213528
    add r0, sp, #0x0
    add r1, sp, #0x10
    add r2, r4, #0x18
    bl func_ov081_02214f20
    add r0, sp, #0x20
    add r1, sp, #0x0
    bl VecFx32Object_Assign
    add r0, sp, #0x0
    bl VecFx32Object_Destroy
    add r0, sp, #0x10
    bl VecFx32Object_Destroy
    b .L_02214ea8
.L_02214e94:
    cmp r0, #0x20000
    bge .L_02214ea8
    add r0, sp, #0x20
    add r1, r4, #0x18
    bl VecFx32Object_Assign
.L_02214ea8:
    mov r0, r4
    ldr r2, [r0, #0x0]
    add r1, sp, #0x20
    ldr r2, [r2, #0xc8]
    blx r2
    ldr r0, [r4, #0x3c]
    mov r1, #0xa
    bl func_020befec
    ldr r2, [r4, #0x8c]
    mov r1, #0xa
    add r0, r2, r0
    str r0, [r4, #0x8c]
    ldr r0, [r4, #0x40]
    bl func_020befec
    ldr r2, [r4, #0x90]
    mov r1, #0x3
    add r0, r2, r0
    str r0, [r4, #0x90]
    ldr r0, [r4, #0x3c]
    bl func_020befec
    str r0, [r4, #0x3c]
    ldr r0, [r4, #0x40]
    mov r1, #0x3
    bl func_020befec
    str r0, [r4, #0x40]
    add r0, sp, #0x20
    bl VecFx32Object_Destroy
    mov r0, #0x0
.L_02214f18:
    add sp, sp, #0x30
    ldmia sp!, {r4, pc}
.size func_ov081_02214df4, . - func_ov081_02214df4
