.text
; Matching fallback for the portable implementation in src/overlays/ov053/overlay053_recovery.c.
.extern Heap_Alloc
.extern data_021052fc
.extern data_ov053_0220dd30
.extern func_0201ded4
.extern func_ov053_0220d624
.extern gHeapContext

.global func_ov053_0220da0c
func_ov053_0220da0c:
    stmdb sp!, {r4, lr}
    ldr r1, .L_0220da54
    mov r4, r0
    ldr r3, .L_0220da58
    mov r0, #0x40
    mov r2, #0x4
    bl Heap_Alloc
    movs r1, r0
    beq .L_0220da3c
    mov r1, r4
    bl func_ov053_0220d624
    mov r1, r0
.L_0220da3c:
    ldr r0, .L_0220da5c
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl func_0201ded4
    ldmia sp!, {r4, pc}
.L_0220da54: .word data_ov053_0220dd30
.L_0220da58: .word gHeapContext
.L_0220da5c: .word data_021052fc
.size func_ov053_0220da0c, . - func_ov053_0220da0c
