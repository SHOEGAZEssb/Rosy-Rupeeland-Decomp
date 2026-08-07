.text

/* Exact fallback; see src/overlays/ov023/overlay023_record_collection.c. */
.extern func_ov023_021fd164


    .global func_ov023_021fd104
func_ov023_021fd104:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r1, [r4, #0x38]
    mov r0, #0x1a
    ldr r2, [r1, #0xc]
    ldr r1, [r4, #0x4]
    mul r0, r2, r0
    rsb r0, r0, #0x2d
    str r0, [r1, #0x1c]
    ldr r0, [r4, #0x38]
    ldr r5, [r0, #0xc]
    b L_021fd144
L_021fd134:
    mov r0, r4
    mov r1, r5
    bl func_ov023_021fd164
    add r5, r5, #0x1
L_021fd144:
    ldr r0, [r4, #0x38]
    ldr r1, [r0, #0xc]
    ldr r0, [r0, #0x8]
    add r0, r1, r0
    sub r0, r0, #0x1
    cmp r5, r0
    ble L_021fd134
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov023_021fd104, .-func_ov023_021fd104

