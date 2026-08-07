.text

/* Exact fallback; see src/overlays/ov023/overlay023_record_collection.c. */
.extern func_ov023_021fd164
.extern func_ov023_021fd220
.extern func_ov023_021fd268


    .global func_ov023_021fd3b0
func_ov023_021fd3b0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r2, [r4, #0x38]
    ldr r0, [r2, #0x2c]
    ldr r1, [r2, #0x30]
    add r0, r0, r0, lsr #0x1f
    cmp r1, r0, asr #0x1
    bne L_021fd430
    ldr r3, [r2, #0xc]
    ldr r0, [r2, #0x10]
    cmp r3, r0
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    beq L_021fd428
    mov r0, #0x1a
    mul r1, r3, r0
    ldr r0, [r4, #0x4]
    rsb r1, r1, #0x2d
    str r1, [r0, #0x1c]
    ldr r1, [r4, #0x38]
    mov r0, r4
    ldr r1, [r1, #0x74]
    bl func_ov023_021fd220
    ldr r1, [r4, #0x38]
    mov r0, r4
    ldr r1, [r1, #0x70]
    bl func_ov023_021fd164
    mov r0, r4
    bl func_ov023_021fd268
L_021fd428:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
L_021fd430:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.size func_ov023_021fd3b0, .-func_ov023_021fd3b0

