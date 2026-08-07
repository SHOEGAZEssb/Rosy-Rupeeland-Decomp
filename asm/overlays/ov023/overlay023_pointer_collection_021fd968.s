.text

/* Exact fallback; see src/overlays/ov023/overlay023_pointer_collection.c. */
.extern func_ov023_021fd7a8


    .global func_ov023_021fd968
func_ov023_021fd968:
    stmdb sp!, {r3, lr}
    ldr r3, [r0, #0x48]
    ldr r1, [r3, #0x2c]
    ldr r2, [r3, #0x30]
    add r1, r1, r1, lsr #0x1f
    cmp r2, r1, asr #0x1
    bne L_021fd9ac
    ldr r2, [r3, #0xc]
    ldr r1, [r3, #0x10]
    cmp r2, r1
    movne r1, #0x1
    moveq r1, #0x0
    cmp r1, #0x0
    beq L_021fd9a4
    bl func_ov023_021fd7a8
L_021fd9a4:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
L_021fd9ac:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.size func_ov023_021fd968, .-func_ov023_021fd968

