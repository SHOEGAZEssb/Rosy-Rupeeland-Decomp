.text
; Matching fallback for the portable implementation in src/overlays/ov056/overlay056_recovery.c.
.extern Heap_Free
.extern data_ov056_0220f6a4
.extern func_ov056_0220e71c

.global func_ov056_0220f62c
func_ov056_0220f62c:
    stmdb sp!, {r4, lr}
    ldr r1, .L_0220f650
    mov r4, r0
    str r1, [r4, #0x0]
    bl func_ov056_0220e71c
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0220f650: .word data_ov056_0220f6a4
.size func_ov056_0220f62c, . - func_ov056_0220f62c
