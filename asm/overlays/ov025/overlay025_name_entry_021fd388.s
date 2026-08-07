.text

/* Exact fallback; see src/overlays/ov025/overlay025_name_entry.c. */
.extern func_02072b68


    .global func_ov025_021fd388
func_ov025_021fd388:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r4, r1
    mov r5, r0
    mov r7, r4
    mov r6, #0x5
    b L_021fd3b4
L_021fd3a0:
    add r0, r5, r7, lsl #0x2
    ldr r0, [r0, #0x10]
    mov r1, r6
    bl func_02072b68
    add r7, r7, #0x1
L_021fd3b4:
    ldr r0, [r5, #0x17c]
    cmp r7, r0
    blt L_021fd3a0
    add r0, r5, r4, lsl #0x2
    ldr r1, [r0, #0x10]
    mov r0, #0x0
    str r1, [r5, #0x174]
    strh r0, [r1, #0x28]
    str r4, [r5, #0x17c]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.size func_ov025_021fd388, .-func_ov025_021fd388

