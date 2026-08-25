.text
; Matching fallback for the portable implementation in src/overlays/ov056/overlay056_recovery.c.
.extern MIi_CpuClear32
.extern MIi_CpuClearFast
.extern data_ov056_0220f6fc
.extern Heap_AllocAlternateEntry
.extern Heap_FreeAlternateEntry
.extern func_020b1ff0
.extern func_ov056_0220f200
.extern func_ov056_0220f40c
.extern func_ov056_0220f58c
.extern gHeapContext

.global func_ov056_0220f0ac
func_ov056_0220f0ac:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x24
    mov r10, r0
    ldr r0, [r10, #0x0]
    str r1, [sp, #0x4]
    mov r9, r2
    mov r1, #0x0
    mov r2, #0x20
    mov r11, r3
    bl func_020b1ff0
    ldr r1, [sp, #0x4]
    mov r0, #0x0
    mov r2, #0x20000
    bl MIi_CpuClearFast
    mov r4, #0x0
.L_0220f0e8:
    add r6, r11, r4
    sub r2, r6, #0x40
    mov r0, r2, asr #0x5
    mov r1, r6, asr #0x5
    add r0, r2, r0, lsr #0x1a
    mov r0, r0, asr #0x6
    add r1, r6, r1, lsr #0x1a
    str r0, [sp, #0xc]
    mov r0, r1, asr #0x6
    str r0, [sp, #0x8]
    add r0, r10, #0x1c
    str r0, [sp, #0x20]
    add r0, r10, #0x4c
    str r0, [sp, #0x1c]
    mvn r0, #0x3
    mov r5, #0x0
    str r0, [sp, #0x18]
.L_0220f12c:
    adds r1, r9, r5
    submi r1, r1, #0x40
    mov r0, r1, asr #0x5
    cmp r6, #0x0
    ldrlt r8, [sp, #0xc]
    add r0, r1, r0, lsr #0x1a
    mov r7, r0, asr #0x6
    ldrge r8, [sp, #0x8]
    ldr r0, [sp, #0x20]
    mov r1, r7
    add r0, r0, #0x800
    mov r2, r8
    bl func_ov056_0220f40c
    str r0, [sp, #0x14]
    ldr r1, .L_0220f1f8
    ldr r2, [sp, #0x18]
    ldr r3, .L_0220f1fc
    mov r0, #0x800
    bl Heap_AllocAlternateEntry
    ldr r1, [sp, #0x14]
    str r0, [sp, #0x10]
    cmp r1, #0x0
    bge .L_0220f19c
    ldr r1, [sp, #0x10]
    mov r0, #0x0
    mov r2, #0x800
    bl MIi_CpuClear32
    b .L_0220f1b4
.L_0220f19c:
    ldr r3, [r10, #0x838]
    ldr r2, [sp, #0x1c]
    str r3, [sp, #0x0]
    ldr r3, [r10, #0x834]
    add r2, r2, #0x800
    bl func_ov056_0220f58c
.L_0220f1b4:
    rsb r0, r11, r8, lsl #0x6
    str r0, [sp, #0x0]
    ldr r1, [sp, #0x4]
    ldr r2, [sp, #0x10]
    rsb r3, r9, r7, lsl #0x6
    mov r0, r10
    bl func_ov056_0220f200
    ldr r0, [sp, #0x10]
    bl Heap_FreeAlternateEntry
    add r5, r5, #0x40
    cmp r5, #0x140
    blt .L_0220f12c
    add r4, r4, #0x40
    cmp r4, #0x140
    blt .L_0220f0e8
    add sp, sp, #0x24
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0220f1f8: .word data_ov056_0220f6fc
.L_0220f1fc: .word gHeapContext
.size func_ov056_0220f0ac, . - func_ov056_0220f0ac
