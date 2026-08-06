; Matching retail form; see src/game/tile_layer_scroll_and_access.c.
.text
.extern func_0202a62c

    .global func_0202a588
    .type func_0202a588, @function
func_0202a588: ; 0x0202a588
    stmdb sp!, {r4, r5, r6, lr}
    add r4, r0, #0x1000
    ldrh r5, [r4, #0x2c]
    ldr lr, .L_0202a628
    ldr ip, [r4, #0x8]
    mla r5, r2, r5, r1
    mov r6, r5, lsl #0x1
    ldrh r5, [ip, r6]
    and lr, r3, lr
    and r5, r5, #0xfe00
    orr r5, lr, r5
    strh r5, [ip, r6]
    ldrsh r6, [r4, #0x2a]
    ldrsh r5, [r4, #0x28]
    add r4, r6, #0x10
    cmp r2, r4
    movlt ip, #0x1
    movge ip, #0x0
    cmp r2, r6
    movge r6, #0x1
    movlt r6, #0x0
    cmp r1, r5
    movge lr, #0x1
    add r4, r5, #0x20
    movlt lr, #0x0
    cmp r1, r4
    movlt r4, #0x1
    movge r4, #0x0
    and r4, lr, r4
    and r4, r6, r4
    tst ip, r4
    ldmeqia sp!, {r4, r5, r6, pc}
    mov ip, r1, lsr #0x1f
    mov lr, r2, lsr #0x1f
    rsb r1, ip, r1, lsl #0x1b
    rsb r2, lr, r2, lsl #0x1c
    add r1, ip, r1, ror #0x1b
    add r2, lr, r2, ror #0x1c
    bl func_0202a62c
    ldmia sp!, {r4, r5, r6, pc}
.L_0202a628: .word 0x1ff
    .size func_0202a588, . - func_0202a588

