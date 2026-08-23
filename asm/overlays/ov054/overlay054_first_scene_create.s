.text
; Matching fallback for the portable implementation in src/overlays/ov054/overlay054_recovery.c.
.extern Heap_Alloc
.extern data_021052fc
.extern data_ov054_0220f150
.extern RuntimePresentationManager_AppendSecondListEffect
.extern func_ov054_0220e68c
.extern gHeapContext

.global func_ov054_0220e9bc
func_ov054_0220e9bc:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r1
    mov r5, r0
    ldr r1, .L_0220ea0c
    ldr r3, .L_0220ea10
    mov r0, #0x1b8
    mov r2, #0x4
    bl Heap_Alloc
    movs r1, r0
    beq .L_0220e9f4
    mov r1, r5
    mov r2, r4
    bl func_ov054_0220e68c
    mov r1, r0
.L_0220e9f4:
    ldr r0, .L_0220ea14
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl RuntimePresentationManager_AppendSecondListEffect
    ldmia sp!, {r3, r4, r5, pc}
.L_0220ea0c: .word data_ov054_0220f150
.L_0220ea10: .word gHeapContext
.L_0220ea14: .word data_021052fc
.size func_ov054_0220e9bc, . - func_ov054_0220e9bc
