.text
; Matching fallback for the portable implementation in src/overlays/ov056/overlay056_recovery.c.
.extern MIi_CpuClear32
.extern data_ov056_0220f6fc
.extern func_02003e20
.extern func_02003e38
.extern func_020b171c
.extern func_020b44e8
.extern func_ov056_0220ec70
.extern func_ov056_0220f40c
.extern func_ov056_0220f58c
.extern gHeapContext

.global func_ov056_0220e8f8
func_ov056_0220e8f8:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r4, r0
    mov r7, r1
    mov r5, r2
    bl func_ov056_0220ec70
    add r3, r4, #0x1c
    mov r6, r0
    mov r1, r7
    mov r2, r5
    add r0, r3, #0x800
    bl func_ov056_0220f40c
    mov r5, r0
    ldr r1, .L_0220e998
    ldr r3, .L_0220e99c
    mov r0, #0x800
    mvn r2, #0x3
    bl func_02003e20
    mov r7, r0
    cmp r5, #0x0
    bge .L_0220e95c
    mov r1, r7
    mov r0, #0x0
    mov r2, #0x800
    bl MIi_CpuClear32
    b .L_0220e978
.L_0220e95c:
    ldr r1, [r4, #0x838]
    add r2, r4, #0x4c
    str r1, [sp, #0x0]
    ldr r3, [r4, #0x834]
    mov r1, r5
    add r2, r2, #0x800
    bl func_ov056_0220f58c
.L_0220e978:
    bl func_020b44e8
    mov r0, r7
    mov r1, r6, lsl #0xb
    mov r2, #0x800
    bl func_020b171c
    mov r0, r7
    bl func_02003e38
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0220e998: .word data_ov056_0220f6fc
.L_0220e99c: .word gHeapContext
.size func_ov056_0220e8f8, . - func_ov056_0220e8f8
