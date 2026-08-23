.text
; Matching fallback for the portable implementation in src/overlays/ov051/overlay051_main_scene_recovery.c.
.extern Heap_Free
.extern data_ov051_0220df48
.extern OverlayManager_UnloadOverlay
.extern OverlayManager_GetGlobal
.extern FieldEffect_DestroyBase
.extern func_020ae96c

.global func_ov051_0220dd44
func_ov051_0220dd44:
    stmdb sp!, {r4, lr}
    ldr r1, .L_0220dd7c
    mov r4, r0
    str r1, [r4, #0x0]
    bl func_020ae96c
    bl OverlayManager_GetGlobal
    mov r1, #0x0
    bl OverlayManager_UnloadOverlay
    mov r0, r4
    bl FieldEffect_DestroyBase
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0220dd7c: .word data_ov051_0220df48
.size func_ov051_0220dd44, . - func_ov051_0220dd44
