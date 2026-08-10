.text
; Matching fallback for the portable implementation in src/overlays/ov083/overlay083_recovery.c.
.extern VecFx32Object_InitComponents
.extern VecFx32Object_Destroy
.extern VecFx32Object_Assign
.extern Actor_IntegrateMotion
.extern func_ov083_02213968
.extern func_ov083_02213afc
.extern func_ov083_02213b14

.global func_ov083_022139b0
func_ov083_022139b0:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x20
    mov r4, r0
    ldr r1, [r4, #0x29c]
    tst r1, #0x1
    beq .L_02213a78
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x38
    bl func_ov083_02213afc
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x88
    bl func_ov083_02213afc
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x98
    bl func_ov083_02213afc
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x1e0]
    blx r1
    mov r1, #0x0
    mov r3, r0
    add r0, sp, #0x0
    mov r2, r1
    bl VecFx32Object_InitComponents
    ldr r1, [r4, #0x298]
    add r0, sp, #0x10
    add r2, sp, #0x0
    add r1, r1, #0x18
    bl func_ov083_02213b14
    add r0, sp, #0x0
    bl VecFx32Object_Destroy
    add r0, r4, #0x18
    add r1, sp, #0x10
    bl VecFx32Object_Assign
    mov r1, r0
    add r0, r4, #0x28
    bl VecFx32Object_Assign
    ldr r2, [r4, #0x54]
    add r0, sp, #0x10
    ldrh r1, [r2, #0x24]
    orr r1, r1, #0x10
    strh r1, [r2, #0x24]
    bl VecFx32Object_Destroy
    b .L_02213af4
.L_02213a78:
    bic r1, r1, #0x2
    str r1, [r4, #0x29c]
    bl Actor_IntegrateMotion
    ldr r0, [r4, #0x298]
    cmp r0, #0x0
    beq .L_02213af4
    add r1, r4, #0x200
    ldrh r2, [r1, #0xb2]
    cmp r2, #0x0
    beq .L_02213ad0
    sub r0, r2, #0x1
    strh r0, [r1, #0xb2]
    ldrh r0, [r1, #0xb2]
    ldr r1, [r4, #0x54]
    tst r0, #0x4
    ldrneh r0, [r1, #0x24]
    orrne r0, r0, #0x10
    strneh r0, [r1, #0x24]
    ldreqh r0, [r1, #0x24]
    biceq r0, r0, #0x10
    streqh r0, [r1, #0x24]
    b .L_02213af4
.L_02213ad0:
    bl func_ov083_02213968
    ldr r1, [r4, #0x54]
    cmp r0, #0x0
    ldrneh r0, [r1, #0x24]
    orrne r0, r0, #0x10
    strneh r0, [r1, #0x24]
    ldreqh r0, [r1, #0x24]
    biceq r0, r0, #0x10
    streqh r0, [r1, #0x24]
.L_02213af4:
    add sp, sp, #0x20
    ldmia sp!, {r4, pc}
.size func_ov083_022139b0, . - func_ov083_022139b0
