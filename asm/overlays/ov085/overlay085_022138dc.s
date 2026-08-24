.text
; Matching fallback for the portable implementation in src/overlays/ov085/overlay085_recovery.c.
.extern gFx32CosSinTable
.extern VecFx32Object_Destroy
.extern VecFx32Object_Assign
.extern Fx32Vector2_Magnitude
.extern func_020ae024
.extern func_020befec
.extern func_ov085_02213a38

.global func_ov085_022138dc
func_ov085_022138dc:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x10
    mov r5, r0
    add r0, r5, #0x78
    bl VecFx32Object_Assign
    add r0, sp, #0x0
    add r1, r5, #0x78
    add r2, r5, #0x18
    bl func_ov085_02213a38
    ldr r0, [sp, #0x4]
    ldr r1, [sp, #0x8]
    bl Fx32Vector2_Magnitude
    cmp r0, #0x4000
    ble .L_02213994
    ldr r0, [r5, #0xd0]
    tst r0, #0x2
    ldrne r4, [r5, #0x228]
    movne r0, #0x6
    ldreq r4, [r5, #0x224]
    moveq r0, #0x5
    strh r0, [r5, #0xd6]
    ldr r0, [r5, #0x14]
    tst r0, #0x40
    beq .L_0221394c
    mov r0, r4
    mov r1, #0xa
    bl func_020befec
    mov r4, r0
.L_0221394c:
    ldr r0, [sp, #0x8]
    ldr r1, [sp, #0x4]
    bl func_020ae024
    mov r0, r0, asr #0x4
    mov r3, r0, lsl #0x1
    add r0, r3, #0x1
    ldr r2, .L_02213a34
    mov r1, r0, lsl #0x1
    mov r0, r3, lsl #0x1
    ldrsh r1, [r2, r1]
    ldrsh r0, [r2, r0]
    mul r1, r4, r1
    mul r0, r4, r0
    mov r1, r1, asr #0xc
    str r1, [r5, #0x3c]
    mov r0, r0, asr #0xc
    str r0, [r5, #0x40]
    b .L_022139d4
.L_02213994:
    ldrsh r0, [r5, #0xd8]
    cmp r0, #0x6
    bne .L_022139c0
    ldr r0, [r5, #0x3c]
    add r0, r0, r0, lsr #0x1f
    mov r0, r0, asr #0x1
    str r0, [r5, #0x8c]
    ldr r0, [r5, #0x40]
    add r0, r0, r0, lsr #0x1f
    mov r0, r0, asr #0x1
    str r0, [r5, #0x90]
.L_022139c0:
    mov r0, #0x0
    str r0, [r5, #0x40]
    str r0, [r5, #0x3c]
    mov r0, #0x1
    strh r0, [r5, #0xd6]
.L_022139d4:
    ldr r0, [r5, #0x14]
    tst r0, #0x40
    bne .L_022139f4
    ldr r1, [r5, #0x1dc]
    ldr r0, [r5, #0x24]
    cmp r1, r0
    movlt r0, #0x7
    strlth r0, [r5, #0xd6]
.L_022139f4:
    ldr r0, [r5, #0xd0]
    tst r0, #0x4
    beq .L_02213a24
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x30]
    blx r1
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r5, #0x94]
    strne r0, [r5, #0x90]
    strne r0, [r5, #0x8c]
.L_02213a24:
    add r0, sp, #0x0
    bl VecFx32Object_Destroy
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, pc}
.L_02213a34: .word gFx32CosSinTable
.size func_ov085_022138dc, . - func_ov085_022138dc
