.text

/* Exact fallback; see src/overlays/ov026/overlay026_ring_resources.c. */
.extern data_020c9670
.extern data_ov026_022049ec
.extern data_ov026_02204a48
.extern Heap_AllocCore
.extern func_020949ec
.extern func_020afddc
.extern func_020afe00
.extern func_020afe64
.extern func_020afebc
.extern func_020aff38
.extern func_020b0000
.extern func_020b241c
.extern func_020b24cc
.extern func_020b4554
.extern func_ov026_021fd018
.extern gHeapContext


    .global func_ov026_021fd370
func_ov026_021fd370:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x14
    mov r10, r0
    bl func_020949ec
    ldr r1, L_021fd4cc
    mov r0, #0x1000
    str r1, [r10, #0x0]
    str r0, [r10, #0xb4]
    ldr r1, L_021fd4d0
    ldr r3, L_021fd4d4
    mov r0, #0x200
    mov r2, #0x4
    bl Heap_AllocCore
    str r0, [r10, #0xb0]
    mov r1, r0
    add r0, r10, #0x9c
    mov r2, #0x200
    bl func_020b24cc
    mov r2, #0x0
    mov r1, #0x1
    str r2, [sp, #0x0]
    mov r0, #0x1f
    stmib sp, {r0, r2}
    add r0, r10, #0x9c
    mov r3, r1
    bl func_020afebc
    mov r1, #0x0
    str r1, [sp, #0x0]
    str r1, [sp, #0x4]
    str r1, [sp, #0x8]
    str r1, [sp, #0xc]
    add r0, r10, #0x9c
    mov r2, r1
    mov r3, r1
    str r1, [sp, #0x10]
    bl func_020afe64
    add r0, r10, #0x9c
    mov r1, #0x2
    bl func_020afe00
    mov r7, #0x0
    ldr r6, L_021fd4d8
    ldr r11, L_021fd4dc
    mov r5, r7
    mov r4, #0x1000
L_021fd420:
    mov r1, r7, lsl #0x10
    mov r0, r1, asr #0x3
    add r0, r1, r0, lsr #0x1c
    mov r0, r0, lsl #0xc
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x4
    mov r0, r0, lsl #0x1
    mov r1, r0, lsl #0x1
    add r0, r6, r0, lsl #0x1
    ldrsh r8, [r6, r1]
    ldrsh r9, [r0, #0x2]
    mov r1, r5
    add r0, r10, #0x9c
    bl func_020b0000
    mov r1, r8
    add r0, r10, #0x9c
    mov r2, r4
    mov r3, r9
    bl func_020aff38
    add r0, r10, #0x9c
    mov r1, r11
    bl func_020b0000
    mov r1, r8
    mov r3, r9
    add r0, r10, #0x9c
    mov r2, #0x0
    bl func_020aff38
    add r7, r7, #0x1
    cmp r7, #0x10
    ble L_021fd420
    add r0, r10, #0x9c
    bl func_020afddc
    add r0, r10, #0x9c
    bl func_020b241c
    ldr r4, [r10, #0xa4]
    add r0, r10, #0x9c
    bl func_ov026_021fd018
    mov r1, r0
    mov r0, r4
    bl func_020b4554
    mov r0, r10
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_021fd4cc: .word data_ov026_022049ec
L_021fd4d0: .word data_ov026_02204a48
L_021fd4d4: .word gHeapContext
L_021fd4d8: .word data_020c9670
L_021fd4dc: .word 0x7e08
.size func_ov026_021fd370, .-func_ov026_021fd370

