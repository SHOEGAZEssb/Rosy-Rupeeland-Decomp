.text

/* Exact fallback; see src/overlays/ov023/overlay023_scene_runtime.c. */
.extern data_ov023_021ffb98
.extern func_02092260
.extern func_ov023_021fd398
.extern func_ov023_021fd9d0
.extern func_ov045_0220c274
.extern func_ov045_0220c48c


    .global func_ov023_021feb60
func_ov023_021feb60:
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r1, #0x2
    bl func_02092260
    ldr r0, [r4, #0x390]
    bl func_ov023_021fd398
    str r0, [r4, #0x394]
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
    ldr r1, L_021febb8
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov023_021fd9d0
    ldmia sp!, {r4, pc}
L_021febb8: .word data_ov023_021ffb98
.size func_ov023_021feb60, .-func_ov023_021feb60

