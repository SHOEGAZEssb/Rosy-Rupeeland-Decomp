.text

/* Exact fallback; see src/overlays/ov025/overlay025_name_entry.c. */
.extern func_02092910


    .global func_ov025_021fd340
func_ov025_021fd340:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r1
    mov r4, #0x0
    b L_021fd374
L_021fd354:
    add r0, r6, r4, lsl #0x2
    ldr r0, [r0, #0x10]
    mov r1, r5
    bl func_02092910
    cmp r0, #0x0
    movne r0, r4
    ldmneia sp!, {r4, r5, r6, pc}
    add r4, r4, #0x1
L_021fd374:
    ldr r0, [r6, #0x17c]
    cmp r4, r0
    blt L_021fd354
    mvn r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.size func_ov025_021fd340, .-func_ov025_021fd340

