.text
; Matching fallback for the portable implementation in src/overlays/ov061/overlay061_recovery.c.
.extern Scene_Destroy
.extern data_ov061_022102b0
.extern OverlayManager_UnloadOverlay
.extern OverlayManager_GetGlobal
.extern DebugHudState_Close
.extern DebugHudState_RefreshRectangle
.extern DebugHudState_GetGlobal
.extern func_0205940c
.extern gSoundContext

.global func_ov061_0220fe04
func_ov061_0220fe04:
    stmdb sp!, {r4, lr}
    ldr r1, .L_0220fe60
    mov r4, r0
    str r1, [r4, #0x0]
    bl DebugHudState_GetGlobal
    bl DebugHudState_Close
    bl DebugHudState_GetGlobal
    bl DebugHudState_RefreshRectangle
    ldr r0, [r4, #0x38]
    cmp r0, #0x0
    beq .L_0220fe44
    ldr r0, .L_0220fe64
    ldr r1, .L_0220fe68
    ldr r0, [r0, #0x0]
    mov r2, #0x0
    bl func_0205940c
.L_0220fe44:
    bl OverlayManager_GetGlobal
    mov r1, #0x2
    bl OverlayManager_UnloadOverlay
    mov r0, r4
    bl Scene_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0220fe60: .word data_ov061_022102b0
.L_0220fe64: .word gSoundContext
.L_0220fe68: .word 0x186
.size func_ov061_0220fe04, . - func_ov061_0220fe04
