.text
.extern func_ov044_0220b8e4
.extern Heap_Free

    .global func_ov044_0220c5c0
func_ov044_0220c5c0:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r0, [r4, #0x228]
    ldr r0, [r0, #0x44]
    ldr r0, [r0, #0xc]
    str r0, [r4, #0x230]
    ldr r0, [r4, #0x228]
    ldr r0, [r0, #0x44]
    ldr r0, [r0, #0x14]
    str r0, [r4, #0x234]
    ldr r5, [r4, #0x228]
    cmp r5, #0x0
    beq .L_0220c604
    mov r0, r5
    bl func_ov044_0220b8e4
    mov r0, r5
    bl Heap_Free
.L_0220c604:
    mov r0, #0x0
    str r0, [r4, #0x228]
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov044_0220c5c0, . - func_ov044_0220c5c0
