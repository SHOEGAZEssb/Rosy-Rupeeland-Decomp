.text

/* Exact fallback; see src/overlays/ov025/overlay025_scene_runtime.c. */
.extern data_ov025_02202ccc
.extern func_02095820
.extern func_02095928
.extern func_02095988


    .global func_ov025_02200498
func_ov025_02200498:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x24
    ldr r7, L_02200530
    add r6, sp, #0x0
    mov r4, r0
    mov r9, r1
    mov r5, #0x2
L_022004b4:
    ldmia r7!, {r0, r1, r2, r3}
    stmia r6!, {r0, r1, r2, r3}
    subs r5, r5, #0x1
    bne L_022004b4
    add r1, sp, #0x0
    mov r0, #0xc
    mla r8, r9, r0, r1
    ldr r0, [r7, #0x0]
    mov r7, #0x0
    str r0, [r6, #0x0]
    add r6, r4, #0x2f4
    mov r4, #0xd4
    mov r9, #0xac
L_022004e8:
    mul r5, r7, r9
    ldr r0, [r8, r7, lsl #0x2]
    mov r1, r4
    mov r2, r0, lsl #0x10
    add r0, r6, r5
    mov r2, r2, asr #0x10
    bl func_02095820
    mov r1, r7, lsl #0x1
    add r0, r6, r5
    add r1, r1, #0x20
    bl func_02095988
    add r0, r6, r5
    bl func_02095928
    add r7, r7, #0x1
    cmp r7, #0x3
    blt L_022004e8
    add sp, sp, #0x24
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
L_02200530: .word data_ov025_02202ccc
.size func_ov025_02200498, .-func_ov025_02200498

