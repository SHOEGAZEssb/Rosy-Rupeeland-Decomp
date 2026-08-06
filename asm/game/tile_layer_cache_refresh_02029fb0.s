; Matching retail form; see src/game/tile_layer_cache_refresh.c.
.text
.extern func_02016f14
.extern func_02016f28
.extern func_0202a62c

    .global func_02029fb0
    .type func_02029fb0, @function
func_02029fb0: ; 0x02029fb0
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x18
    mov r10, r0
    add r2, r10, #0x1000
    ldrh r3, [r2, #0x2e]
    mov r1, #0x0
    add r0, sp, #0x8
    str r3, [sp, #0x0]
    ldrh r3, [r2, #0x2c]
    mov r2, r1
    bl func_02016f14
    add r0, r10, #0x1000
    ldrb r1, [r0, #0x4]
    mov r6, #0x0
    strb r1, [sp, #0x4]
    ldrb r0, [r0, #0x5]
    strb r0, [sp, #0x5]
.L_02029ff4:
    mov r7, #0x0
    ldr r4, .L_0202a0e4
    add r5, r10, #0x1000
    mov r11, r7
.L_0202a004:
    ldrsh r1, [r5, #0x28]
    ldrsh r2, [r5, #0x2a]
    add r0, sp, #0x8
    add r1, r7, r1
    add r2, r6, r2
    mov r8, r11
    bl func_02016f28
    cmp r0, #0x0
    beq .L_0202a058
    ldrsh r2, [r5, #0x28]
    ldrsh r0, [r5, #0x2a]
    ldrh r1, [r5, #0x2c]
    add r2, r7, r2
    add r0, r6, r0
    mla r0, r1, r0, r2
    ldr r1, [r5, #0x8]
    mov r0, r0, lsl #0x1
    ldrh r0, [r1, r0]
    and r0, r0, r4
    mov r0, r0, lsl #0x10
    mov r8, r0, lsr #0x10
.L_0202a058:
    ldrb r2, [sp, #0x4]
    ldrb r1, [sp, #0x5]
    mov r0, r10
    mov r2, r2, lsl #0x1b
    mov r9, r2, lsr #0x1b
    mov r2, r1, lsl #0x1c
    mov r1, r9
    mov r3, r8
    mov r2, r2, lsr #0x1c
    bl func_0202a62c
    ldrb r1, [sp, #0x4]
    add r0, r9, #0x1
    and r0, r0, #0xff
    add r7, r7, #0x1
    bic r1, r1, #0x1f
    and r0, r0, #0x1f
    orr r0, r1, r0
    strb r0, [sp, #0x4]
    cmp r7, #0x20
    blt .L_0202a004
    add r2, sp, #0x5
    ldrb r1, [r2, #0x0]
    add r6, r6, #0x1
    cmp r6, #0x10
    mov r0, r1, lsl #0x1c
    mov r0, r0, lsr #0x1c
    add r0, r0, #0x1
    and r0, r0, #0xff
    bic r1, r1, #0xf
    and r0, r0, #0xf
    orr r0, r1, r0
    strb r0, [r2, #0x0]
    blt .L_02029ff4
    add sp, sp, #0x18
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0202a0e4: .word 0x1ff
    .size func_02029fb0, . - func_02029fb0

