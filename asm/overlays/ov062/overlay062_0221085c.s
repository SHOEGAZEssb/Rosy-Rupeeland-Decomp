.text
; Matching fallback for the portable implementation in src/overlays/ov062/overlay062_recovery.c.
.extern Heap_Free
.extern Scene_ClearFlags03
.extern Scene_Destroy
.extern data_ov062_02211ba4
.extern OverlayManager_UnloadOverlay
.extern OverlayManager_GetGlobal
.extern VecFx32Object_Assign
.extern VecFx32Triple_Destroy

.global func_ov062_0221085c
func_ov062_0221085c:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, .L_02210910
    mov r4, r0
    str r1, [r4, #0x0]
    bl Scene_ClearFlags03
    ldr r0, [r4, #0x24]
    ldr r1, [r4, #0x28]
    add r0, r0, #0x18
    add r1, r1, #0x10
    bl VecFx32Object_Assign
    ldr r1, [r4, #0x24]
    add r0, r1, #0x28
    add r1, r1, #0x18
    bl VecFx32Object_Assign
    ldr r0, [r4, #0x24]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x5c]
    blx r1
    ldr r0, [r4, #0x38]
    cmp r0, #0x0
    ldrne r0, [r4, #0x24]
    ldrne r1, [r0, #0x54]
    ldrneh r0, [r1, #0x24]
    orrne r0, r0, #0x4
    strneh r0, [r1, #0x24]
    ldr r0, [r4, #0x3c]
    cmp r0, #0x0
    beq .L_022108d8
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x5c]
    blx r1
.L_022108d8:
    ldr r5, [r4, #0x28]
    cmp r5, #0x0
    beq .L_022108f4
    mov r0, r5
    bl VecFx32Triple_Destroy
    mov r0, r5
    bl Heap_Free
.L_022108f4:
    bl OverlayManager_GetGlobal
    mov r1, #0x2
    bl OverlayManager_UnloadOverlay
    mov r0, r4
    bl Scene_Destroy
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
.L_02210910: .word data_ov062_02211ba4
.size func_ov062_0221085c, . - func_ov062_0221085c
