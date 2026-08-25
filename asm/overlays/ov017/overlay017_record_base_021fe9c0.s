    .text

/* Exact fallback; see src/overlays/ov017/overlay017_record_base.c. */
    .extern data_ov017_02201628
.global Overlay017_RecordBase_Init
Overlay017_RecordBase_Init:
    ldr r2, L_021fe9dc
    mov r1, #0x0
    str r2, [r0, #0x0]
    str r1, [r0, #0x8]
    str r1, [r0, #0x4]
    str r1, [r0, #0xc]
    bx lr
L_021fe9dc: .word data_ov017_02201628
    .size Overlay017_RecordBase_Init, . - Overlay017_RecordBase_Init
