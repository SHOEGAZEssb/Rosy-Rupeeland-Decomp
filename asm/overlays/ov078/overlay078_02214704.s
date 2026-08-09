.text
; Matching fallback for the portable implementation in src/overlays/ov078/overlay078_recovery.c.
.extern Heap_Alloc
.extern data_ov078_02216450
.extern func_0200500c
.extern func_02005058
.extern func_0201f864
.extern func_ov078_022147dc
.extern gHeapContext
.extern genrand_int32

.global func_ov078_02214704
func_ov078_02214704:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x38
    mov r4, r0
    bl genrand_int32
    and ip, r0, #0x1
    ldrsh r3, [r4, #0x6e]
    ldrsh r2, [r4, #0x6a]
    mov r1, #0x0
    add r5, ip, #0x1
    sub r0, r3, r2
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0x10
    add r0, r0, r0, lsr #0x1f
    mov r3, r0, asr #0x1
    add r0, sp, #0x18
    mov r2, r1
    mov r3, r3, lsl #0xc
    bl func_0200500c
    add r0, sp, #0x28
    add r2, sp, #0x18
    add r1, r4, #0x18
    bl func_ov078_022147dc
    add r0, sp, #0x18
    bl func_02005058
    ldr r1, .L_022147cc
    ldr r3, .L_022147d0
    mov r0, #0x14
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_022147bc
    ldr r2, .L_022147d4
    mvn r1, #0x3f
    str r2, [sp, #0x0]
    add r2, r2, #0x620
    stmib sp, {r2, r5}
    str r1, [sp, #0xc]
    add r1, r1, #0x3f
    str r1, [sp, #0x10]
    mov r1, #0x1
    str r1, [sp, #0x14]
    ldr r2, [r4, #0x54]
    ldr r3, .L_022147d8
    ldr r2, [r2, #0x0]
    add r1, sp, #0x28
    bl func_0201f864
.L_022147bc:
    add r0, sp, #0x28
    bl func_02005058
    add sp, sp, #0x38
    ldmia sp!, {r3, r4, r5, pc}
.L_022147cc: .word data_ov078_02216450
.L_022147d0: .word gHeapContext
.L_022147d4: .word 0x1001
.L_022147d8: .word 0x1620
.size func_ov078_02214704, . - func_ov078_02214704
