; Matching retail form; see src/game/actor_height_band_init.c.
.text
.extern data_021052fc
.extern func_020343e4
.extern func_020adae4

    .global func_020329bc
    .type func_020329bc, @function
func_020329bc: ; 0x020329bc
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    ldr r2, .L_02032a60
    mov r5, r1
    ldr r1, [r2, #0x0]
    ldr r2, [r5, #0x8]
    add r1, r1, #0x2000
    ldr r1, [r1, #0xed4]
    ldr r3, [r5, #0x4]
    ldr r1, [r1, #0x20]
    mov r6, r0
    mov r0, r1, lsr #0x10
    mov r4, r2, asr #0x4
    mov r0, r0, lsl #0x4
    mov r1, #0x10
    mov r7, r3, asr #0x4
    bl func_020adae4
    sub r8, r0, #0x1
    add r0, r4, #0x10
    cmp r8, r0
    movgt r8, r0
    b .L_02032a54
.L_02032a10:
    mov r0, r6
    mov r1, r7
    mov r2, r8
    bl func_020343e4
    sub r1, r8, r0
    cmp r4, r1
    bne .L_02032a50
    ldr r2, [r5, #0x4]
    mov r1, r0, lsl #0x10
    mov r0, r2, lsl #0xc
    str r0, [r6, #0x7c]
    str r1, [r6, #0x84]
    ldr r0, [r5, #0x8]
    add r0, r1, r0, lsl #0xc
    str r0, [r6, #0x80]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_02032a50:
    sub r8, r8, #0x1
.L_02032a54:
    cmp r8, #0x0
    bge .L_02032a10
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_02032a60: .word data_021052fc
    .size func_020329bc, . - func_020329bc

