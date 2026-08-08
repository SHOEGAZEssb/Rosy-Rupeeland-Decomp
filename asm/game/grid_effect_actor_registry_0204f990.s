; Matching retail form; see src/game/grid_effect_actor_registry.c.
.extern data_021052fc
.extern data_02105790
.extern data_0210579c
.extern func_0202d494
.extern func_020337d4
.text

    .global func_0204f990
func_0204f990: ; 0x0204f990
    mov r2, #0x0
    ldr r0, .L_0204f9b8
    mov r1, r2
.L_0204f99c:
    str r1, [r0, r2, lsl #0x2]
    add r2, r2, #0x1
    cmp r2, #0xc
    blt .L_0204f99c
    ldr r0, .L_0204f9bc
    str r1, [r0, #0x4]
    bx lr
.L_0204f9b8: .word data_0210579c
.L_0204f9bc: .word data_02105790
.size func_0204f990, . - func_0204f990

    .global func_0204f9c0

func_0204f9c0: ; 0x0204f9c0
    stmdb sp!, {r3, r4, r5, lr}
    mvn r2, #0x0
    mov r3, #0x0
    ldr r1, .L_0204fa40
    b .L_0204fa04
.L_0204f9d4:
    ldr r0, [r1, r3, lsl #0x2]
    cmp r0, #0x0
    addeq r0, r1, r3, lsl #0x2
    ldmeqia sp!, {r3, r4, r5, pc}
    add r0, r0, #0x100
    ldrh r0, [r0, #0xf0]
    mov r0, r0, lsl #0x10
    cmp r2, r0, lsr #0x12
    mov r0, r0, lsr #0x12
    addlt r4, r1, r3, lsl #0x2
    movlt r2, r0
    add r3, r3, #0x1
.L_0204fa04:
    cmp r3, #0xc
    blt .L_0204f9d4
    ldr r5, [r4, #0x0]
    mov r0, r5
    bl func_020337d4
    mov r1, r5
    bl func_0202d494
    ldr r1, .L_0204fa44
    mov r0, r4
    ldr r1, [r1, #0x0]
    add r1, r1, #0x3000
    ldr r2, [r1, #0xb8]
    orr r2, r2, #0x10
    str r2, [r1, #0xb8]
    ldmia sp!, {r3, r4, r5, pc}
.L_0204fa40: .word data_0210579c
.L_0204fa44: .word data_021052fc
.size func_0204f9c0, . - func_0204f9c0

    .global func_0204fa48

func_0204fa48: ; 0x0204fa48
    add r1, r0, #0x200
    ldrsb r3, [r1, #0x1a]
    mvn r1, #0x0
    cmp r3, r1
    beq .L_0204fa74
    ldr r1, .L_0204faa4
    mov r2, #0x1
    mvn r2, r2, lsl r3
    ldr r3, [r1, #0x4]
    and r2, r3, r2
    str r2, [r1, #0x4]
.L_0204fa74:
    mov r3, #0x0
    ldr r2, .L_0204faa8
    b .L_0204fa98
.L_0204fa80:
    ldr r1, [r2, r3, lsl #0x2]
    cmp r1, r0
    moveq r0, #0x0
    streq r0, [r2, r3, lsl #0x2]
    bxeq lr
    add r3, r3, #0x1
.L_0204fa98:
    cmp r3, #0xc
    blt .L_0204fa80
    bx lr
.L_0204faa4: .word data_02105790
.L_0204faa8: .word data_0210579c
.size func_0204fa48, . - func_0204fa48

