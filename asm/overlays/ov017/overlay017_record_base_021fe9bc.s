    .text

/* Exact fallback; see src/overlays/ov017/overlay017_record_base.c. */
.global Overlay017_RecordBase_NoOp
Overlay017_RecordBase_NoOp:
    bx lr
    .size Overlay017_RecordBase_NoOp, . - Overlay017_RecordBase_NoOp
