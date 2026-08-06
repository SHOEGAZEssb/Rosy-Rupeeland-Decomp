; Matching retail form; see src/game/actor_derived_type1_auxiliary_motion.c.
.text
.extern GameWork_ClearFlag
.extern Heap_Free
.extern data_020df254
.extern data_020df258
.extern func_02010b64
.extern func_02035bc8
.extern func_0206c978
.extern func_0206cd10
.extern func_0206e3a4
.extern func_020adae4
.extern gGameWork
.extern gLupyContext
.extern gSystemState

    .global func_02037bb0
    .type func_02037bb0, @function
func_02037bb0: ; 0x02037bb0
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r0
    ldr r0, [r5, #0x230]
    bic r0, r0, #0x1
    orr r0, r0, #0x2
    str r0, [r5, #0x230]
    ldr r0, [r5, #0x26c]
    bl func_0206cd10
    movs r4, r0
    ldr r1, [r5, #0x10]
    mov r0, r5
    beq .L_02037bfc
    orr r1, r1, #0xa0000
    str r1, [r5, #0x10]
    ldr r2, [r0, #0x0]
    mov r1, #0x1
    ldr r2, [r2, #0x54]
    blx r2
    b .L_02037c14
.L_02037bfc:
    bic r1, r1, #0x1f0000
    str r1, [r5, #0x10]
    ldr r2, [r0, #0x0]
    mov r1, #0x0
    ldr r2, [r2, #0x54]
    blx r2
.L_02037c14:
    cmp r4, #0x2
    bne .L_02037c6c
    ldr r0, .L_02037d80
    ldr r0, [r0, #0x0]
    bl func_02010b64
    cmp r0, #0x0
    ldrgt r0, [r5, #0x10]
    bicgt r0, r0, #0x1f0000
    strgt r0, [r5, #0x10]
    ldr r6, [r5, #0x26c]
    cmp r6, #0x0
    beq .L_02037c54
    mov r0, r6
    bl func_0206c978
    mov r0, r6
    bl Heap_Free
.L_02037c54:
    mov r1, #0x0
    ldr r0, .L_02037d84
    str r1, [r5, #0x26c]
    ldr r0, [r0, #0x0]
    ldr r1, .L_02037d88
    bl GameWork_ClearFlag
.L_02037c6c:
    cmp r4, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    ldr r0, [r5, #0xd0]
    tst r0, #0x100
    ldmneia sp!, {r4, r5, r6, pc}
    ldr r0, [r5, #0x26c]
    bl func_0206e3a4
    cmp r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    mov r0, r5
    bl func_02035bc8
    cmp r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    add r0, r5, #0x200
    ldrsh r2, [r0, #0x68]
    cmp r2, #0x0
    ble .L_02037cd0
    ldr r1, [r5, #0x230]
    tst r1, #0x40000
    subeq r1, r2, #0x1
    streqh r1, [r0, #0x68]
    mov r0, #0x0
    str r0, [r5, #0x3c]
    str r0, [r5, #0x40]
    ldmia sp!, {r4, r5, r6, pc}
.L_02037cd0:
    ldr r0, .L_02037d8c
    ldrh r0, [r0, #0x1a]
    tst r0, #0xf0
    beq .L_02037d70
    tst r0, #0x20
    beq .L_02037d04
    tst r0, #0x40
    movne r4, #0x3
    bne .L_02037d34
    tst r0, #0x80
    movne r4, #0x1
    moveq r4, #0x2
    b .L_02037d34
.L_02037d04:
    tst r0, #0x10
    beq .L_02037d28
    tst r0, #0x40
    movne r4, #0x5
    bne .L_02037d34
    tst r0, #0x80
    movne r4, #0x7
    moveq r4, #0x6
    b .L_02037d34
.L_02037d28:
    tst r0, #0x40
    movne r4, #0x4
    moveq r4, #0x0
.L_02037d34:
    ldr r1, .L_02037d90
    mov r0, #0x60
    ldr r2, [r1, r4, lsl #0x3]
    mov r1, #0x80
    mul r0, r2, r0
    bl func_020adae4
    str r0, [r5, #0x3c]
    ldr r1, .L_02037d94
    mov r0, #0x60
    ldr r1, [r1, r4, lsl #0x3]
    mul r0, r1, r0
    mov r1, #0x80
    bl func_020adae4
    str r0, [r5, #0x40]
    ldmia sp!, {r4, r5, r6, pc}
.L_02037d70:
    mov r0, #0x0
    str r0, [r5, #0x40]
    str r0, [r5, #0x3c]
    ldmia sp!, {r4, r5, r6, pc}
.L_02037d80: .word gLupyContext
.L_02037d84: .word gGameWork
.L_02037d88: .word 0x3ee
.L_02037d8c: .word gSystemState
.L_02037d90: .word data_020df254
.L_02037d94: .word data_020df258
    .size func_02037bb0, . - func_02037bb0

