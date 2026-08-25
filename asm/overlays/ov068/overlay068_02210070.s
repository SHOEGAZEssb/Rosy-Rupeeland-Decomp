.text
; Matching fallback for the portable implementation in src/overlays/ov068/overlay068_recovery.c.
.extern data_ov068_02210740
.extern Heap_AllocAlternateEntry
.extern func_ov068_02210044
.extern gHeapContext

.global func_ov068_02210070
func_ov068_02210070:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r2, [r5, #0x0]
    mov r4, r1
    cmp r2, #0x0
    beq .L_0221008c
    bl func_ov068_02210044
.L_0221008c:
    ldr r1, .L_022100a8
    ldr r3, .L_022100ac
    mov r0, r4, lsl #0x2
    mov r2, #0x4
    bl Heap_AllocAlternateEntry
    stmia r5, {r0, r4}
    ldmia sp!, {r3, r4, r5, pc}
.L_022100a8: .word data_ov068_02210740
.L_022100ac: .word gHeapContext
.size func_ov068_02210070, . - func_ov068_02210070
