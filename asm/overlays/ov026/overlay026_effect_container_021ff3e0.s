.text

/* Exact fallback; see src/overlays/ov026/overlay026_effect_container.c. */
.extern data_020f4e18
.extern data_ov026_02204960
.extern func_02071e04
.extern func_02077d08
.extern func_ov026_021fce50
.extern Heap_Free


    .global func_ov026_021ff3e0
func_ov026_021ff3e0:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r1, L_021ff4f0
    mov r4, r0
    str r1, [r4, #0x0]
    mov r5, #0x0
L_021ff3f4:
    add r0, r4, r5, lsl #0x2
    ldr r6, [r0, #0xfc]
    cmp r6, #0x0
    beq L_021ff414
    mov r0, r6
    bl func_02077d08
    mov r0, r6
    bl Heap_Free
L_021ff414:
    add r5, r5, #0x1
    cmp r5, #0x8
    blt L_021ff3f4
    mov r5, #0x0
    b L_021ff448
L_021ff428:
    add r0, r4, r5, lsl #0x2
    ldr r0, [r0, #0xa0]
    cmp r0, #0x0
    beq L_021ff444
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021ff444:
    add r5, r5, #0x1
L_021ff448:
    ldr r0, [r4, #0x9c]
    cmp r5, r0
    blt L_021ff428
    ldr r0, [r4, #0xe0]
    cmp r0, #0x0
    beq L_021ff46c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021ff46c:
    ldr r0, [r4, #0xe4]
    cmp r0, #0x0
    beq L_021ff484
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021ff484:
    ldr r0, [r4, #0xe8]
    cmp r0, #0x0
    beq L_021ff49c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021ff49c:
    mov r5, #0x0
L_021ff4a0:
    add r0, r4, r5, lsl #0x2
    ldr r0, [r0, #0xec]
    cmp r0, #0x0
    beq L_021ff4bc
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021ff4bc:
    add r5, r5, #0x1
    cmp r5, #0x4
    blt L_021ff4a0
    ldr r0, L_021ff4f4
    ldr r1, [r4, #0x11c]
    ldr r0, [r0, #0x0]
    bl func_02071e04
    mov r0, r4
    bl func_ov026_021fce50
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, r5, r6, pc}
L_021ff4f0: .word data_ov026_02204960
L_021ff4f4: .word data_020f4e18
.size func_ov026_021ff3e0, .-func_ov026_021ff3e0

