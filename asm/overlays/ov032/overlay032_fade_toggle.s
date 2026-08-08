.text

/* Exact fallback; see src/overlays/ov032/overlay032_input_runtime.c for documented portable C. */
.extern func_02002ac0
.extern func_02002cd0

    .global func_ov032_021fe23c
func_ov032_021fe23c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    cmp r1, #0x0
    beq L_021fe280
    ldr r0, [r4, #0xbc8]
    cmp r0, #0x0
    bne L_021fe280
    ldr r0, [r4, #0xbe0]
    bl func_02002cd0
    mov r1, r0
    ldr r0, [r4, #0xbe0]
    mvn r2, #0x7
    mov r3, #0x8
    bl func_02002ac0
    mov r0, #0x1
    str r0, [r4, #0xbc8]
    ldmia sp!, {r4, pc}
L_021fe280:
    cmp r1, #0x0
    ldmneia sp!, {r4, pc}
    ldr r0, [r4, #0xbc8]
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, [r4, #0xbe0]
    bl func_02002cd0
    mov r1, r0
    ldr r0, [r4, #0xbe0]
    mov r2, #0x0
    mov r3, #0x8
    bl func_02002ac0
    mov r0, #0x0
    str r0, [r4, #0xbc8]
    ldmia sp!, {r4, pc}
.size func_ov032_021fe23c, .-func_ov032_021fe23c

