.text
; Matching fallback for the portable implementation in src/overlays/ov054/overlay054_recovery.c.
.extern Heap_Free
.extern data_ov054_0220f130
.extern OverlayManager_UnloadOverlay
.extern OverlayManager_GetGlobal
.extern VecFx32Object_Destroy
.extern OverlaySlot_Destroy
.extern func_0201e28c

.global func_ov054_0220e704
func_ov054_0220e704:
    stmdb sp!, {r4, lr}
    ldr r1, .L_0220e758
    mov r4, r0
    str r1, [r4, #0x0]
    mov r1, #0x4000000
    ldr r0, [r1, #0x0]
    bic r0, r0, #0xe000
    str r0, [r1, #0x0]
    bl OverlayManager_GetGlobal
    mov r1, #0x1
    bl OverlayManager_UnloadOverlay
    add r0, r4, #0x1a8
    bl OverlaySlot_Destroy
    add r0, r4, #0x194
    bl VecFx32Object_Destroy
    mov r0, r4
    bl func_0201e28c
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0220e758: .word data_ov054_0220f130
.size func_ov054_0220e704, . - func_ov054_0220e704
