.text

/* Exact fallback; see src/overlays/ov025/overlay025_effect_runtime.c. */
.extern func_020740a4
.extern func_020918f4
.extern func_020948e4
.extern func_02094dd4
.extern func_02095224
.extern func_ov025_021fe174
.extern func_ov025_021fe340
.extern func_ov025_021fe39c
.extern func_ov025_021fe3f8
.extern func_ov025_021fe444
.extern func_ov025_021fe4cc
.extern func_ov025_021fe91c
.extern func_ov025_021ff0b0


    .global func_ov025_021feb4c
func_ov025_021feb4c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0xe0]
    ldr r1, [r1, #0x20]
    cmp r1, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    bl func_02094dd4
    ldr r0, [r4, #0x9c]
    cmp r0, #0xb
    addls pc, pc, r0, lsl #0x2
    b L_021ff098
L_021feb7c: ; jump table
    b L_021febac ; case 0
    b L_021ff034 ; case 1
    b L_021febc8 ; case 2
    b L_021febf0 ; case 3
    b L_021fec88 ; case 4
    b L_021febc8 ; case 5
    b L_021fed40 ; case 6
    b L_021fedd8 ; case 7
    b L_021feecc ; case 8
    b L_021ff098 ; case 9
    b L_021fef64 ; case 10
    b L_021fef88 ; case 11
L_021febac:
    mov r0, r4
    bl func_02095224
    cmp r0, #0x0
    beq L_021ff098
    mov r0, r4
    bl func_ov025_021fe3f8
    b L_021ff098
L_021febc8:
    mov r0, r4
    bl func_ov025_021ff0b0
    cmp r0, #0x0
    beq L_021ff098
    ldr r1, [r4, #0xa4]
    mov r0, r4
    rsb r1, r1, #0x1
    str r1, [r4, #0xa4]
    bl func_ov025_021fe3f8
    b L_021ff098
L_021febf0:
    ldr r0, [r4, #0xa0]
    cmp r0, #0x0
    beq L_021fec10
    cmp r0, #0x1
    beq L_021fec38
    cmp r0, #0x2
    beq L_021fec60
    b L_021ff098
L_021fec10:
    mov r0, r4
    bl func_ov025_021ff0b0
    cmp r0, #0x0
    beq L_021ff098
    mov r0, r4
    bl func_ov025_021fe444
    ldr r0, [r4, #0xa0]
    add r0, r0, #0x1
    str r0, [r4, #0xa0]
    b L_021ff098
L_021fec38:
    mov r0, r4
    bl func_ov025_021ff0b0
    cmp r0, #0x0
    beq L_021ff098
    mov r0, r4
    bl func_ov025_021fe91c
    ldr r0, [r4, #0xa0]
    add r0, r0, #0x1
    str r0, [r4, #0xa0]
    b L_021ff098
L_021fec60:
    mov r0, r4
    bl func_ov025_021ff0b0
    cmp r0, #0x0
    beq L_021ff098
    ldr r1, [r4, #0xa4]
    mov r0, r4
    rsb r1, r1, #0x1
    str r1, [r4, #0xa4]
    bl func_ov025_021fe3f8
    b L_021ff098
L_021fec88:
    ldr r0, [r4, #0xa0]
    cmp r0, #0x0
    beq L_021feca8
    cmp r0, #0x1
    beq L_021fecf0
    cmp r0, #0x2
    beq L_021fed18
    b L_021ff098
L_021feca8:
    mov r0, r4
    bl func_ov025_021ff0b0
    cmp r0, #0x0
    beq L_021ff098
    mov r0, r4
    bl func_ov025_021fe340
    add r0, r4, #0x1c
    mov r1, #0x2
    mov r2, #0x60000
    bl func_020948e4
    mov r0, #0x3c
    str r0, [r4, #0x7c]
    mov r0, #0x0
    str r0, [r4, #0x80]
    ldr r0, [r4, #0xa0]
    add r0, r0, #0x1
    str r0, [r4, #0xa0]
    b L_021ff098
L_021fecf0:
    mov r0, r4
    bl func_ov025_021ff0b0
    cmp r0, #0x0
    beq L_021ff098
    mov r0, r4
    bl func_ov025_021fe91c
    ldr r0, [r4, #0xa0]
    add r0, r0, #0x1
    str r0, [r4, #0xa0]
    b L_021ff098
L_021fed18:
    mov r0, r4
    bl func_ov025_021ff0b0
    cmp r0, #0x0
    beq L_021ff098
    ldr r1, [r4, #0xa4]
    mov r0, r4
    rsb r1, r1, #0x1
    str r1, [r4, #0xa4]
    bl func_ov025_021fe3f8
    b L_021ff098
L_021fed40:
    ldr r0, [r4, #0xa0]
    cmp r0, #0x0
    beq L_021fed60
    cmp r0, #0x1
    beq L_021fed88
    cmp r0, #0x2
    beq L_021fedb0
    b L_021ff098
L_021fed60:
    mov r0, r4
    bl func_ov025_021ff0b0
    cmp r0, #0x0
    beq L_021ff098
    mov r0, r4
    bl func_ov025_021fe444
    ldr r0, [r4, #0xa0]
    add r0, r0, #0x1
    str r0, [r4, #0xa0]
    b L_021ff098
L_021fed88:
    mov r0, r4
    bl func_ov025_021ff0b0
    cmp r0, #0x0
    beq L_021ff098
    mov r0, r4
    bl func_ov025_021fe91c
    ldr r0, [r4, #0xa0]
    add r0, r0, #0x1
    str r0, [r4, #0xa0]
    b L_021ff098
L_021fedb0:
    mov r0, r4
    bl func_ov025_021ff0b0
    cmp r0, #0x0
    beq L_021ff098
    ldr r1, [r4, #0xa4]
    mov r0, r4
    rsb r1, r1, #0x1
    str r1, [r4, #0xa4]
    bl func_ov025_021fe3f8
    b L_021ff098
L_021fedd8:
    ldr r0, [r4, #0xa0]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b L_021ff098
L_021fede8: ; jump table
    b L_021fedf8 ; case 0
    b L_021fee40 ; case 1
    b L_021fee74 ; case 2
    b L_021feea4 ; case 3
L_021fedf8:
    mov r0, r4
    bl func_ov025_021ff0b0
    cmp r0, #0x0
    beq L_021ff098
    mov r0, r4
    bl func_ov025_021fe39c
    add r0, r4, #0x1c
    mov r1, #0x5
    mov r2, #0xa0000
    bl func_020948e4
    mov r0, #0x1e
    str r0, [r4, #0x7c]
    mov r0, #0x0
    str r0, [r4, #0x80]
    ldr r0, [r4, #0xa0]
    add r0, r0, #0x1
    str r0, [r4, #0xa0]
    b L_021ff098
L_021fee40:
    mov r0, r4
    bl func_ov025_021ff0b0
    cmp r0, #0x0
    beq L_021ff098
    mov r0, r4
    mov r1, #0x2
    mov r2, #0x14
    mov r3, #0x0
    bl func_ov025_021fe174
    ldr r0, [r4, #0xa0]
    add r0, r0, #0x1
    str r0, [r4, #0xa0]
    b L_021ff098
L_021fee74:
    ldr r0, [r4, #0xe8]
    ldrh r0, [r0, #0x24]
    and r0, r0, #0x1
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    beq L_021ff098
    mov r0, r4
    bl func_ov025_021fe91c
    ldr r0, [r4, #0xa0]
    add r0, r0, #0x1
    str r0, [r4, #0xa0]
    b L_021ff098
L_021feea4:
    mov r0, r4
    bl func_ov025_021ff0b0
    cmp r0, #0x0
    beq L_021ff098
    ldr r1, [r4, #0xa4]
    mov r0, r4
    rsb r1, r1, #0x1
    str r1, [r4, #0xa4]
    bl func_ov025_021fe3f8
    b L_021ff098
L_021feecc:
    ldr r0, [r4, #0xa0]
    cmp r0, #0x0
    beq L_021feee4
    cmp r0, #0x1
    beq L_021fef30
    b L_021ff098
L_021feee4:
    mov r0, r4
    bl func_ov025_021ff0b0
    cmp r0, #0x0
    beq L_021ff098
    mov r0, r4
    bl func_ov025_021fe340
    mov r2, #0x120000
    add r0, r4, #0x1c
    rsb r2, r2, #0x0
    mov r1, #0x2
    bl func_020948e4
    mov r0, #0x5a
    str r0, [r4, #0x7c]
    mov r0, #0x0
    str r0, [r4, #0x80]
    ldr r0, [r4, #0xa0]
    add r0, r0, #0x1
    str r0, [r4, #0xa0]
    b L_021ff098
L_021fef30:
    mov r0, r4
    bl func_ov025_021ff0b0
    cmp r0, #0x0
    beq L_021ff098
    add r0, r4, #0xf8
    mov r1, #0x2
    bl func_020918f4
    str r0, [r4, #0xa4]
    mov r0, r4
    mov r1, #0xa
    mov r2, #0x0
    bl func_ov025_021fe4cc
    b L_021ff098
L_021fef64:
    mov r0, r4
    bl func_ov025_021ff0b0
    cmp r0, #0x0
    beq L_021ff098
    mov r0, r4
    mov r1, #0xb
    mov r2, #0x0
    bl func_ov025_021fe4cc
    b L_021ff098
L_021fef88:
    ldr r0, [r4, #0xa0]
    cmp r0, #0x0
    beq L_021fefa8
    cmp r0, #0x1
    beq L_021fefdc
    cmp r0, #0x2
    beq L_021ff00c
    b L_021ff098
L_021fefa8:
    mov r0, r4
    bl func_ov025_021ff0b0
    cmp r0, #0x0
    beq L_021ff098
    mov r0, r4
    mov r1, #0x2
    mov r2, #0x14
    mov r3, #0x0
    bl func_ov025_021fe174
    ldr r0, [r4, #0xa0]
    add r0, r0, #0x1
    str r0, [r4, #0xa0]
    b L_021ff098
L_021fefdc:
    ldr r0, [r4, #0xe8]
    ldrh r0, [r0, #0x24]
    and r0, r0, #0x1
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    beq L_021ff098
    mov r0, r4
    bl func_ov025_021fe91c
    ldr r0, [r4, #0xa0]
    add r0, r0, #0x1
    str r0, [r4, #0xa0]
    b L_021ff098
L_021ff00c:
    mov r0, r4
    bl func_ov025_021ff0b0
    cmp r0, #0x0
    beq L_021ff098
    ldr r1, [r4, #0xa4]
    mov r0, r4
    rsb r1, r1, #0x1
    str r1, [r4, #0xa4]
    bl func_ov025_021fe3f8
    b L_021ff098
L_021ff034:
    ldr r0, [r4, #0xa0]
    cmp r0, #0x0
    beq L_021ff04c
    cmp r0, #0x1
    beq L_021ff074
    b L_021ff098
L_021ff04c:
    mov r0, r4
    bl func_ov025_021ff0b0
    cmp r0, #0x0
    beq L_021ff098
    mov r0, r4
    bl func_ov025_021fe91c
    ldr r0, [r4, #0xa0]
    add r0, r0, #0x1
    str r0, [r4, #0xa0]
    b L_021ff098
L_021ff074:
    mov r0, r4
    bl func_ov025_021ff0b0
    cmp r0, #0x0
    beq L_021ff098
    ldr r1, [r4, #0xa4]
    mov r0, r4
    rsb r1, r1, #0x1
    str r1, [r4, #0xa4]
    bl func_ov025_021fe3f8
L_021ff098:
    ldr r0, [r4, #0xe0]
    bl func_020740a4
    ldr r0, [r4, #0xe4]
    bl func_020740a4
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.size func_ov025_021feb4c, .-func_ov025_021feb4c

