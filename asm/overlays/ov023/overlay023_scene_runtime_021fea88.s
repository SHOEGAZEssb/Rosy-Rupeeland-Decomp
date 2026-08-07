.text

/* Exact fallback; see src/overlays/ov023/overlay023_scene_runtime.c. */
.extern func_02093af8
.extern func_ov023_021fd398


    .global func_ov023_021fea88
func_ov023_021fea88:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x390]
    bl func_ov023_021fd398
    ldr r0, [r0, #0x0]
    ldr r3, [r4, #0x398]
    ldr r0, [r0, #0x4]
    mov r1, #0x0
    ldr r0, [r0, #0xc]
    and r2, r0, #0xff
    b L_021feae0
L_021feab4:
    add r0, r4, r1, lsl #0x2
    ldr r0, [r0, #0x3a0]
    cmp r2, r0
    bne L_021feadc
    add r0, r4, #0x480
    bl func_02093af8
    ldr r0, [r4, #0x48c]
    add r0, r4, r0, lsl #0x2
    ldr r0, [r0, #0x430]
    ldmia sp!, {r4, pc}
L_021feadc:
    add r1, r1, #0x1
L_021feae0:
    cmp r1, r3
    blt L_021feab4
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.size func_ov023_021fea88, .-func_ov023_021fea88

