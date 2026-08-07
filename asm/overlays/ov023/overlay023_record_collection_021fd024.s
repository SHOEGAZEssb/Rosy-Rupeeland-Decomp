.text

/* Exact fallback; see src/overlays/ov023/overlay023_record_collection.c. */



    .global func_ov023_021fd024
func_ov023_021fd024:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r5, [r0, #0x2c]
    mov r2, #0x0
    cmp r5, #0x0
    beq L_021fd084
    ldr ip, [r0, #0x34]
    ldr r3, [r0, #0x30]
    cmp ip, r3
    movge r0, r2
    ldmgeia sp!, {r3, r4, r5, pc}
    mov r3, #0x18
    mul r4, ip, r3
    str r1, [r5, r4]
    ldr lr, [r0, #0x34]
    ldr ip, [r0, #0x2c]
    mov r1, #0x1a
    mla r3, lr, r3, ip
    mul r1, lr, r1
    strh r2, [r3, #0x14]
    strh r1, [r3, #0x16]
    ldr r1, [r0, #0x34]
    add r2, r5, r4
    add r1, r1, #0x1
    str r1, [r0, #0x34]
L_021fd084:
    mov r0, r2
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov023_021fd024, .-func_ov023_021fd024

