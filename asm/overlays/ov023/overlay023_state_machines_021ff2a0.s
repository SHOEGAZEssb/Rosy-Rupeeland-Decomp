.text

/* Exact fallback; see src/overlays/ov023/overlay023_state_machines.c. */
.extern data_ov023_021ffb68
.extern func_02092260
.extern func_ov023_021fd954
.extern func_ov023_021fd9d0
.extern func_ov045_0220c274
.extern func_ov045_0220c48c


    .global func_ov023_021ff2a0
func_ov023_021ff2a0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r1, #0x2
    bl func_02092260
    ldr r0, [r4, #0x478]
    bl func_ov023_021fd954
    str r0, [r4, #0x47c]
    ldr r0, [r0, #0x0]
    mov r2, #0x1
    ldr r1, [r0, #0x4]
    ldr r0, [r1, #0xc]
    ldrh r1, [r1, #0x4]
    and r0, r0, #0xff
    bl func_ov045_0220c48c ; func_ov049_0220c48c
    mvn r1, #0x7f
    str r0, [r4, #0x4bc]
    bl func_ov045_0220c274
    ldr r1, L_021ff2f8
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov023_021fd9d0
    ldmia sp!, {r4, pc}
L_021ff2f8: .word data_ov023_021ffb68
.size func_ov023_021ff2a0, .-func_ov023_021ff2a0

