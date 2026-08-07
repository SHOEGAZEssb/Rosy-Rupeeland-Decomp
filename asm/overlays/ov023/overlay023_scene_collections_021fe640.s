.text

/* Exact fallback; see src/overlays/ov023/overlay023_scene_collections.c. */
.extern func_020954e0
.extern func_020954f4


    .global func_ov023_021fe640
func_ov023_021fe640:
    stmdb sp!, {r4, lr}
    mov r4, r0
    cmp r1, #0x0
    beq L_021fe680
    ldr r0, [r4, #0x398]
    cmp r0, #0x1
    ldr r0, [r4, #0x380]
    ble L_021fe670
    bl func_020954e0
    ldr r0, [r4, #0x384]
    bl func_020954e0
    ldmia sp!, {r4, pc}
L_021fe670:
    bl func_020954f4
    ldr r0, [r4, #0x384]
    bl func_020954f4
    ldmia sp!, {r4, pc}
L_021fe680:
    ldr r0, [r4, #0x380]
    bl func_020954f4
    ldr r0, [r4, #0x384]
    bl func_020954f4
    ldmia sp!, {r4, pc}
.size func_ov023_021fe640, .-func_ov023_021fe640

