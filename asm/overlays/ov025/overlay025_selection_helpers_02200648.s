.text

/* Exact fallback; see src/overlays/ov025/overlay025_selection_helpers.c. */
.extern func_ov025_021fd9e4
.extern func_ov025_021fdb18
.extern func_ov025_021fdc4c
.extern func_ov025_02200498
.extern func_ov025_02200564


    .global func_ov025_02200648
func_ov025_02200648:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r4, #0x0
    mov r6, r0
    mov r5, r1
    str r5, [r6, #0x54]
    mov r7, r4
    mov r8, #0x10
L_02200664:
    ldr r0, [r6, #0x54]
    cmp r4, r0
    add r0, r6, r4, lsl #0x2
    ldr r0, [r0, #0xe4]
    bne L_02200684
    mov r1, r8
    bl func_ov025_021fd9e4
    b L_0220068c
L_02200684:
    mov r1, r7
    bl func_ov025_021fdb18
L_0220068c:
    add r4, r4, #0x1
    cmp r4, #0x3
    blt L_02200664
    add r0, r6, r5, lsl #0x2
    ldr r0, [r0, #0xe4]
    bl func_ov025_021fdc4c
    cmp r0, #0x0
    mov r0, r6
    beq L_022006b8
    bl func_ov025_02200564
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
L_022006b8:
    mov r1, r5
    bl func_ov025_02200498
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.size func_ov025_02200648, .-func_ov025_02200648

