.text

/* Exact fallback; see src/overlays/ov025/overlay025_scene_runtime.c. */
.extern func_ov025_021fdc60


    .global func_ov025_022001f4
func_ov025_022001f4:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, #0x0
    mov r6, r0
    mov r4, r5
L_02200204:
    add r0, r6, r5, lsl #0x2
    ldr r0, [r0, #0xe4]
    mov r1, r4
    bl func_ov025_021fdc60
    add r5, r5, #0x1
    cmp r5, #0x3
    blt L_02200204
    ldmia sp!, {r4, r5, r6, pc}
.size func_ov025_022001f4, .-func_ov025_022001f4

