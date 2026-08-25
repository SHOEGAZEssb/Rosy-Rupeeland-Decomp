    .text

/* Exact fallback; see src/overlays/ov017/overlay017_record_base.c. */
    .extern data_ov017_02201628
    .extern PresentationList_DeleteAll
.global Overlay017_RecordBase_Destroy
Overlay017_RecordBase_Destroy:
    stmdb sp!, {r4, lr}
    ldr r1, L_021fe9fc
    mov r4, r0
    str r1, [r4, #0x0]
    bl PresentationList_DeleteAll
    mov r0, r4
    ldmia sp!, {r4, pc}
L_021fe9fc: .word data_ov017_02201628
    .size Overlay017_RecordBase_Destroy, . - Overlay017_RecordBase_Destroy
