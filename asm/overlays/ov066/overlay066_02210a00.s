.text
; Matching fallback for the portable implementation in src/overlays/ov066/overlay066_recovery.c.
.extern Heap_Alloc
.extern data_ov066_02210fc0
.extern func_ov066_02210458
.extern gHeapContext

.global func_ov066_02210a00
func_ov066_02210a00:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x10
    mov r4, r0
    ldr r0, [r4, #0x190]
    mov r7, r1
    mov r6, r2
    mov r5, r3
    cmp r0, #0x64
    bge .L_02210a88
    ldr r1, .L_02210a94
    ldr r3, .L_02210a98
    mov r0, #0x24
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_02210a6c
    ldr r2, [r4, #0x1a8]
    mov r1, r7
    str r2, [sp, #0x0]
    ldr r3, [r4, #0x1ac]
    mov r2, r6
    str r3, [sp, #0x4]
    ldr r3, [r4, #0x1b0]
    str r3, [sp, #0x8]
    str r5, [sp, #0xc]
    ldr r3, [r4, #0x1a4]
    bl func_ov066_02210458
.L_02210a6c:
    ldr r1, [r4, #0x190]
    str r0, [r4, r1, lsl #0x2]
    ldr r1, [r4, #0x190]
    mov r0, #0x1
    add r1, r1, #0x1
    str r1, [r4, #0x190]
    b .L_02210a8c
.L_02210a88:
    mov r0, #0x0
.L_02210a8c:
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_02210a94: .word data_ov066_02210fc0
.L_02210a98: .word gHeapContext
.size func_ov066_02210a00, . - func_ov066_02210a00
