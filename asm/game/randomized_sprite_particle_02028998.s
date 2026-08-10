; Matching retail form; see src/game/randomized_sprite_particle.c.
.text
.extern data_020c9670
.extern VecFx32Object_Init
.extern VecFx32Object_Destroy
.extern VecFx32Object_Add
.extern VecFx32_Subtract
.extern func_020adc90
.extern func_020adcac
.extern func_020ae024

    .global func_02028998
    .type func_02028998, @function
func_02028998: ; 0x02028998
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x30
    mov r7, r0
    mov r6, r1
    add r0, sp, #0x20
    mov r2, r7
    add r1, r7, #0x10
    bl VecFx32_Subtract
    mov r1, r7
    cmp r7, #0x0
    addne r1, r7, #0x4
    adds r0, r7, #0x10
    addne r0, r0, #0x4
    bl func_020adcac
    mov r1, r0, asr #0x1
    add r0, r0, r1, lsr #0x1e
    mov r5, r0, asr #0xe
    cmp r5, #0x1
    ldr r0, [sp, #0x28]
    ldr r1, [sp, #0x24]
    movlt r5, #0x1
    bl func_020ae024
    mov r0, r0, asr #0x4
    mov r4, r0, lsl #0x1
    add r1, r4, #0x1
    ldr r0, .L_02028b94
    mov r1, r1, lsl #0x1
    ldrsh r0, [r0, r1]
    mov r5, r5, lsl #0xc
    mov r1, r5
    bl func_020adc90
    ldr r1, .L_02028b94
    mov r2, r4, lsl #0x1
    str r0, [r7, #0x34]
    ldrsh r0, [r1, r2]
    mov r1, r5
    bl func_020adc90
    str r0, [r7, #0x38]
    mov r2, #0x0
    add r0, r7, #0x20
    add r1, r7, #0x30
    str r2, [r7, #0x3c]
    bl VecFx32Object_Add
    add r0, sp, #0x10
    bl VecFx32Object_Init
    ldr r0, [r7, #0x24]
    mov r3, #0x0
    rsb r5, r0, #0x0
    mov r2, #0x62
    umull lr, ip, r5, r2
    mla ip, r5, r3, ip
    mov r4, r5, asr #0x1f
    adds r5, lr, #0x800
    mla ip, r4, r2, ip
    adc r4, ip, #0x0
    mov r5, r5, lsr #0xc
    orr r5, r5, r4, lsl #0x14
    str r5, [sp, #0x14]
    ldr r4, [r7, #0x28]
    add r0, r7, #0x20
    rsb r5, r4, #0x0
    umull lr, ip, r5, r2
    mla ip, r5, r3, ip
    mov r4, r5, asr #0x1f
    adds r3, lr, #0x800
    mla ip, r4, r2, ip
    adc r2, ip, #0x0
    mov r3, r3, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    add r1, sp, #0x10
    str r3, [sp, #0x18]
    bl VecFx32Object_Add
    mov r0, r7
    add r1, r7, #0x20
    bl VecFx32Object_Add
    mov r2, r6
    add r0, sp, #0x0
    mov r1, r7
    bl VecFx32_Subtract
    ldr r0, [sp, #0xc]
    ldr r1, [sp, #0x8]
    mov r0, r0, asr #0xc
    rsb r3, r0, r1, asr #0xc
    ldr r1, [sp, #0x4]
    ldr r2, [r7, #0x40]
    mov r1, r1, asr #0xc
    strh r1, [r2, #0x2c]
    strh r3, [r2, #0x2e]
    ldr r1, [sp, #0x4]
    mvn r0, #0xf
    cmp r0, r1, asr #0xc
    ldrlt r1, [sp, #0x8]
    movlt r1, r1, asr #0xc
    cmplt r1, #0x110
    bge .L_02028b34
    cmp r1, r0
    ble .L_02028b34
    cmp r1, #0xd0
    ldrlt r1, [r7, #0x40]
    ldrlth r0, [r1, #0x24]
    biclt r0, r0, #0x4
    strlth r0, [r1, #0x24]
    blt .L_02028b44
.L_02028b34:
    ldr r1, [r7, #0x40]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x4
    strh r0, [r1, #0x24]
.L_02028b44:
    ldr r0, [r7, #0x48]
    subs r0, r0, #0x1
    str r0, [r7, #0x48]
    add r0, sp, #0x0
    bpl .L_02028b74
    bl VecFx32Object_Destroy
    add r0, sp, #0x10
    bl VecFx32Object_Destroy
    add r0, sp, #0x20
    bl VecFx32Object_Destroy
    mov r0, #0x1
    b .L_02028b8c
.L_02028b74:
    bl VecFx32Object_Destroy
    add r0, sp, #0x10
    bl VecFx32Object_Destroy
    add r0, sp, #0x20
    bl VecFx32Object_Destroy
    mov r0, #0x0
.L_02028b8c:
    add sp, sp, #0x30
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_02028b94: .word data_020c9670
    .size func_02028998, . - func_02028998

