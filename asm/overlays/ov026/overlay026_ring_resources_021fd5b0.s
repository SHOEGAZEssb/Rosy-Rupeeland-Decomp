.text

/* Exact fallback; see src/overlays/ov026/overlay026_ring_resources.c. */
.extern data_020f4e18
.extern data_ov026_02204998
.extern data_ov026_02204a40
.extern func_02077ca0
.extern func_020949ec
.extern gHeapContext
.extern Heap_Alloc


    .global func_ov026_021fd5b0
func_ov026_021fd5b0:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, r1
    bl func_020949ec
    ldr ip, L_021fd614
    ldr r1, L_021fd618
    ldr r3, L_021fd61c
    mov r0, #0x18
    mov r2, #0x4
    str ip, [r5, #0x0]
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fd600
    ldr r3, L_021fd620
    ldr r1, L_021fd624
    str r3, [sp, #0x0]
    ldr r1, [r1, #0x0]
    mov r2, r4
    sub r3, r3, #0x1
    bl func_02077ca0
L_021fd600:
    str r0, [r5, #0x9c]
    mov r1, #0x0
    mov r0, r5
    str r1, [r5, #0xa0]
    ldmia sp!, {r3, r4, r5, pc}
L_021fd614: .word data_ov026_02204998
L_021fd618: .word data_ov026_02204a40
L_021fd61c: .word gHeapContext
L_021fd620: .word 0x612b
L_021fd624: .word data_020f4e18
.size func_ov026_021fd5b0, .-func_ov026_021fd5b0

