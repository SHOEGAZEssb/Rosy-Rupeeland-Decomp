.text
.extern __destroy_arr
.extern Heap_Free
.extern func_ov042_021fcf9c
.extern func_ov042_02209a8c
.extern func_ov042_02209128
.extern func_ov042_02208894
.extern func_ov042_02207ef0
.extern func_02099fb0
.extern data_ov042_0220b57c
.global func_ov042_0220049c
func_ov042_0220049c:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r1, .L_022005fc
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r5, [r4, #0xa0]
    cmp r5, #0x0
    beq .L_022004ec
    add r0, r5, #0x44
    ldr r3, .L_02200600
    add r0, r0, #0x400
    mov r1, #0x40
    mov r2, #0xc
    bl __destroy_arr
    ldr r3, .L_02200600
    add r0, r5, #0x144
    mov r1, #0x40
    mov r2, #0xc
    bl __destroy_arr
    mov r0, r5
    bl Heap_Free
.L_022004ec:
    mov r0, #0x5
    sub r6, r0, #0x1
    mov r5, #0x0
.L_022004f8:
    add r0, r4, r6, lsl #0x2
    ldr r7, [r0, #0x8c]
    cmp r7, #0x0
    beq .L_02200524
    beq .L_0220051c
    mov r0, r7
    bl func_ov042_02209a8c
    mov r0, r7
    bl Heap_Free
.L_0220051c:
    add r0, r4, r6, lsl #0x2
    str r5, [r0, #0x8c]
.L_02200524:
    subs r6, r6, #0x1
    bpl .L_022004f8
    mov r0, #0x2
    sub r6, r0, #0x1
    mov r5, #0x0
.L_02200538:
    add r0, r4, r6, lsl #0x2
    ldr r7, [r0, #0x84]
    cmp r7, #0x0
    beq .L_02200564
    beq .L_0220055c
    mov r0, r7
    bl func_ov042_02209128
    mov r0, r7
    bl Heap_Free
.L_0220055c:
    add r0, r4, r6, lsl #0x2
    str r5, [r0, #0x84]
.L_02200564:
    subs r6, r6, #0x1
    bpl .L_02200538
    mov r0, #0x3
    sub r6, r0, #0x1
    mov r5, #0x0
.L_02200578:
    add r0, r4, r6, lsl #0x2
    ldr r7, [r0, #0x78]
    cmp r7, #0x0
    beq .L_022005a4
    beq .L_0220059c
    mov r0, r7
    bl func_ov042_02208894
    mov r0, r7
    bl Heap_Free
.L_0220059c:
    add r0, r4, r6, lsl #0x2
    str r5, [r0, #0x78]
.L_022005a4:
    subs r6, r6, #0x1
    bpl .L_02200578
    mov r0, #0x4
    sub r6, r0, #0x1
    mov r5, #0x0
.L_022005b8:
    add r0, r4, r6, lsl #0x2
    ldr r7, [r0, #0x68]
    cmp r7, #0x0
    beq .L_022005e4
    beq .L_022005dc
    mov r0, r7
    bl func_ov042_02207ef0
    mov r0, r7
    bl Heap_Free
.L_022005dc:
    add r0, r4, r6, lsl #0x2
    str r5, [r0, #0x68]
.L_022005e4:
    subs r6, r6, #0x1
    bpl .L_022005b8
    mov r0, r4
    bl func_02099fb0
    mov r0, r4
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_022005fc: .word data_ov042_0220b57c
.L_02200600: .word func_ov042_021fcf9c
.size func_ov042_0220049c, . - func_ov042_0220049c
