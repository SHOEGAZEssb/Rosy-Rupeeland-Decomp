; Matching retail form; see src/game/presentation_backed_actor_spawn_variants.c.
.extern data_020c3e78
.extern data_020c9670
.extern data_02105788
.extern func_0200500c
.extern func_02005058
.extern func_0204e2ac
.extern func_020adae4
.extern func_020bf1f8
.extern genrand_int32
.text

func_0204e584: ; 0x0204e584
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x1c
    mov lr, r2
    mov ip, #0x0
    ldr r4, .L_0204e620
    b .L_0204e5b4
.L_0204e59c:
    mov r2, ip, lsl #0x1
    ldrsh r2, [r4, r2]
    cmp r1, r2
    suble ip, ip, #0x1
    ble .L_0204e5bc
    add ip, ip, #0x1
.L_0204e5b4:
    cmp ip, #0x7
    blt .L_0204e59c
.L_0204e5bc:
    cmp ip, #0x0
    movlt ip, #0x0
    blt .L_0204e5d0
    cmp ip, #0x7
    movge ip, #0x6
.L_0204e5d0:
    ldr r4, .L_0204e624
    ldr r1, .L_0204e620
    stmia sp, {r3, r4}
    add r3, r4, #0x1
    mov r2, ip, lsl #0x1
    str r3, [sp, #0x8]
    add r3, r4, #0x2
    str r3, [sp, #0xc]
    ldrsh r2, [r1, r2]
    str ip, [sp, #0x10]
    mov ip, #0x7
    mov r1, r0
    str ip, [sp, #0x14]
    mov ip, #0x1
    mov r3, lr
    mov r0, #0xa
    str ip, [sp, #0x18]
    bl func_0204e2ac
    add sp, sp, #0x1c
    ldmia sp!, {r3, r4, pc}
.L_0204e620: .word data_020c3e78
.L_0204e624: .word 0x300d
.size func_0204e584, . - func_0204e584

    .global func_0204e628

func_0204e628: ; 0x0204e628
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x2c
    mov r10, r0
    mov r0, r1
    mov r1, #0x3
    mov r9, r2
    bl func_020adae4
    mov r1, #0x0
    mov r4, r0
    add r0, sp, #0x1c
    mov r2, r1
    mov r3, #0x2000
    bl func_0200500c
    ldr r0, .L_0204e734
    mov r1, r4, lsl #0x10
    ldr r11, .L_0204e738
    ldr r4, .L_0204e73c
    mov r8, #0x0
    sub r7, r0, #0x2
    add r6, r0, #0x1
    mov r5, r1, asr #0x10
.L_0204e67c:
    ldrh r0, [r4, #0x0]
    mov r1, #0x2
    mov r0, r0, asr #0x4
    add r0, r11, r0, lsl #0x2
    ldrsh r0, [r0, #0x2]
    add r0, r0, r0, lsl #0x1
    bl func_020adae4
    str r0, [sp, #0x20]
    ldrh r0, [r4, #0x0]
    mov r1, #0x2
    mov r0, r0, asr #0x4
    mov r0, r0, lsl #0x2
    ldrsh r0, [r11, r0]
    add r0, r0, r0, lsl #0x1
    bl func_020adae4
    str r0, [sp, #0x24]
    add r0, sp, #0x1c
    str r0, [sp, #0x0]
    ldr r0, .L_0204e734
    mov r1, r10
    stmib sp, {r0, r7}
    str r6, [sp, #0xc]
    mov r0, #0x0
    str r0, [sp, #0x10]
    mov r0, #0x7
    str r0, [sp, #0x14]
    mov r0, #0x1
    str r0, [sp, #0x18]
    mov r0, #0x13
    mov r2, r5
    mov r3, r9
    bl func_0204e2ac
    bl genrand_int32
    mov r1, #0x3000
    bl func_020bf1f8
    add r0, r1, #0x3000
    ldrh r1, [r4, #0x0]
    add r8, r8, #0x1
    cmp r8, #0x3
    add r0, r1, r0
    strh r0, [r4, #0x0]
    blt .L_0204e67c
    add r0, sp, #0x1c
    bl func_02005058
    add sp, sp, #0x2c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0204e734: .word 0x3010
.L_0204e738: .word data_020c9670
.L_0204e73c: .word data_02105788
.size func_0204e628, . - func_0204e628

