.text
; Matching fallback for the portable implementation in src/overlays/ov057/overlay057_recovery.c.
.extern GraphicsResourceSet_Destroy
.extern data_ov057_0220e7d4
.extern OverlayManager_UnloadOverlay
.extern OverlayManager_GetGlobal
.extern FieldEffect_DestroyBase

.global func_ov057_0220e4e0
func_ov057_0220e4e0:
    stmdb sp!, {r4, lr}
    ldr r1, .L_0220e514
    mov r4, r0
    str r1, [r4, #0x0]
    bl OverlayManager_GetGlobal
    mov r1, #0x1
    bl OverlayManager_UnloadOverlay
    add r0, r4, #0x8
    bl GraphicsResourceSet_Destroy
    mov r0, r4
    bl FieldEffect_DestroyBase
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0220e514: .word data_ov057_0220e7d4
.size func_ov057_0220e4e0, . - func_ov057_0220e4e0
