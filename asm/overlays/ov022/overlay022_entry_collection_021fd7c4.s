    .text
/* Exact fallback; see src/overlays/ov022/overlay022_entry_collection.c. */
    .extern data_ov022_02200674
    .extern CxxArray_DestroyAndFree
    .extern Overlay022_CollectionEntry_DestroyNoOp

.global Overlay022_EntryCollection_Deinit
Overlay022_EntryCollection_Deinit:
    stmdb sp!, {r4, lr}
    ldr r1, L_021fd7f8
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0x38]
    cmp r0, #0x0
    beq L_021fd7f0
    mov r1, #0x8
    ldr r3, L_021fd7fc
    mov r2, r1
    bl CxxArray_DestroyAndFree
L_021fd7f0:
    mov r0, r4
    ldmia sp!, {r4, pc}
L_021fd7f8: .word data_ov022_02200674
L_021fd7fc: .word Overlay022_CollectionEntry_DestroyNoOp
.size Overlay022_EntryCollection_Deinit, . - Overlay022_EntryCollection_Deinit
