.text
.global func_02005fec
.type func_02005fec, @function
.extern data_020c19f0
.extern data_020c17f0
.extern data_021052f4

/* Matching implementation; see the documented portable C equivalent. */
func_02005fec:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r1, r1, lsl #5
    ldr r2, glyph_data
    bic r1, r1, #3
    mov r3, #0
    add r2, r2, r1
    ldr r7, palette_data
    ldr r5, cursor_data
    mov r1, r3
row_loop:
    ldr r4, [r5]
    ldr ip, [r0, #8]
    add r4, r4, r3
    add lr, ip, r4, lsl #9
    ldr r6, [r5, #4]
    ldr ip, [r2, r3, lsl #2]
    mov r4, r1
    add lr, lr, r6, lsl #1
pixel_loop:
    mov r6, r4, lsl #2
    mov r6, ip, lsr r6
    ands r6, r6, #0xf
    addne r6, r7, r6, lsl #1
    ldrneh r6, [r6, #0x20]
    add r4, r4, #1
    orrne r6, r6, #0x8000
    strneh r6, [lr]
    cmp r4, #8
    add lr, lr, #2
    blt pixel_loop
    add r3, r3, #1
    cmp r3, #8
    blt row_loop
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
glyph_data:
    .word data_020c19f0
palette_data:
    .word data_020c17f0
cursor_data:
    .word data_021052f4
    .size func_02005fec, .-func_02005fec
