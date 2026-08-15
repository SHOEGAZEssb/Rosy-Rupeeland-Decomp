.text
; Matching fallback for the portable implementation in src/overlays/ov094/overlay094_recovery.c.
.extern SpritePresentation_SyncPosition

.global func_ov094_02219540
func_ov094_02219540:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl SpritePresentation_SyncPosition
    ldr r0, [r4, #0x9c]
    ldr r1, [r4, #0xa4]
    ldrsh r2, [r0, #0x2e]
    ldrsh r0, [r0, #0x2c]
    strh r0, [r1, #0x2c]
    strh r2, [r1, #0x2e]
    ldmia sp!, {r4, pc}
.size func_ov094_02219540, . - func_ov094_02219540
