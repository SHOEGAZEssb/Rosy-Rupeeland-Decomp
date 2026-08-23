.text
; Matching fallback for the portable implementation in src/overlays/ov054/overlay054_recovery.c.
.extern Heap_Free
.extern VecFx32Object_Destroy
.extern OverlaySlot_Destroy
.extern FieldEffect_DestroyBase

.global func_ov054_0220e4c8
func_ov054_0220e4c8:
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x1a8
    bl OverlaySlot_Destroy
    add r0, r4, #0x194
    bl VecFx32Object_Destroy
    mov r0, r4
    bl FieldEffect_DestroyBase
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov054_0220e4c8, . - func_ov054_0220e4c8
