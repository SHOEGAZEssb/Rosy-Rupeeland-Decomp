.text
; Matching fallback for the portable implementation in src/overlays/ov054/overlay054_recovery.c.
.extern Heap_Free
.extern func_02005058
.extern OverlaySlot_Destroy
.extern func_0201e28c

.global func_ov054_0220e4c8
func_ov054_0220e4c8:
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x1a8
    bl OverlaySlot_Destroy
    add r0, r4, #0x194
    bl func_02005058
    mov r0, r4
    bl func_0201e28c
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov054_0220e4c8, . - func_ov054_0220e4c8
