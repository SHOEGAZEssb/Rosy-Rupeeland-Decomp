.text
; Matching fallback for the portable implementation in src/overlays/ov050/overlay050_scene_recovery.c.
.extern Heap_Alloc
.extern data_021052fc
.extern data_ov050_0220e3f0
.extern func_0201ded4
.extern func_ov050_0220db84
.extern gHeapContext

.global func_ov050_0220e1a0
func_ov050_0220e1a0:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r1
    mov r6, r0
    mov r4, r2
    ldr r1, .L_0220e1f8
    ldr r3, .L_0220e1fc
    mov r0, #0x60
    mov r2, #0x4
    bl Heap_Alloc
    movs r1, r0
    beq .L_0220e1e0
    mov r1, r6
    mov r2, r5
    mov r3, r4
    bl func_ov050_0220db84
    mov r1, r0
.L_0220e1e0:
    ldr r0, .L_0220e200
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl func_0201ded4
    ldmia sp!, {r4, r5, r6, pc}
.L_0220e1f8: .word data_ov050_0220e3f0
.L_0220e1fc: .word gHeapContext
.L_0220e200: .word data_021052fc
.size func_ov050_0220e1a0, . - func_ov050_0220e1a0
