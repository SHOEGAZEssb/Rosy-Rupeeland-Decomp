.text
; Matching fallback for the portable implementation in src/overlays/ov077/overlay077_recovery.c.
.extern VecFx32Object_InitCopy
.extern VecFx32Object_Destroy
.extern func_020349b8
.extern Fx32Vector2_Magnitude
.extern func_02053f9c
.extern func_020adc90
.extern func_ov077_02214c7c

.global func_ov077_02214ce4
func_ov077_02214ce4:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x10
    mov r6, r0
    mov r5, r1
    add r0, sp, #0x0
    add r1, r6, #0x18
    bl VecFx32Object_InitCopy
    ldr r0, [r6, #0x2d0]
    add r1, sp, #0x0
    ldrsh r0, [r0, #0x0]
    mov r2, #0x0
    bl func_02053f9c
    mov r4, r0
    mov r0, #0x10000
    ldr r1, [r4, #0x5c]
    rsb r0, r0, #0x0
    and r0, r1, r0
    orr r0, r0, #0x3d8
    orr r0, r0, #0xfc00
    str r0, [r4, #0x5c]
    ldr r0, [sp, #0x4]
    ldmib r5, {r1, r2}
    sub r5, r1, r0
    ldr r1, [sp, #0x8]
    mov r0, r5
    sub r8, r2, r1
    mov r1, r8
    bl Fx32Vector2_Magnitude
    mov r7, r0
    cmp r7, #0x1000
    ble .L_02214da4
    mov r0, r5
    mov r1, r7
    bl func_020adc90
    mov r5, r0
    mov r0, r8
    mov r1, r7
    bl func_020adc90
    ldr r1, [r6, #0x8c]
    add r2, r5, r5, lsl #0x1
    sub r1, r1, r5
    str r1, [r6, #0x8c]
    ldr r3, [r6, #0x90]
    add r1, r0, r0, lsl #0x1
    sub r0, r3, r0
    str r0, [r6, #0x90]
    str r2, [r4, #0x3c]
    str r1, [r4, #0x40]
.L_02214da4:
    ldr r1, .L_02214df8
    add r0, r6, #0x200
    str r1, [r4, #0x44]
    ldrsb r0, [r0, #0xe4]
    mov r0, r0, lsl #0x1c
    movs r0, r0, asr #0x1c
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_02214dd8
    add r0, r4, #0x38
    mov r1, #0x2000
    bl func_ov077_02214c7c
.L_02214dd8:
    ldr r1, .L_02214dfc
    mov r0, r6
    mov r2, #0x0
    bl func_020349b8
    add r0, sp, #0x0
    bl VecFx32Object_Destroy
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_02214df8: .word 0x2ccd
.L_02214dfc: .word 0x9f81
.size func_ov077_02214ce4, . - func_ov077_02214ce4
