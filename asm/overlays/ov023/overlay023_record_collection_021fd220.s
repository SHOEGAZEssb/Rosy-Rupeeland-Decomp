.text

/* Exact fallback; see src/overlays/ov023/overlay023_record_collection.c. */
.extern func_02073ef8


    .global func_ov023_021fd220
func_ov023_021fd220:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x34]
    cmp r1, r0
    ldmgeia sp!, {r3, r4, r5, pc}
    mov r0, #0x18
    mul r4, r1, r0
    ldr r0, [r5, #0x2c]
    add r0, r0, r4
    ldr r0, [r0, #0x10]
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    bl func_02073ef8
    ldr r0, [r5, #0x2c]
    mov r1, #0x0
    add r0, r0, r4
    str r1, [r0, #0x10]
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov023_021fd220, .-func_ov023_021fd220

