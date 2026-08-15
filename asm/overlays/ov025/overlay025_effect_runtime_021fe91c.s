.text

/* Exact fallback; see src/overlays/ov025/overlay025_effect_return_config.c. */
.extern func_020918f4
.extern PresentationScalar_TransitionTo
.extern func_ov025_021fe174
.extern func_ov025_021fe248
.extern func_ov025_021fe2c4


    .global func_ov025_021fe91c
func_ov025_021fe91c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0xf8
    mov r1, #0x2
    bl func_020918f4
    str r0, [r4, #0xa4]
    ldr r1, [r4, #0xec]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x4
    strh r0, [r1, #0x24]
    ldr r1, [r4, #0xf4]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x4
    strh r0, [r1, #0x24]
    ldr r0, [r4, #0x9c]
    cmp r0, #0xb
    addls pc, pc, r0, lsl #0x2
    ldmia sp!, {r4, pc}
L_021fe964: ; jump table
    ldmia sp!, {r4, pc} ; case 0
    b L_021fea90 ; case 1
    ldmia sp!, {r4, pc} ; case 2
    b L_021fe994 ; case 3
    b L_021fea2c ; case 4
    ldmia sp!, {r4, pc} ; case 5
    b L_021fea2c ; case 6
    b L_021fe994 ; case 7
    ldmia sp!, {r4, pc} ; case 8
    ldmia sp!, {r4, pc} ; case 9
    ldmia sp!, {r4, pc} ; case 10
    b L_021fe994 ; case 11
L_021fe994:
    ldr r0, [r4, #0xa4]
    ldr r2, [r4, #0xac]
    cmp r0, #0x0
    mov r1, #0x1
    mov r0, r4
    beq L_021fe9cc
    mov r3, #0x2
    bl func_ov025_021fe174
    mov r2, #0x20000
    add r0, r4, #0xc
    rsb r2, r2, #0x0
    mov r1, #0x2
    bl PresentationScalar_TransitionTo
    b L_021fe9e4
L_021fe9cc:
    mov r3, #0x42
    bl func_ov025_021fe174
    add r0, r4, #0xc
    mov r1, #0x2
    mov r2, #0x120000
    bl PresentationScalar_TransitionTo
L_021fe9e4:
    ldr r0, [r4, #0xac]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    ldmia sp!, {r4, pc}
L_021fe9f4: ; jump table
    b L_021fea04 ; case 0
    b L_021fea18 ; case 1
    b L_021fea18 ; case 2
    b L_021fea04 ; case 3
L_021fea04:
    mov r0, #0x78
    str r0, [r4, #0x7c]
    mov r0, #0x0
    str r0, [r4, #0x80]
    ldmia sp!, {r4, pc}
L_021fea18:
    mov r0, #0x3c
    str r0, [r4, #0x7c]
    mov r0, #0x0
    str r0, [r4, #0x80]
    ldmia sp!, {r4, pc}
L_021fea2c:
    ldr r0, [r4, #0xa4]
    cmp r0, #0x0
    mov r0, r4
    beq L_021fea58
    bl func_ov025_021fe248
    mov r2, #0x20000
    add r0, r4, #0xc
    rsb r2, r2, #0x0
    mov r1, #0x2
    bl PresentationScalar_TransitionTo
    b L_021fea6c
L_021fea58:
    bl func_ov025_021fe2c4
    add r0, r4, #0xc
    mov r1, #0x2
    mov r2, #0x120000
    bl PresentationScalar_TransitionTo
L_021fea6c:
    add r0, r4, #0x1c
    mov r1, #0x2
    mov r2, #0x40000
    bl PresentationScalar_TransitionTo
    mov r0, #0x78
    str r0, [r4, #0x7c]
    mov r0, #0x0
    str r0, [r4, #0x80]
    ldmia sp!, {r4, pc}
L_021fea90:
    ldr r0, [r4, #0xa4]
    mov r1, #0x1
    cmp r0, #0x0
    mov r0, r4
    beq L_021feac8
    mov r2, r1
    mov r3, #0x2
    bl func_ov025_021fe174
    mov r2, #0x20000
    add r0, r4, #0xc
    rsb r2, r2, #0x0
    mov r1, #0x1
    bl PresentationScalar_TransitionTo
    b L_021feae4
L_021feac8:
    mov r2, r1
    mov r3, #0x42
    bl func_ov025_021fe174
    add r0, r4, #0xc
    mov r1, #0x1
    mov r2, #0x120000
    bl PresentationScalar_TransitionTo
L_021feae4:
    add r0, r4, #0x1c
    mov r1, #0x3
    mov r2, #0x40000
    bl PresentationScalar_TransitionTo
    mov r0, #0x5a
    str r0, [r4, #0x7c]
    mov r0, #0x0
    str r0, [r4, #0x80]
    ldmia sp!, {r4, pc}
.size func_ov025_021fe91c, .-func_ov025_021fe91c

