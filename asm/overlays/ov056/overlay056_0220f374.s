.text
; Matching fallback for the portable implementation in src/overlays/ov056/overlay056_recovery.c.
.extern data_ov056_0220f668
.extern Heap_AllocAlternateEntry
.extern func_ov056_0220f348
.extern gHeapContext

.global func_ov056_0220f374
func_ov056_0220f374:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    str r1, [r4, #0x8]
    str r2, [r4, #0xc]
    ldr r1, [r4, #0x8]
    mul r5, r1, r2
    ldr r1, [r4, #0x0]
    cmp r1, #0x0
    beq .L_0220f39c
    bl func_ov056_0220f348
.L_0220f39c:
    ldr r1, .L_0220f3dc
    ldr r3, .L_0220f3e0
    mov r0, r5, lsl #0x1
    mov r2, #0x4
    bl Heap_AllocAlternateEntry
    stmia r4, {r0, r5}
    mov r2, #0x0
    b .L_0220f3cc
.L_0220f3bc:
    ldr r1, [r4, #0x0]
    mov r0, r2, lsl #0x1
    strh r2, [r1, r0]
    add r2, r2, #0x1
.L_0220f3cc:
    ldr r0, [r4, #0x4]
    cmp r2, r0
    blt .L_0220f3bc
    ldmia sp!, {r3, r4, r5, pc}
.L_0220f3dc: .word data_ov056_0220f668
.L_0220f3e0: .word gHeapContext
.size func_ov056_0220f374, . - func_ov056_0220f374
