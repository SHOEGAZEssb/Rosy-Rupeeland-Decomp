.text

/* Exact fallback; see src/overlays/ov023/overlay023_scene_runtime.c. */
.extern func_02075598
.extern func_02092e9c
.extern func_02093360
.extern func_ov045_0220c028
.extern func_ov045_0220c128
.extern func_ov045_0220d2f8
.extern gDebugFont


    .global func_ov023_021fe804
func_ov023_021fe804:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x8
    mov r5, r0
    ldr r0, [r5, #0x4b8]
    mov r4, r2
    mov r2, #0x4
    bl func_02092e9c
    ldr r0, [r5, #0x4b8]
    ldr r1, [r5, #0x2c]
    bl func_02093360
    mov r1, r0, lsl #0x16
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    movs r0, r1, asr #0x1f
    beq L_021fe854
    ldr r1, [r5, #0x4b8]
    ldr r0, [r5, #0x4bc]
    ldr r1, [r1, #0xe8]
    bl func_ov045_0220c128
    b L_021fe85c
L_021fe854:
    ldr r0, [r5, #0x4bc]
    bl func_ov045_0220c028
L_021fe85c:
    ldr r0, L_021fe888
    ldr r1, [r5, #0x54]
    ldr r0, [r0, #0x0]
    bl func_02075598
    ldr r1, [r4, #0x4]
    ldr r0, [r1, #0xc]
    ldrh r1, [r1, #0x4]
    and r0, r0, #0xff
    bl func_ov045_0220d2f8
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, pc}
L_021fe888: .word gDebugFont
.size func_ov023_021fe804, .-func_ov023_021fe804

