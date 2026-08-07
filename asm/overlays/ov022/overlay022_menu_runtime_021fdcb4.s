    .text
/* Exact fallback; see src/overlays/ov022/overlay022_menu_runtime.c. */
    .extern func_ov022_021fdb38

.global func_ov022_021fdcb4
func_ov022_021fdcb4:
    stmdb sp!, {r3, lr}
    ldr r3, [r0, #0x30]
    ldr r1, [r3, #0x2c]
    ldr r2, [r3, #0x30]
    add r1, r1, r1, lsr #0x1f
    cmp r2, r1, asr #0x1
    bne L_021fdcf8
    ldr r2, [r3, #0xc]
    ldr r1, [r3, #0x10]
    cmp r2, r1
    movne r1, #0x1
    moveq r1, #0x0
    cmp r1, #0x0
    beq L_021fdcf0
    bl func_ov022_021fdb38
L_021fdcf0:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
L_021fdcf8:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.size func_ov022_021fdcb4, . - func_ov022_021fdcb4
