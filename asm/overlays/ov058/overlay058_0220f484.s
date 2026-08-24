.text
; Matching fallback for the portable implementation in src/overlays/ov058/overlay058_recovery.c.
.extern Heap_Alloc
.extern gGamePhaseRuntime
.extern data_ov058_0220fd04
.extern RuntimePresentationManager_AppendSecondListEffect
.extern func_ov058_0220e840
.extern gHeapContext

.global func_ov058_0220f484
func_ov058_0220f484:
    stmdb sp!, {r4, lr}
    ldr r1, .L_0220f4dc
    ldr r3, .L_0220f4e0
    mov r0, #0xb0
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_0220f4bc
    ldr r1, .L_0220f4e4
    ldr r1, [r1, #0x0]
    add r1, r1, #0x3bc
    add r1, r1, #0x2c00
    bl func_ov058_0220e840
    mov r4, r0
.L_0220f4bc:
    ldr r0, .L_0220f4e4
    mov r1, r4
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl RuntimePresentationManager_AppendSecondListEffect
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0220f4dc: .word data_ov058_0220fd04
.L_0220f4e0: .word gHeapContext
.L_0220f4e4: .word gGamePhaseRuntime
.size func_ov058_0220f484, . - func_ov058_0220f484
