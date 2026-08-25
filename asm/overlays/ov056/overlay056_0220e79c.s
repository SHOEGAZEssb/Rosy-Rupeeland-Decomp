.text
; Matching fallback for the portable implementation in src/overlays/ov056/overlay056_recovery.c.
.extern GameFile_Close
.extern GameFile_Destroy
.extern data_ov056_0220f6a4
.extern OverlayManager_UnloadOverlay
.extern OverlayManager_GetGlobal
.extern Heap_FreeAlternateEntry
.extern VecFx32Object_Destroy
.extern func_ov056_0220e690
.extern func_ov056_0220e71c
.extern func_ov056_0220e854
.extern func_ov056_0220f3e4

.global func_ov056_0220e79c
func_ov056_0220e79c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x0]
    bl Heap_FreeAlternateEntry
    mov r0, r4
    bl func_ov056_0220e854
    add r0, r4, #0x4c
    add r0, r0, #0x800
    bl GameFile_Close
    bl OverlayManager_GetGlobal
    mov r1, #0x1
    bl OverlayManager_UnloadOverlay
    add r0, r4, #0x98
    add r0, r0, #0x800
    bl VecFx32Object_Destroy
    add r0, r4, #0x4c
    add r0, r0, #0x800
    bl GameFile_Destroy
    add r0, r4, #0x3c
    ldr r1, .L_0220e824
    add r0, r0, #0x800
    str r1, [r4, #0x83c]
    bl func_ov056_0220e71c
    add r0, r4, #0x1c
    add r0, r0, #0x800
    bl func_ov056_0220f3e4
    add r0, r4, #0x14
    add r0, r0, #0x800
    bl func_ov056_0220e690
    add r0, r4, #0x4
    add r0, r0, #0x800
    bl VecFx32Object_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0220e824: .word data_ov056_0220f6a4
.size func_ov056_0220e79c, . - func_ov056_0220e79c
