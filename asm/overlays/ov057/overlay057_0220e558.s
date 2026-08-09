.text
; Matching fallback for the portable implementation in src/overlays/ov057/overlay057_recovery.c.
.extern Heap_Alloc
.extern data_021052fc
.extern data_ov057_0220e7f4
.extern func_0201df44
.extern func_ov057_0220e400
.extern gHeapContext

.global func_ov057_0220e558
func_ov057_0220e558:
    stmdb sp!, {r3, lr}
    ldr r1, .L_0220e598
    ldr r3, .L_0220e59c
    mov r0, #0x28
    mov r2, #0x4
    bl Heap_Alloc
    movs r1, r0
    beq .L_0220e580
    bl func_ov057_0220e400
    mov r1, r0
.L_0220e580:
    ldr r0, .L_0220e5a0
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl func_0201df44
    ldmia sp!, {r3, pc}
.L_0220e598: .word data_ov057_0220e7f4
.L_0220e59c: .word gHeapContext
.L_0220e5a0: .word data_021052fc
.size func_ov057_0220e558, . - func_ov057_0220e558
