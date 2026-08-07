.text

/* Exact fallback; see src/overlays/ov022/overlay022_state_machines.c. */
.extern data_ov022_02200654
.extern func_02095308
.extern Heap_Free


    .global func_ov022_0220048c
func_ov022_0220048c:
    stmdb sp!, {r4, lr}
    ldr r1, L_022004b0
    mov r4, r0
    str r1, [r4, #0x0]
    bl func_02095308
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
L_022004b0: .word data_ov022_02200654
.size func_ov022_0220048c, .-func_ov022_0220048c

