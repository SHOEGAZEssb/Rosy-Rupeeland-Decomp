.text
.extern data_020d4264
.extern data_020d4350
.extern func_0200bb34
.extern func_0200bdc4
.extern gHeapContext
.extern Heap_Alloc

    .global func_02006fd4
.type func_02006fd4, @function
func_02006fd4:
    ldr r2, L_02006fec
    ldrh r1, [r2, #0x0]
    bic r1, r1, #0x8000
    orr r0, r1, r0, lsl #0xf
    strh r0, [r2, #0x0]
    bx lr
L_02006fec: .word 0x4000304
    .size func_02006fd4, .-func_02006fd4

    .global func_02006ff0
.type func_02006ff0, @function
func_02006ff0:
    stmdb sp!, {r4, lr}
    ldr r1, L_02007034
    mov r4, r0
    ldr r3, L_02007038
    mov r0, #0x34
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_02007018
    bl func_0200bb34
L_02007018:
    add r1, r4, #0x3000
    str r0, [r1, #0xb4]
    ldr r1, L_0200703c
    mov r2, #0xb
    mov r3, #0x0
    bl func_0200bdc4
    ldmia sp!, {r4, pc}
L_02007034: .word data_020d4350
L_02007038: .word gHeapContext
L_0200703c: .word data_020d4264
    .size func_02006ff0, .-func_02006ff0

    .global func_02007040
.type func_02007040, @function
func_02007040:
    stmdb sp!, {r3, lr}
    add r0, r0, #0x3000
    ldr r0, [r0, #0xb4]
    cmp r0, #0x0
    ldmeqia sp!, {r3, pc}
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
    ldmia sp!, {r3, pc}
    .size func_02007040, .-func_02007040

