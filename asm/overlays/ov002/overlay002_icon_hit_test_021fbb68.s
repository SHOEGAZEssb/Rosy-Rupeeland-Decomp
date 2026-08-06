    .text
    .extern func_02073aa8
    .extern func_02072b68
    .global func_ov002_021fbb68
func_ov002_021fbb68: ; 0x021fbb68
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r1
    mov r4, #0x0
    b L_021fbc44
L_021fbb7c:
    add r0, r6, r4, lsl #0x2
    ldr r0, [r0, #0x34]
    ldmib r5, {r1, r2}
    bl func_02073aa8
    cmp r0, #0x0
    beq L_021fbc40
    add r3, r6, r4, lsl #0x2
    ldr r2, [r3, #0x34]
    ldrsh r0, [r2, #0x2e]
    ldrsh r1, [r2, #0x2c]
    add r0, r0, #0x2
    strh r1, [r2, #0x2c]
    strh r0, [r2, #0x2e]
    ldr r0, [r3, #0x34]
    ldmib r5, {r1, r2}
    bl func_02073aa8
    cmp r0, #0x0
    beq L_021fbc20
    str r4, [r6, #0x8c]
    mov r0, #0x4
    str r0, [r6, #0x94]
    ldr r0, [r6, #0x8c]
    cmp r0, #0xa
    addls pc, pc, r0, lsl #0x2
    b L_021fbc18
L_021fbbe0: ; jump table
    b L_021fbc0c ; case 0
    b L_021fbc0c ; case 1
    b L_021fbc0c ; case 2
    b L_021fbc0c ; case 3
    b L_021fbc0c ; case 4
    b L_021fbc0c ; case 5
    b L_021fbc0c ; case 6
    b L_021fbc0c ; case 7
    b L_021fbc0c ; case 8
    b L_021fbc0c ; case 9
    b L_021fbc0c ; case 10
L_021fbc0c:
    ldr r0, [r6, #0x78]
    mov r1, #0x1c
    bl func_02072b68
L_021fbc18:
    mov r0, r4
    ldmia sp!, {r4, r5, r6, pc}
L_021fbc20:
    add r0, r6, r4, lsl #0x2
    ldr r2, [r0, #0x34]
    ldrsh r0, [r2, #0x2e]
    ldrsh r1, [r2, #0x2c]
    sub r0, r0, #0x2
    strh r1, [r2, #0x2c]
    strh r0, [r2, #0x2e]
    b L_021fbc4c
L_021fbc40:
    add r4, r4, #0x1
L_021fbc44:
    cmp r4, #0xe
    blt L_021fbb7c
L_021fbc4c:
    mvn r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
    .size func_ov002_021fbb68, .-func_ov002_021fbb68

