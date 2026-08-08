.text

/* Exact fallback; see src/overlays/ov025/overlay025_scene_runtime.c. */
.extern func_02095bec


    .global func_ov025_022002b0
func_ov025_022002b0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x59c]
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    bl func_02095bec
    ldr r0, [r4, #0x59c]
    cmp r0, #0x0
    beq L_022002e0
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_022002e0:
    mov r0, #0x0
    str r0, [r4, #0x59c]
    ldr r0, [r4, #0x48]
    bic r0, r0, #0x2
    str r0, [r4, #0x48]
    ldmia sp!, {r4, pc}
.size func_ov025_022002b0, .-func_ov025_022002b0

