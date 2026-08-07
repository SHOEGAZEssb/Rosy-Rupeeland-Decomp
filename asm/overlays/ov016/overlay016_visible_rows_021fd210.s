    .text
    .extern func_ov016_021fd270

/* Exact fallbacks for visible-row creation; see src/overlays/ov016/overlay016_list_runtime.c. */
    .global func_ov016_021fd210

func_ov016_021fd210:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r1, [r4, #0x58]
    mov r0, #0x18
    ldr r2, [r1, #0xc]
    ldr r1, [r4, #0x4]
    mul r0, r2, r0
    rsb r0, r0, #0x20
    str r0, [r1, #0x1c]
    ldr r0, [r4, #0x58]
    ldr r5, [r0, #0xc]
    b L_021fd250
L_021fd240:
    mov r0, r4
    mov r1, r5
    bl func_ov016_021fd270
    add r5, r5, #0x1
L_021fd250:
    ldr r0, [r4, #0x58]
    ldr r1, [r0, #0xc]
    ldr r0, [r0, #0x8]
    add r0, r1, r0
    sub r0, r0, #0x1
    cmp r5, r0
    ble L_021fd240
    ldmia sp!, {r3, r4, r5, pc}

    .size func_ov016_021fd210, . - func_ov016_021fd210
