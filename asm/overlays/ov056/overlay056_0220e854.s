.text
; Matching fallback for the portable implementation in src/overlays/ov056/overlay056_recovery.c.
.extern Heap_Free
.extern func_ov056_0220e890

.global func_ov056_0220e854
func_ov056_0220e854:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r5, [r0, #0x840]
    add r4, r0, #0x3c
    b .L_0220e884
.L_0220e864:
    ldr r0, [r5, #0x8]
    cmp r0, #0x0
    beq .L_0220e874
    bl Heap_Free
.L_0220e874:
    mov r1, r5
    add r0, r4, #0x800
    bl func_ov056_0220e890
    ldr r5, [r5, #0x0]
.L_0220e884:
    cmp r5, #0x0
    bne .L_0220e864
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov056_0220e854, . - func_ov056_0220e854
