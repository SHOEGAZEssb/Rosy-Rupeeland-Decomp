; Matching retail form; see src/game/grid_effect_actor_spawn_wrappers.c.
.extern data_020c9670
.extern data_02105790
.extern func_0200500c
.extern func_02005058
.extern func_020050a4
.extern func_0204f62c
.extern genrand_int32
.text

    .global func_0204f7e4
func_0204f7e4: ; 0x0204f7e4
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x10
    bl func_0204f62c
    movs r4, r0
    moveq r0, #0x0
    beq .L_0204f83c
    bl genrand_int32
    mov r2, r0
    ldr r1, .L_0204f844
    add r0, sp, #0x0
    and r3, r2, r1
    and r2, r1, r2, lsr #0x10
    rsb r1, r3, #0x1000
    rsb r2, r2, #0x1000
    mov r3, #0x3000
    bl func_0200500c
    add r1, sp, #0x0
    add r0, r4, #0x38
    bl func_020050a4
    add r0, sp, #0x0
    bl func_02005058
    mov r0, #0x1
.L_0204f83c:
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
.L_0204f844: .word 0x1fff
.size func_0204f7e4, . - func_0204f7e4

    .global func_0204f848

func_0204f848: ; 0x0204f848
    ldr ip, .L_0204f850
    bx ip
.L_0204f850: .word func_0204f62c
.size func_0204f848, . - func_0204f848

    .global func_0204f854

func_0204f854: ; 0x0204f854
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r1
    mov r1, r2
    mov r2, r3
    bl func_0204f62c
    movs r4, r0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r1, r5
    add r0, r4, #0x38
    bl func_020050a4
    ldr r1, [r4, #0x14]
    mov r0, #0x1
    orr r1, r1, #0x2
    str r1, [r4, #0x14]
    ldmia sp!, {r3, r4, r5, pc}
.size func_0204f854, . - func_0204f854

    .global func_0204f894

func_0204f894: ; 0x0204f894
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x10
    bl func_0204f62c
    movs r4, r0
    beq .L_0204f974
    bl genrand_int32
    ldr r2, .L_0204f980
    ldr r1, .L_0204f984
    ldrh r3, [r2, #0x0]
    and r0, r0, r1
    add r0, r0, #0x99
    add r0, r0, #0x1900
    add r0, r3, r0
    strh r0, [r2, #0x0]
    ldrh r0, [r2, #0x0]
    ldr r3, .L_0204f988
    cmp r0, #0x8000
    subhi r0, r0, #0x8000
    strhih r0, [r2, #0x0]
    ldr r0, .L_0204f980
    mov r2, #0x0
    ldrh r1, [r0, #0x0]
    ldr r0, .L_0204f98c
    mov r1, r1, asr #0x4
    mov r5, r1, lsl #0x1
    add r1, r5, #0x1
    mov r1, r1, lsl #0x1
    ldrsh lr, [r3, r1]
    mov r1, r5, lsl #0x1
    ldrsh r3, [r3, r1]
    umull r6, r5, lr, r0
    mla r5, lr, r2, r5
    umull r1, ip, r3, r0
    mla ip, r3, r2, ip
    mov lr, lr, asr #0x1f
    mov r2, r3, asr #0x1f
    mla r5, lr, r0, r5
    mla ip, r2, r0, ip
    adds r6, r6, #0x800
    adc r5, r5, #0x0
    adds lr, r1, #0x800
    mov r1, r6, lsr #0xc
    adc r3, ip, #0x0
    mov r2, lr, lsr #0xc
    orr r2, r2, r3, lsl #0x14
    add r0, sp, #0x0
    orr r1, r1, r5, lsl #0x14
    mov r3, #0x3000
    bl func_0200500c
    add r1, sp, #0x0
    add r0, r4, #0x38
    bl func_020050a4
    add r0, sp, #0x0
    bl func_02005058
    mov r0, #0x1
    b .L_0204f978
.L_0204f974:
    mov r0, #0x0
.L_0204f978:
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, pc}
.L_0204f980: .word data_02105790
.L_0204f984: .word 0xfff
.L_0204f988: .word data_020c9670
.L_0204f98c: .word 0x1333
.size func_0204f894, . - func_0204f894

