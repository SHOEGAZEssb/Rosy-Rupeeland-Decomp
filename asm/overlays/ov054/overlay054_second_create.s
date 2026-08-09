.text
; Matching fallback for the portable implementation in src/overlays/ov054/overlay054_recovery.c.
.extern Heap_Alloc
.extern data_021052fc
.extern data_ov054_0220f150
.extern data_ov054_0220f160
.extern func_0201ded4
.extern func_ov054_0220ec6c
.extern gHeapContext

.global func_ov054_0220ef80
func_ov054_0220ef80:
    stmdb sp!, {r4, lr}
    ldr r1, .L_0220efd0
    mov r4, r0
    ldr r3, .L_0220efd4
    mov r0, #0x50
    mov r2, #0x4
    bl Heap_Alloc
    movs r1, r0
    beq .L_0220efb0
    mov r1, r4
    bl func_ov054_0220ec6c
    mov r1, r0
.L_0220efb0:
    ldr r0, .L_0220efd8
    ldr r2, .L_0220efdc
    ldr r0, [r0, #0x0]
    str r1, [r2, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl func_0201ded4
    ldmia sp!, {r4, pc}
.L_0220efd0: .word data_ov054_0220f150
.L_0220efd4: .word gHeapContext
.L_0220efd8: .word data_021052fc
.L_0220efdc: .word data_ov054_0220f160
.size func_ov054_0220ef80, . - func_ov054_0220ef80
