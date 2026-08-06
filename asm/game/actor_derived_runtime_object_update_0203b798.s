; Matching retail form; see src/game/actor_derived_runtime_object_update.c.
.text
.extern func_0200500c
.extern func_02005058
.extern func_020050a4
.extern func_020050c8
.extern func_020067b0
.extern func_020067fc
.extern func_02006804
.extern func_020068ac
.extern func_02031748
.extern func_02032394
.extern func_02034164
func_0203b798: ; 0x0203b798
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x20
    mov r4, r0
    bl func_02031748
    mov r0, r4
    bl func_02034164
    cmp r0, #0x0
    beq .L_0203b990
    add r0, r4, #0x28
    add r1, r4, #0x18
    bl func_020050a4
    ldr r0, [r4, #0x10]
    tst r0, #0x40
    beq .L_0203b8f4
    tst r0, #0x1
    beq .L_0203b7e4
    ldr r0, [r4, #0x14]
    tst r0, #0x10
    beq .L_0203b8f4
.L_0203b7e4:
    add r0, r4, #0x198
    bl func_020067b0
    add r0, r4, #0x198
    bl func_020067fc
    ldr r1, [r0, #0x4]
    add r0, r4, #0x198
    str r1, [r4, #0x3c]
    bl func_020067fc
    ldr r0, [r0, #0x8]
    str r0, [r4, #0x40]
    ldr r0, [r4, #0x10]
    tst r0, #0x400
    bne .L_0203b828
    add r0, r4, #0x198
    bl func_020067fc
    ldr r0, [r0, #0xc]
    str r0, [r4, #0x44]
.L_0203b828:
    add r0, r4, #0x198
    bl func_02006804
    cmp r0, #0x0
    beq .L_0203b890
    ldr r0, [r4, #0x10]
    mov r1, #0x0
    bic ip, r0, #0x40
    add r0, sp, #0x10
    mov r2, r1
    mov r3, r1
    str ip, [r4, #0x10]
    bl func_0200500c
    add r1, sp, #0x10
    add r0, r4, #0x38
    bl func_020050a4
    add r0, sp, #0x10
    bl func_02005058
    add r0, r4, #0x198
    bl func_020068ac
    mov r1, r0
    add r0, r4, #0x28
    bl func_020050a4
    mov r1, r0
    add r0, r4, #0x18
    bl func_020050a4
    b .L_0203b8f4
.L_0203b890:
    ldrb r0, [r4, #0x4b]
    cmp r0, #0x0
    bne .L_0203b8b4
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xa0]
    blx r1
    cmp r0, #0x0
    beq .L_0203b8f4
.L_0203b8b4:
    ldr r0, [r4, #0x14]
    tst r0, #0x40000000
    beq .L_0203b8f4
    ldr r0, [r4, #0x10]
    mov r1, #0x0
    bic ip, r0, #0x40
    add r0, sp, #0x0
    mov r2, r1
    mov r3, r1
    str ip, [r4, #0x10]
    bl func_0200500c
    add r1, sp, #0x0
    add r0, r4, #0x38
    bl func_020050a4
    add r0, sp, #0x0
    bl func_02005058
.L_0203b8f4:
    ldr r0, [r4, #0x14]
    tst r0, #0x100000
    beq .L_0203b908
    mov r0, r4
    bl func_02032394
.L_0203b908:
    add r0, r4, #0x18
    add r1, r4, #0x38
    bl func_020050c8
    ldr r0, [r4, #0x14]
    tst r0, #0x40
    bne .L_0203b980
    ldr r0, [r4, #0x10]
    tst r0, #0x400
    beq .L_0203b980
    ldr r1, [r4, #0x1dc]
    ldr r0, [r4, #0x24]
    cmp r0, r1
    ble .L_0203b95c
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xb0]
    blx r1
    ldr r1, [r4, #0x44]
    sub r0, r1, r0
    str r0, [r4, #0x44]
    b .L_0203b980
.L_0203b95c:
    strlt r1, [r4, #0x24]
    ldrlt r0, [r4, #0x14]
    biclt r0, r0, #0x20000000
    strlt r0, [r4, #0x14]
    ldr r1, [r4, #0x10]
    mov r0, #0x0
    bic r1, r1, #0x400
    str r1, [r4, #0x10]
    str r0, [r4, #0x44]
.L_0203b980:
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x20]
    blx r1
.L_0203b990:
    add sp, sp, #0x20
    ldmia sp!, {r4, pc}

    .size func_0203b798, . - func_0203b798

