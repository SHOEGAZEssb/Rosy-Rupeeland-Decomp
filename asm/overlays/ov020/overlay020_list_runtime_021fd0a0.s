    .text
/* Exact fallback; see src/overlays/ov020/overlay020_list_runtime.c. */
    .extern func_ov020_021fd100

.global func_ov020_021fd0a0
func_ov020_021fd0a0:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r1, [r4, #0x44]
    mov r0, #0x18
    ldr r2, [r1, #0xc]
    ldr r1, [r4, #0x4]
    mul r0, r2, r0
    rsb r0, r0, #0x1c
    str r0, [r1, #0x1c]
    ldr r0, [r4, #0x44]
    ldr r5, [r0, #0xc]
    b L_021fd0e0
L_021fd0d0:
    mov r0, r4
    mov r1, r5
    bl func_ov020_021fd100
    add r5, r5, #0x1
L_021fd0e0:
    ldr r0, [r4, #0x44]
    ldr r1, [r0, #0xc]
    ldr r0, [r0, #0x8]
    add r0, r1, r0
    sub r0, r0, #0x1
    cmp r5, r0
    ble L_021fd0d0
    ldmia sp!, {r3, r4, r5, pc}
    .size func_ov020_021fd0a0, . - func_ov020_021fd0a0
