; Matching retail form; see src/game/actor_timed_resource_state_update.c.
.text
.extern data_021052fc
.extern data_02105310
.extern func_02007f0c
.extern func_0200af04
.extern func_0200b058
.extern func_0201273c
.extern func_0201b180
.extern func_0201b228
.extern func_0201b23c
.extern func_0202d494
.extern func_0202eba4
.extern func_02032d64
.extern func_020337d4

    .global func_02034164
    .type func_02034164, @function
func_02034164: ; 0x02034164
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    add r0, r4, #0xec
    bl func_0201b23c
    cmp r0, #0x0
    beq .L_02034250
    add r0, r4, #0xec
    mov r1, #0x0
    bl func_0201273c
    ldrb r0, [r4, #0x169]
    tst r0, #0x1
    beq .L_02034250
    ldrb r0, [r4, #0xe8]
    cmp r0, #0x0
    beq .L_0203422c
    ldr r0, .L_02034258
    mov r1, r4
    bl func_0200b058
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrb r0, [r4, #0xe8]
    cmp r0, #0x2
    beq .L_020341f0
    ldr r0, .L_0203425c
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl func_02007f0c
    mov r5, r0
    mov r0, r4
    bl func_020337d4
    add r1, r5, #0x2000
    ldr r1, [r1, #0xe7c]
    mov r2, r4
    bl func_0202eba4
.L_020341f0:
    ldr r0, .L_02034258
    mov r1, #0x0
    strb r1, [r4, #0xe8]
    bl func_0200af04
    mov r1, r0
    add r0, r4, #0xec
    bl func_0201b180
    add r0, r4, #0xec
    bl func_0201b228
    ldr r2, [r4, #0x40]
    ldr r1, [r4, #0x3c]
    adds r0, r1, r2
    beq .L_0203422c
    mov r0, r4
    bl func_02032d64
.L_0203422c:
    ldr r0, [r4, #0x14]
    tst r0, #0x20
    beq .L_02034250
    mov r0, r4
    bl func_020337d4
    mov r1, r4
    bl func_0202d494
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_02034250:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_02034258: .word data_02105310
.L_0203425c: .word data_021052fc
    .size func_02034164, . - func_02034164

    .global func_02034260

