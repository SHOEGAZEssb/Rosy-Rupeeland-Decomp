; Matching retail form; see src/game/fx32_vector_limit.c.
.extern func_0204cfa4
.extern func_020adc90
.text
    .global func_0204cff4
.type func_0204cff4, @function
func_0204cff4: ; 0x0204cff4
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r0
    mov r6, r1
    ldr r0, [r7, #0x0]
    ldr r1, [r6, #0x0]
    mov r5, r2
    bl func_0204cfa4
    mov r4, r0
    cmp r4, r5
    ldmleia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r0, [r7, #0x0]
    mov r1, r4
    bl func_020adc90
    smull r2, r1, r0, r5
    adds r2, r2, #0x800
    adc r0, r1, #0x0
    mov r1, r2, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    str r1, [r7, #0x0]
    ldr r0, [r6, #0x0]
    mov r1, r4
    bl func_020adc90
    smull r2, r1, r0, r5
    adds r2, r2, #0x800
    adc r0, r1, #0x0
    mov r1, r2, lsr #0xc
    orr r1, r1, r0, lsl #0x14
    str r1, [r6, #0x0]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.size func_0204cff4, . - func_0204cff4
