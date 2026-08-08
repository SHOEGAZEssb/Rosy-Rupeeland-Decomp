.text
/* Exact fallback; see overlay038_selection_accessors.c for portable C. */
    .extern func_02091b98
    .global func_ov038_021fd624
func_ov038_021fd624:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x48]
    mov r2, #0x18
    orr r0, r0, #0x3
    str r0, [r4, #0x48]
    ldr r1, [r4, #0x314]
    add r0, r4, #0x348
    ldr ip, [r1, #0x14]
    ldr r3, [r1, #0xc]
    mov r1, #0x78
    sub r3, ip, r3
    rsb r3, r3, #0x0
    mul r2, r3, r2
    str r2, [r4, #0x33c]
    bl func_02091b98
    mov r0, #0x1
    str r0, [r4, #0x364]
    ldmia sp!, {r4, pc}
    .size func_ov038_021fd624, .-func_ov038_021fd624
