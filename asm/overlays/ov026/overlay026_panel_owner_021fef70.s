.text

/* Exact fallback; see src/overlays/ov026/overlay026_panel_owner.c. */
.extern PresentationScalar_SetImmediate


    .global func_ov026_021fef70
func_ov026_021fef70:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0xa4]
    mov r4, r1
    add r0, r0, #0x1c
    bl PresentationScalar_SetImmediate
    ldr r0, [r5, #0xa8]
    mov r1, r4
    add r0, r0, #0x1c
    bl PresentationScalar_SetImmediate
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov026_021fef70, .-func_ov026_021fef70

