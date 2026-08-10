; Matching fallback for the documented parameter and callback tables in
; src/overlays/ov093/overlay093_recovery.c.
.extern data_020f35d0
.extern data_020f35e0
.extern func_02031464
.extern func_020314b8
.extern Actor_SnapshotTransientState
.extern Actor_ClearTransientContactState
.extern func_02031f44
.extern func_020320fc
.extern func_0203213c
.extern func_02032144
.extern func_02032208
.extern Actor_ConvergeToTargetHeight
.extern Actor_IntegrateMotion
.extern Actor_SetPosition
.extern func_02032abc
.extern Actor_SetResourceVariant
.extern Actor_AssignPrimaryResource
.extern Actor_SetResourceSlot
.extern Actor_AssignPrimaryResourceWithEffect
.extern Actor_SetInteractionFlag2000
.extern Actor_ClearInteractionFlag2000
.extern Actor_TestQueryPointAndClearFlag2000
.extern func_02033b38
.extern Actor_RefreshTerrainHeightIfEnabled
.extern func_02033f4c
.extern Actor_ApplyMotionImpulse
.extern func_0204d3dc
.extern func_0204d3e0
.extern func_0204d3e4
.extern func_ov093_02217908
.extern func_ov093_02217ad8
.extern func_ov093_02217b90
.extern func_ov093_02217c50
.extern func_ov093_02218500
.extern func_ov093_02218514
.extern func_ov093_022186bc
.extern func_ov093_02218708
.extern func_ov093_0221871c
.extern func_ov093_02218724
.extern func_ov093_0221872c
.extern func_ov093_02218734
.extern func_ov093_02218744
.extern func_ov093_02218750
.extern func_ov093_02218764
.extern func_ov093_0221876c
.extern func_ov093_02218770
.extern func_ov093_02218774
.extern func_ov093_02218778
.extern func_ov093_02218788
.extern func_ov093_02218790
.extern func_ov093_02218798
.extern func_ov093_022187a0
.extern func_ov093_022187a8
.extern func_ov093_022187ac
.extern func_ov093_022187b0
.extern func_ov093_022187b4
.extern func_ov093_022187c0
.extern func_ov093_022187c8
.extern func_ov093_022187cc
.extern func_ov093_022187d0
.extern func_ov093_022187d8
.extern func_ov093_022187e0
.global data_ov093_022187f0
.global data_ov093_02218860
.global data_ov093_02218868
.global data_ov093_02218870
.global data_ov093_0221887c
.global data_ov093_02218888
.global data_ov093_02218894
.global data_ov093_022188a0
.global data_ov093_022188ac
.global data_ov093_022188bc
.global data_ov093_022188d0
.global data_ov093_022188f0
.global data_ov093_022189e0
.global data_ov093_022189e8
.global data_ov093_022189f0
.global data_ov093_022189f8

.section .rodata, 4, 1, 4
    ; Unlabelled leading halfword values at 0x022187e8 precede the named table.
    .byte 0x45, 0x00, 0x00, 0x00, 0x46, 0x00, 0x00, 0x00
data_ov093_022187f0:
    .byte 0x00, 0x00, 0x13, 0x00, 0x00, 0xa0, 0xe3, 0xff, 0x9a, 0x39, 0x00, 0x00, 0x2c, 0x01, 0x00, 0x00
    .byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x80, 0x15, 0x00, 0x00, 0x00, 0xe8, 0xff, 0x00, 0x40, 0x00, 0x00
    .byte 0x38, 0xff, 0xff, 0xff, 0x04, 0x00, 0x00, 0x00, 0x00, 0x20, 0x1b, 0x00, 0x00, 0x20, 0xe6, 0xff
    .byte 0xcd, 0x3c, 0x00, 0x00, 0x64, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0xa0, 0x1d, 0x00
    .byte 0x00, 0x00, 0xe3, 0xff, 0x66, 0x4e, 0x00, 0x00, 0x0c, 0xfe, 0xff, 0xff, 0x05, 0x00, 0x00, 0x00
    .byte 0x00, 0x90, 0x14, 0x00, 0x00, 0xa0, 0xde, 0xff, 0x9a, 0x51, 0x00, 0x00, 0x20, 0x03, 0x00, 0x00
    .byte 0x05, 0x00, 0x00, 0x00
    .section .data, 4, 1, 4
data_ov093_02218860:
    .byte 0x35, 0x43, 0x46, 0x43, 0x68, 0x72, 0x00, 0x00
data_ov093_02218868:
    .word data_020f35e0
    .word data_ov093_02218860
data_ov093_02218870:
    .word data_020f35d0
    .word data_ov093_022188ac
    .word data_ov093_0221887c
data_ov093_0221887c:
    .word data_020f35d0
    .word data_ov093_022188a0
    .word data_ov093_02218868
data_ov093_02218888:
    .word data_020f35d0
    .word data_ov093_022188bc
    .word data_ov093_02218870
data_ov093_02218894:
    .word data_020f35d0
    .word data_ov093_022188d0
    .word data_ov093_02218888
data_ov093_022188a0:
    .byte 0x38, 0x43, 0x46, 0x43, 0x68, 0x72, 0x45, 0x76, 0x74, 0x00, 0x00, 0x00
data_ov093_022188ac:
    .byte 0x31, 0x30, 0x43, 0x46, 0x43, 0x68, 0x72, 0x4e, 0x6f, 0x41, 0x6e, 0x6d, 0x00, 0x00, 0x00, 0x00
data_ov093_022188bc:
    .byte 0x31, 0x35, 0x43, 0x46, 0x43, 0x68, 0x72, 0x42, 0x6f, 0x73, 0x73, 0x53, 0x74, 0x67, 0x4d, 0x61
    .byte 0x6e, 0x00, 0x00, 0x00
data_ov093_022188d0:
    .byte 0x32, 0x30, 0x43, 0x46, 0x43, 0x68, 0x72, 0x59, 0x61, 0x6d, 0x61, 0x42, 0x6f, 0x73, 0x73, 0x44
    .byte 0x65, 0x6d, 0x6f, 0x4d, 0x61, 0x6e, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    .word data_ov093_02218894
data_ov093_022188f0:
    .word func_ov093_02217ad8
    .word func_ov093_02217b90
    .word func_ov093_0221872c
    .word func_ov093_02218724
    .word func_ov093_02217908
    .word func_020314b8
    .word Actor_SnapshotTransientState
    .word func_ov093_02217c50
    .word Actor_ClearTransientContactState
    .word func_0204d3dc
    .word func_0204d3e4
    .word func_02032abc
    .word func_02031f44
    .word func_0203213c
    .word func_02032144
    .word func_020320fc
    .word func_02032208
    .word func_ov093_022187ac
    .word Actor_SetInteractionFlag2000
    .word Actor_ClearInteractionFlag2000
    .word Actor_TestQueryPointAndClearFlag2000
    .word func_0204d3e0
    .word func_ov093_02218514
    .word func_ov093_022187a8
    .word func_ov093_022187a0
    .word func_ov093_02218798
    .word func_ov093_02218790
    .word func_ov093_02218788
    .word Actor_AssignPrimaryResourceWithEffect
    .word Actor_AssignPrimaryResource
    .word Actor_SetResourceVariant
    .word func_ov093_02218778
    .word Actor_SetPosition
    .word func_02033b38
    .word Actor_RefreshTerrainHeightIfEnabled
    .word func_ov093_02218774
    .word Actor_ConvergeToTargetHeight
    .word func_ov093_02218770
    .word func_ov093_0221876c
    .word func_ov093_02218764
    .word func_ov093_02218750
    .word Actor_IntegrateMotion
    .word func_ov093_02218744
    .word Actor_SetResourceSlot
    .word func_02033f4c
    .word func_ov093_02218734
    .word Actor_ApplyMotionImpulse
    .word func_02031464
    .word func_ov093_022186bc
    .word func_ov093_022187cc
    .word func_ov093_022187c8
    .word func_ov093_022187c0
    .word func_ov093_02218708
    .word func_ov093_022187b4
    .word func_ov093_0221871c
    .word func_ov093_02218500
    .word func_ov093_022187b0
    .word func_ov093_022187e0
    .word func_ov093_022187d8
    .word func_ov093_022187d0
data_ov093_022189e0:
    .byte 0x46, 0x43, 0x48, 0x52, 0x00, 0x00, 0x00, 0x00
data_ov093_022189e8:
    .byte 0x50, 0x48, 0x41, 0x5a, 0x00, 0x00, 0x00, 0x00
data_ov093_022189f0:
    .byte 0x54, 0x41, 0x53, 0x4b, 0x00, 0x00, 0x00, 0x00
data_ov093_022189f8: ; ambiguous
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
