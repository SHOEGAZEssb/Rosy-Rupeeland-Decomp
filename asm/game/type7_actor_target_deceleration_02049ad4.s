; Matching retail form; see src/game/type7_actor_target_deceleration.c.
.extern func_020050a4
.extern Type7Actor_UpdateMotionTowardTransform
.extern func_02048148
.extern func_020adae4
.text
    .global func_02049ad4
.type func_02049ad4, @function
func_02049ad4: ; 0x02049ad4
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x268]
    orr r1, r1, #0x8000
    str r1, [r4, #0x268]
    ldr r1, [r4, #0xd0]
    orr r1, r1, #0x2
    str r1, [r4, #0xd0]
    ldr r1, [r4, #0x210]
    cmp r1, #0x0
    bne .L_02049b0c
    bl func_02048148
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_02049b0c:
    ldr r0, [r4, #0x10]
    tst r0, #0x2000
    add r0, r4, #0x200
    ldrneh r1, [r0, #0xa2]
    addne r1, r1, #0x2
    strneh r1, [r0, #0xa2]
    bne .L_02049b38
    ldrh r1, [r0, #0xa2]
    cmp r1, #0x0
    subne r1, r1, #0x1
    strneh r1, [r0, #0xa2]
.L_02049b38:
    ldr r1, [r4, #0x210]
    add r0, r4, #0x78
    add r1, r1, #0x18
    bl func_020050a4
    ldr r1, [r4, #0x210]
    add r0, r4, #0x78
    add r1, r1, #0x18
    bl func_020050a4
    mov r0, r4
    add r1, r4, #0x78
    bl Type7Actor_UpdateMotionTowardTransform
    add r0, r4, #0x200
    ldrsh r1, [r0, #0x4a]
    cmp r1, #0x0
    ble .L_02049b98
    ldrsh r2, [r0, #0x48]
    ldrh r0, [r0, #0xa2]
    sub r2, r1, r2
    sub r0, r2, r0
    mov r0, r0, lsl #0xc
    bl func_020adae4
    cmp r0, #0x0
    movlt r0, #0x0
    b .L_02049b9c
.L_02049b98:
    mov r0, #0x0
.L_02049b9c:
    ldr r2, [r4, #0x3c]
    mov r1, #0x0
    smull ip, r3, r2, r0
    adds ip, ip, #0x800
    adc r2, r3, #0x0
    mov r3, ip, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    str r3, [r4, #0x3c]
    ldr r3, [r4, #0x40]
    mov r2, #0xe
    smull ip, r0, r3, r0
    adds r3, ip, #0x800
    adc r0, r0, #0x0
    mov r3, r3, lsr #0xc
    orr r3, r3, r0, lsl #0x14
    str r3, [r4, #0x40]
    mov r0, r1
    strh r2, [r4, #0xd6]
    ldmia sp!, {r4, pc}
.size func_02049ad4, . - func_02049ad4

