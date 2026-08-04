; Matching retail form; see src/game/game_phase_region_table_queries.c.
.text
.extern func_02011738

    .global func_02011794
func_02011794: ; 0x02011794
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    ldr r0, [r0, #0x0]
    mov r8, r2
    add r7, r0, r1, lsl #0x3
    ldrsh r1, [r8, #0x0]
    ldrsh r2, [r8, #0x2]
    mov r0, r7
    bl func_02011738
    mov r4, r0
    ldrsh r1, [r8, #0x4]
    ldrsh r2, [r8, #0x2]
    mov r0, r7
    bl func_02011738
    mov r5, r0
    ldrsh r1, [r8, #0x0]
    ldrsh r2, [r8, #0x6]
    mov r0, r7
    bl func_02011738
    mov r6, r0
    ldrsh r1, [r8, #0x4]
    ldrsh r2, [r8, #0x6]
    mov r0, r7
    bl func_02011738
    and r2, r4, r5
    and r1, r6, r2
    tst r0, r1
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    ands r1, r4, r6
    bne L_02011818
    tst r5, r0
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
L_02011818:
    cmp r1, #0x0
    beq L_0201182c
    tst r5, r0
    moveq r0, #0x2
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
L_0201182c:
    cmp r2, #0x0
    bne L_02011840
    tst r6, r0
    movne r0, #0x3
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
L_02011840:
    cmp r2, #0x0
    beq L_02011854
    tst r6, r0
    moveq r0, #0x4
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
L_02011854:
    mvn r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
    .size func_02011794, . - func_02011794

