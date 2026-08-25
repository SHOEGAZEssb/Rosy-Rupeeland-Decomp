    .text
/* Exact fallback; see src/overlays/ov020/overlay020_list_runtime.c. */

.global Overlay020_List_AppendRow
Overlay020_List_AppendRow:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r5, [r0, #0x38]
    mov r2, #0x0
    cmp r5, #0x0
    beq L_021fd098
    ldr ip, [r0, #0x40]
    ldr r3, [r0, #0x3c]
    cmp ip, r3
    movge r0, r2
    ldmgeia sp!, {r3, r4, r5, pc}
    mov r3, #0xc
    mul r4, ip, r3
    str r1, [r5, r4]
    ldr lr, [r0, #0x40]
    ldr ip, [r0, #0x38]
    mov r1, #0x18
    mla r3, lr, r3, ip
    mul r1, lr, r1
    strh r2, [r3, #0x8]
    strh r1, [r3, #0xa]
    ldr r1, [r0, #0x40]
    add r2, r5, r4
    add r1, r1, #0x1
    str r1, [r0, #0x40]
L_021fd098:
    mov r0, r2
    ldmia sp!, {r3, r4, r5, pc}
    .size Overlay020_List_AppendRow, . - Overlay020_List_AppendRow
