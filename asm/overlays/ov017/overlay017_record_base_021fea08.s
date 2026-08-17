    .text

/* Exact fallback; see src/overlays/ov017/overlay017_record_base.c. */
.global Overlay017Record_SetSecondaryVector
Overlay017Record_SetSecondaryVector:
    str r1, [r0, #0x10]
    str r2, [r0, #0x14]
    str r3, [r0, #0x18]
    bx lr
    .size Overlay017Record_SetSecondaryVector, . - Overlay017Record_SetSecondaryVector
