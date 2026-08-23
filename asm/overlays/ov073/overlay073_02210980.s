.text
; Matching fallback for the portable implementation in src/overlays/ov073/overlay073_recovery.c.
.extern Heap_Free
.extern data_ov073_02210be4
.extern OverlayManager_UnloadOverlay
.extern OverlayManager_GetGlobal
.extern FieldEffect_DestroyBase
.extern func_ov073_022102dc

.global func_ov073_02210980
func_ov073_02210980:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, .L_02210a04
    mov r5, r0
    str r1, [r5, #0x0]
    ldr r4, [r5, #0x8]
    cmp r4, #0x0
    beq .L_022109ac
    mov r0, r4
    bl func_ov073_022102dc
    mov r0, r4
    bl Heap_Free
.L_022109ac:
    ldr r4, [r5, #0xc]
    cmp r4, #0x0
    beq .L_022109c8
    mov r0, r4
    bl func_ov073_022102dc
    mov r0, r4
    bl Heap_Free
.L_022109c8:
    ldr r0, [r5, #0x14]
    cmp r0, #0x0
    beq .L_022109e0
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_022109e0:
    bl OverlayManager_GetGlobal
    mov r1, #0x2
    bl OverlayManager_UnloadOverlay
    mov r0, r5
    bl FieldEffect_DestroyBase
    mov r0, r5
    bl Heap_Free
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
.L_02210a04: .word data_ov073_02210be4
.size func_ov073_02210980, . - func_ov073_02210980
