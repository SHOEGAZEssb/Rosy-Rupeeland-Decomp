    .text
/* Exact fallback; see src/overlays/ov022/overlay022_entry_collection.c. */
    .extern data_020d7a48

.global Overlay022_EntryCollection_AppendIndex
Overlay022_EntryCollection_AppendIndex:
    stmdb sp!, {r3, lr}
    ldr lr, [r0, #0x38]
    cmp lr, #0x0
    ldmeqia sp!, {r3, pc}
    ldr ip, [r0, #0x40]
    ldr r2, [r0, #0x3c]
    cmp ip, r2
    ldmgeia sp!, {r3, pc}
    ldr r3, L_021fd890
    mov r2, #0x24
    mla r2, r1, r2, r3
    str r2, [lr, ip, lsl #0x3]
    add r2, lr, ip, lsl #0x3
    str r1, [r2, #0x4]
    ldr r1, [r0, #0x40]
    add r1, r1, #0x1
    str r1, [r0, #0x40]
    ldmia sp!, {r3, pc}
L_021fd890: .word data_020d7a48
.size Overlay022_EntryCollection_AppendIndex, . - Overlay022_EntryCollection_AppendIndex
