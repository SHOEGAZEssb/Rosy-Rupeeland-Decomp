.text
; Matching fallback for the portable implementation in src/overlays/ov056/overlay056_recovery.c.
.extern Heap_Free

.global func_ov056_0220e71c
func_ov056_0220e71c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x4]
    b .L_0220e740
.L_0220e72c:
    cmp r0, #0x0
    ldr r4, [r0, #0x0]
    beq .L_0220e73c
    bl Heap_Free
.L_0220e73c:
    mov r0, r4
.L_0220e740:
    cmp r0, #0x0
    bne .L_0220e72c
    mov r0, #0x0
    str r0, [r5, #0x4]
    str r0, [r5, #0x8]
    str r0, [r5, #0xc]
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov056_0220e71c, . - func_ov056_0220e71c
