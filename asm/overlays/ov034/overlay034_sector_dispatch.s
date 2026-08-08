.text
/* Exact fallback; see src/overlays/ov034/overlay034_sector_state.c for documented portable C. */
    .extern func_ov034_021fd3a0
    .global func_ov034_021fd3f4
func_ov034_021fd3f4:
    stmdb sp!, {r3, lr}
    ldr r2, [r0, #0x20]
    cmp r2, #0x0
    beq L_021fd414
    cmp r2, #0x1
    beq L_021fd41c
    cmp r2, #0x3
    bne L_021fd424
L_021fd414:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
L_021fd41c:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
L_021fd424:
    ldr r2, [r0, #0x1c]
    cmp r1, #0x2
    mov r2, r2, lsl #0x10
    mov r3, r2, lsr #0xc
    mov r2, r3, asr #0xf
    add r2, r3, r2, lsr #0x10
    mov r2, r2, asr #0x10
    blt L_021fd488
    ldr r3, [r0, #0x0]
    cmp r3, #0x2
    bge L_021fd47c
    cmp r1, #0x2
    beq L_021fd464
    cmp r1, #0x3
    beq L_021fd470
    b L_021fd48c
L_021fd464:
    mov r1, #0x0
    bl func_ov034_021fd3a0
    b L_021fd48c
L_021fd470:
    mov r1, #0x1
    bl func_ov034_021fd3a0
    b L_021fd48c
L_021fd47c:
    mov r1, #0x2
    bl func_ov034_021fd3a0
    b L_021fd48c
L_021fd488:
    bl func_ov034_021fd3a0
L_021fd48c:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
.size func_ov034_021fd3f4, .-func_ov034_021fd3f4
