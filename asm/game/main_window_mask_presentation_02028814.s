; Matching retail form; see src/game/main_window_mask_presentation.c.
.text
.extern Heap_Alloc
.extern data_020de858
.extern gGamePhaseRuntime
.extern RuntimePresentationManager_AppendSecondListEffect
.extern func_02028778
.extern gHeapContext

    .global func_02028814
    .type func_02028814, @function
func_02028814: ; 0x02028814
    stmdb sp!, {r4, lr}
    ldr r0, .L_02028854
    ldr r1, .L_02028858
    ldr r4, [r0, #0x0]
    ldr r3, .L_0202885c
    mov r0, #0x8
    mov r2, #0x4
    add r4, r4, #0x37c
    bl Heap_Alloc
    movs r1, r0
    beq .L_02028848
    bl func_02028778
    mov r1, r0
.L_02028848:
    add r0, r4, #0x2c00
    bl RuntimePresentationManager_AppendSecondListEffect
    ldmia sp!, {r4, pc}
.L_02028854: .word gGamePhaseRuntime
.L_02028858: .word data_020de858
.L_0202885c: .word gHeapContext
    .size func_02028814, . - func_02028814

