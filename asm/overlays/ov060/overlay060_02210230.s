.text
; Matching fallback for the portable implementation in src/overlays/ov060/overlay060_recovery.c.
.extern Heap_Free
.extern Scene_Destroy
.extern data_ov060_02210620
.extern OverlayManager_UnloadOverlay
.extern OverlayManager_GetGlobal
.extern DebugHudState_Close
.extern DebugHudState_RefreshRectangle
.extern DebugHudState_GetGlobal
.extern func_ov060_022100b0

.global func_ov060_02210230
func_ov060_02210230:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, .L_02210288
    mov r5, r0
    str r1, [r5, #0x0]
    bl DebugHudState_GetGlobal
    bl DebugHudState_Close
    bl DebugHudState_GetGlobal
    bl DebugHudState_RefreshRectangle
    ldr r4, [r5, #0x24]
    cmp r4, #0x0
    beq .L_0221026c
    mov r0, r4
    bl func_ov060_022100b0
    mov r0, r4
    bl Heap_Free
.L_0221026c:
    bl OverlayManager_GetGlobal
    mov r1, #0x2
    bl OverlayManager_UnloadOverlay
    mov r0, r5
    bl Scene_Destroy
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
.L_02210288: .word data_ov060_02210620
.size func_ov060_02210230, . - func_ov060_02210230
