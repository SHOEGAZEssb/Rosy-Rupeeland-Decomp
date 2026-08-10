.text
; Matching fallback for the portable implementation in src/overlays/ov055/overlay055_recovery.c.
.extern Heap_Free
.extern data_020f4e14
.extern data_ov055_0220f058
.extern OverlayManager_UnloadOverlay
.extern OverlayManager_GetGlobal
.extern func_02005058
.extern func_0201e28c
.extern func_02074330
.extern func_ov055_0220e7cc
.extern gDebugFont

.global func_ov055_0220eae4
func_ov055_0220eae4:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, .L_0220eb5c
    mov r5, r0
    str r1, [r5, #0x0]
    ldr r4, [r5, #0x24]
    cmp r4, #0x0
    beq .L_0220eb10
    mov r0, r4
    bl func_ov055_0220e7cc
    mov r0, r4
    bl Heap_Free
.L_0220eb10:
    ldr r0, .L_0220eb60
    ldr r1, [r5, #0x1c]
    ldr r0, [r0, #0x0]
    bl func_02074330
    ldr r0, .L_0220eb64
    ldr r1, [r5, #0x20]
    ldr r0, [r0, #0x0]
    bl func_02074330
    bl OverlayManager_GetGlobal
    mov r1, #0x1
    bl OverlayManager_UnloadOverlay
    add r0, r5, #0x8
    bl func_02005058
    mov r0, r5
    bl func_0201e28c
    mov r0, r5
    bl Heap_Free
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
.L_0220eb5c: .word data_ov055_0220f058
.L_0220eb60: .word data_020f4e14
.L_0220eb64: .word gDebugFont
.size func_ov055_0220eae4, . - func_ov055_0220eae4
