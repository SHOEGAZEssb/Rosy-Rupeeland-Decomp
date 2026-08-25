    .text

/* Exact fallback; see src/overlays/ov017/overlay017_record_base.c. */
.global Overlay017_RecordBase_SetVector
Overlay017_RecordBase_SetVector:
    stmib r0, {r1, r2, r3}
    bx lr
    .size Overlay017_RecordBase_SetVector, . - Overlay017_RecordBase_SetVector
