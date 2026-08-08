.text

/* Exact fallback; see src/overlays/ov025/overlay025_record_delete_states.c. */
.extern data_ov025_02202e70
.extern data_ov025_02202e78
.extern func_0207f248
.extern func_020802f4
.extern func_02092260
.extern func_02095dd4
.extern func_ov025_021ff254
.extern func_ov025_02200178
.extern func_ov025_022001f4
.extern func_ov025_02200224
.extern func_ov025_022002b0
.extern func_ov025_02200398
.extern func_ov025_02200438
.extern func_ov025_02200468
.extern func_ov025_02200480
.extern func_ov025_022006c4
.extern gRuntimeContext


    .global func_ov025_02201cfc
func_ov025_02201cfc:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x4]
    cmp r1, #0x4
    addls pc, pc, r1, lsl #0x2
    b L_02201eb0
L_02201d14: ; jump table
    b L_02201d28 ; case 0
    b L_02201d38 ; case 1
    b L_02201d9c ; case 2
    b L_02201e1c ; case 3
    b L_02201e70 ; case 4
L_02201d28:
    add r0, r1, #0x1
    str r0, [r4, #0x4]
    mov r0, #0x0
    str r0, [r4, #0x8]
L_02201d38:
    ldr r1, [r4, #0x20]
    ldr r0, [r4, #0x59c]
    mov r2, r1, lsl #0x1a
    add r1, r4, #0x30
    mov r2, r2, asr #0x1f
    bl func_02095dd4
    cmp r0, #0x0
    blt L_02201eb0
    mov r0, r4
    bl func_ov025_022002b0
    mov r0, r4
    mov r1, #0x5
    mov r2, #0x3
    bl func_ov025_02200398
    ldr r0, L_02201ec0
    ldr r1, [r4, #0x54]
    ldr r0, [r0, #0x0]
    mov r2, #0x1
    bl func_020802f4
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_02201eb0
L_02201d9c:
    ldr r0, L_02201ec0
    ldr r0, [r0, #0x0]
    bl func_0207f248
    cmp r0, #0x0
    beq L_02201eb0
    mvn r1, #0x0
    cmp r0, r1
    mov r0, r4
    bne L_02201e00
    mov r1, #0x1
    bl func_ov025_02200438
    ldr r0, L_02201ec0
    ldr r0, [r0, #0x0]
    ldr r0, [r0, #0x10]
    cmp r0, #0x4
    bne L_02201eb0
    mov r0, r4
    mov r1, #0x1f
    mov r2, #0x0
    bl func_ov025_02200224
    ldr r1, L_02201ec4
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov025_021ff254
    b L_02201eb0
L_02201e00:
    bl func_ov025_02200468
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_02201eb0
L_02201e1c:
    bl func_ov025_02200480
    cmp r0, #0x0
    beq L_02201eb0
    mov r0, r4
    bl func_ov025_022006c4
    mov r0, r4
    mov r1, #0x0
    bl func_ov025_02200438
    mov r0, r4
    mov r1, #0x16
    mov r2, #0x0
    bl func_ov025_02200224
    ldr r1, L_02201ec8
    mov r0, r4
    bl func_02092260
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_02201eb0
L_02201e70:
    ldr r1, [r4, #0x20]
    ldr r0, [r4, #0x59c]
    mov r2, r1, lsl #0x1a
    add r1, r4, #0x30
    mov r2, r2, asr #0x1f
    bl func_02095dd4
    cmp r0, #0x0
    blt L_02201eb0
    mov r0, r4
    bl func_ov025_022002b0
    mov r0, r4
    bl func_ov025_022001f4
    ldr r1, L_02201ecc
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov025_021ff254
L_02201eb0:
    mov r0, r4
    bl func_ov025_02200178
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_02201ec0: .word gRuntimeContext
L_02201ec4: .word data_ov025_02202e78
L_02201ec8: .word 0x2d03
L_02201ecc: .word data_ov025_02202e70
.size func_ov025_02201cfc, .-func_ov025_02201cfc

