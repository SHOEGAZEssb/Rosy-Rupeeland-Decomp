; Matching retail form; see src/game/tile_layer_cache_refresh.c.
.text
.extern func_02016f14
.extern func_02016f28
.extern func_0202a62c

    .global func_0202a0e8
    .type func_0202a0e8, @function
func_0202a0e8: ; 0x0202a0e8
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x14
    mov r10, r0
    add r0, r10, #0x1000
    ldrh r4, [r0, #0x2e]
    mov r9, r1
    mov r7, r3
    str r4, [sp, #0x0]
    ldrh r3, [r0, #0x2c]
    mov r1, #0x0
    mov r8, r2
    add r0, sp, #0x4
    mov r2, r1
    bl func_02016f14
    ldr r11, .L_0202a1c8
    mov r5, #0x0
    add r4, r10, #0x1000
.L_0202a12c:
    add r0, sp, #0x4
    mov r1, r9
    mov r2, r8
    mov r6, #0x0
    bl func_02016f28
    cmp r0, #0x0
    beq .L_0202a168
    ldrh r0, [r4, #0x2c]
    ldr r1, [r4, #0x8]
    mla r0, r8, r0, r9
    mov r0, r0, lsl #0x1
    ldrh r0, [r1, r0]
    and r0, r0, r11
    mov r0, r0, lsl #0x10
    mov r6, r0, lsr #0x10
.L_0202a168:
    ldrb r2, [r7, #0x0]
    ldrb r1, [r7, #0x1]
    mov r0, r10
    mov ip, r2, lsl #0x1b
    mov r2, r1, lsl #0x1c
    mov r3, r6
    mov r1, ip, lsr #0x1b
    mov r2, r2, lsr #0x1c
    bl func_0202a62c
    ldrb r1, [r7, #0x1]
    add r5, r5, #0x1
    cmp r5, #0x10
    mov r0, r1, lsl #0x1c
    mov r0, r0, lsr #0x1c
    add r0, r0, #0x1
    and r0, r0, #0xff
    bic r1, r1, #0xf
    and r0, r0, #0xf
    orr r0, r1, r0
    strb r0, [r7, #0x1]
    add r8, r8, #0x1
    blt .L_0202a12c
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0202a1c8: .word 0x1ff
    .size func_0202a0e8, . - func_0202a0e8

