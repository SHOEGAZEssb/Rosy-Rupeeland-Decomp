    .text
    .extern func_020befec
    .extern func_02072b68

    /* Exact fallback; see the documented portable reconstruction in
     * src/overlays/ov007/overlay007_item_bucket_update.c. */
    .global func_ov007_021fc0dc
func_ov007_021fc0dc: ; 0x021fc0dc
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r1, #0x3b
    mov r1, #0x3c
    bl func_020befec
    ldr r1, [r4, #0x98]
    cmp r1, r0
    ldmeqia sp!, {r4, pc}
    cmp r0, #0xb
    ldmgeia sp!, {r4, pc}
    str r0, [r4, #0x98]
    mov r0, #0x200
    str r0, [r4, #0x9c]
    ldr r0, [r4, #0x98]
    cmp r0, #0xa
    bne L_021fc12c
    ldr r0, [r4, #0x4c]
    mov r1, #0x3
    ldr r0, [r0, #0xc]
    bl func_02072b68
L_021fc12c:
    ldr r1, [r4, #0x78]
    ldrh r0, [r1, #0x42]
    bic r0, r0, #0x4
    strh r0, [r1, #0x42]
    ldr r0, [r4, #0x78]
    ldr r1, [r4, #0x98]
    ldr r0, [r0, #0xc]
    and r1, r1, #0xff
    bl func_02072b68
    ldr r1, [r4, #0x9c]
    ldr r0, [r4, #0x78]
    strh r1, [r0, #0x3c]
    ldr r1, [r4, #0x9c]
    ldr r0, [r4, #0x78]
    strh r1, [r0, #0x3e]
    ldmia sp!, {r4, pc}

    .size func_ov007_021fc0dc, .-func_ov007_021fc0dc
