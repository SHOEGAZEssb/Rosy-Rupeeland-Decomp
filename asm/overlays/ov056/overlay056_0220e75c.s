.text
; Matching fallback for the portable implementation in src/overlays/ov056/overlay056_recovery.c.
.extern data_ov056_0220f660
.extern Heap_AllocAlternateEntry
.extern func_ov056_0220e6b0
.extern gHeapContext

.global func_ov056_0220e75c
func_ov056_0220e75c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r2, [r5, #0x0]
    mov r4, r1
    cmp r2, #0x0
    beq .L_0220e778
    bl func_ov056_0220e6b0
.L_0220e778:
    ldr r1, .L_0220e794
    ldr r3, .L_0220e798
    mov r0, r4, lsl #0x2
    mov r2, #0x4
    bl Heap_AllocAlternateEntry
    stmia r5, {r0, r4}
    ldmia sp!, {r3, r4, r5, pc}
.L_0220e794: .word data_ov056_0220f660
.L_0220e798: .word gHeapContext
.size func_ov056_0220e75c, . - func_ov056_0220e75c
