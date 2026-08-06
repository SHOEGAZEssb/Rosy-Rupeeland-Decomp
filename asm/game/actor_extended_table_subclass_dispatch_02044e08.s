; Matching retail form; see src/game/actor_extended_table_subclass_dispatch.c.
.text
.extern func_02040f4c
.global func_02044e08
.type func_02044e08, @function
func_02044e08: ; 0x02044e08
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x2a4]
    mov r4, r1
    cmp r0, #0x0
    beq .L_02044fe8
    ldr r1, [r5, #0x260]
    add r0, r5, #0x200
    bic r1, r1, #0x20
    str r1, [r5, #0x260]
    ldrsh r3, [r0, #0xa8]
    cmp r3, #0x0
    ldreqsh r1, [r0, #0x98]
    ldreqsh r0, [r0, #0x9a]
    cmpeq r1, r0
    beq .L_02044e64
    cmp r3, #0x0
    ble .L_02044ef4
    add r0, r5, #0x200
    ldrsh r1, [r0, #0x98]
    ldrsh r0, [r0, #0xaa]
    cmp r1, r0
    bne .L_02044ef4
.L_02044e64:
    add r1, r5, #0x200
    mov r2, #0x0
    strh r2, [r1, #0x98]
    strh r2, [r1, #0xa0]
    mov r0, r5
    strh r2, [r1, #0x9c]
    ldr r2, [r0, #0x0]
    add r1, r5, #0x18
    ldr r2, [r2, #0xd0]
    blx r2
    add r0, r5, #0x200
    ldrsh r0, [r0, #0x9e]
    cmp r0, #0x0
    bne .L_02044eb0
    mov r0, r5
    ldr r2, [r0, #0x0]
    ldrsb r1, [r4, #0x25]
    ldr r2, [r2, #0x1d4]
    blx r2
.L_02044eb0:
    add r0, r5, #0x200
    ldrsh r1, [r0, #0xa8]
    add r1, r1, #0x1
    strh r1, [r0, #0xa8]
    ldrsh r1, [r0, #0xa8]
    cmp r1, #0x3
    movge r1, #0x0
    strgeh r1, [r0, #0xa8]
    mov r0, #0xd
    strh r0, [r5, #0xd6]
    mov r0, #0x2
    strb r0, [r5, #0x24c]
    ldr r1, [r5, #0xd0]
    mov r0, #0x0
    orr r1, r1, #0x1000
    str r1, [r5, #0xd0]
    ldmia sp!, {r3, r4, r5, pc}
.L_02044ef4:
    add r1, r5, #0x200
    ldrsh r2, [r1, #0x9c]
    ldrsh r0, [r1, #0x9e]
    cmp r2, r0
    bge .L_02044f68
    mov r0, r5
    ldr r2, [r0, #0x0]
    add r1, r5, #0x18
    ldr r2, [r2, #0xd0]
    blx r2
    add r0, r5, #0x200
    ldrsh r1, [r0, #0x9c]
    add r1, r1, #0x1
    strh r1, [r0, #0x9c]
    ldrsh r1, [r0, #0x9c]
    ldrsh r0, [r0, #0x9e]
    cmp r1, r0
    bne .L_02044f50
    mov r0, r5
    ldr r2, [r0, #0x0]
    ldrsb r1, [r4, #0x25]
    ldr r2, [r2, #0x1d4]
    blx r2
.L_02044f50:
    mov r0, #0xd
    strh r0, [r5, #0xd6]
    mov r0, #0x2
    strb r0, [r5, #0x24c]
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_02044f68:
    cmp r3, #0x0
    bne .L_02044fb4
    ldrsh r2, [r1, #0xa0]
    ldrsh r0, [r1, #0xa2]
    cmp r2, r0
    bge .L_02044fb4
    add r2, r2, #0x1
    strh r2, [r1, #0xa0]
    mov r0, r5
    ldr r2, [r0, #0x0]
    add r1, r5, #0x18
    ldr r2, [r2, #0xd0]
    blx r2
    mov r0, #0xd
    strh r0, [r5, #0xd6]
    mov r0, #0x2
    strb r0, [r5, #0x24c]
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_02044fb4:
    add r0, r5, #0x200
    ldrsh r1, [r0, #0x98]
    add r1, r1, #0x1
    strh r1, [r0, #0x98]
    ldrsh r0, [r0, #0xa8]
    cmp r0, #0x0
    ble .L_02044fe8
    mov r0, #0xd
    strh r0, [r5, #0xd6]
    mov r0, #0x2
    strb r0, [r5, #0x24c]
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_02044fe8:
    ldr r1, [r5, #0x260]
    mov r0, r5
    orr r2, r1, #0x20
    mov r1, r4
    str r2, [r5, #0x260]
    bl func_02040f4c
    ldmia sp!, {r3, r4, r5, pc}
.size func_02044e08, . - func_02044e08
