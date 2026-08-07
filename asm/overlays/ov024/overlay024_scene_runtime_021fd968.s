.text

/* Exact fallback; see src/overlays/ov024/overlay024_scene_runtime.c. */
.extern data_ov024_021fe1e4
.extern func_02028100
.extern func_02091a70
.extern func_02091b98
.extern func_ov002_021fbd64
.extern func_ov005_021fbd74
.extern func_ov024_021fd8f8
.extern func_ov046_0220bffc
.extern func_ov046_0220c3bc
.extern func_ov046_0220c410
.extern func_ov046_0220c46c


    .global func_ov024_021fd968
func_ov024_021fd968:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r6, r0
    ldr r5, [r6, #0x294]
    ldr r0, [r6, #0x2c0]
    mov r1, r5
    ldr r4, [r6, #0x290]
    bl func_ov046_0220c3bc
    mov r9, r0
    ldr r0, [r6, #0x2c0]
    mov r1, r5
    bl func_ov046_0220c410
    mov r8, r0
    ldr r0, [r6, #0x2c0]
    mov r1, r4
    bl func_ov046_0220c3bc
    mov r7, r0
    ldr r0, [r6, #0x2c0]
    mov r1, r4
    bl func_ov046_0220c410
    mov r1, r7
    mov r7, r0
    ldr r2, [r6, #0x2a8]
    ldr r3, [r6, #0x2ac]
    mov r0, r9
    bl func_02091a70
    mov r1, r7
    mov r7, r0
    ldr r2, [r6, #0x2a8]
    ldr r3, [r6, #0x2ac]
    mov r0, r8
    bl func_02091a70
    mov r2, r0
    ldr r0, [r6, #0x2c0]
    mov r1, r7
    bl func_ov046_0220c46c
    ldr r1, L_021fdaac
    ldr r2, [r6, #0x2a8]
    ldr r0, [r1, r5, lsl #0x2]
    ldr r1, [r1, r4, lsl #0x2]
    ldr r3, [r6, #0x2ac]
    bl func_02091a70
    str r0, [r6, #0x2e8]
    ldr r2, [r6, #0x2e8]
    ldr r0, [r6, #0x2bc]
    mov r1, #0x0
    rsb r2, r2, #0x0
    bl func_ov002_021fbd64 ; func_ov005_021fbd64
    ldr r0, [r6, #0x48]
    orr r0, r0, #0x7
    str r0, [r6, #0x48]
    ldr r0, [r6, #0x2e8]
    cmp r0, #0xc0
    ldr r0, [r6, #0x48]
    biclt r0, r0, #0x4
    bicge r0, r0, #0x1
    str r0, [r6, #0x48]
    ldr r0, [r6, #0x2a8]
    ldr r1, [r6, #0x2ac]
    add r0, r0, r0, lsr #0x1f
    cmp r1, r0, asr #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    mov r0, r6
    mov r1, r4
    bl func_ov024_021fd8f8
    ldr r0, [r6, #0x2c4]
    mov r1, r4
    bl func_02028100
    mov r2, #0x0
    ldr r0, [r6, #0x2c0]
    mov r1, r4
    mov r3, r2
    bl func_ov046_0220bffc
    ldr r0, [r6, #0x2bc]
    mov r1, r4
    bl func_ov005_021fbd74
    add r0, r6, #0x2c8
    mov r1, #0x78
    bl func_02091b98
    mov r0, #0x1
    str r0, [r6, #0x2e4]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
L_021fdaac: .word data_ov024_021fe1e4
.size func_ov024_021fd968, .-func_ov024_021fd968

