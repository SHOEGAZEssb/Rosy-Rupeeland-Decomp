; Matching retail form; see src/game/type7_actor_constructor.c.
.text
.extern data_020e1740
.extern data_020e1c38
.extern func_02004fe0
.extern func_0200500c
.extern func_020050a4
.extern func_0203b514
.extern func_020464f4
.extern func_020481dc
.extern func_0204cca8
.global func_020455bc
.type func_020455bc, @function
func_020455bc: ; 0x020455bc
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0203b514
    ldr r1, .L_02045718
    add r0, r4, #0x214
    str r1, [r4, #0x0]
    bl func_02004fe0
    mvn r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x224
    bl func_0200500c
    mov r3, #0x0
    ldr r0, .L_0204571c
    str r3, [r4, #0x234]
    mov r1, #0x47
    str r0, [r4, #0x238]
    add r0, r0, #0x800
    str r0, [r4, #0x23c]
    str r3, [r4, #0x240]
    add r0, r4, #0x200
    strh r3, [r0, #0x46]
    strh r3, [r0, #0x4e]
    sub r2, r3, #0x1e
    strh r2, [r0, #0x50]
    strh r1, [r0, #0x52]
    sub r1, r1, #0x48
    strh r3, [r0, #0x54]
    strh r3, [r0, #0x56]
    strh r1, [r0, #0x58]
    strh r3, [r0, #0x5a]
    mov r1, #0x30000
    str r1, [r4, #0x25c]
    mov r1, #0x50000
    str r1, [r4, #0x260]
    strh r3, [r0, #0x64]
    strh r3, [r0, #0x66]
    add r0, r4, #0x26c
    str r3, [r4, #0x268]
    bl func_02004fe0
    mov r2, #0x0
    add r0, r4, #0x200
    strh r2, [r0, #0x7c]
    sub r1, r2, #0x1
    strh r1, [r0, #0x7e]
    str r2, [r4, #0x280]
    add r0, r4, #0x284
    bl func_02004fe0
    mov r1, #0x0
    str r1, [r4, #0x294]
    str r1, [r4, #0x298]
    str r1, [r4, #0x29c]
    add r0, r4, #0x200
    strh r1, [r0, #0xa0]
    strh r1, [r0, #0xa2]
    strh r1, [r0, #0xa4]
    strh r1, [r0, #0xa6]
    add r0, r4, #0x2a8
    mov r1, r4
    bl func_0204cca8
    add r0, r4, #0x214
    add r1, r4, #0x18
    bl func_020050a4
    mov r1, r0
    add r0, r4, #0x26c
    bl func_020050a4
    ldr r0, [r4, #0x14]
    ldr r1, .L_02045720
    tst r0, #0x400
    ldrne r0, [r4, #0xd0]
    mov r3, #0x78
    orrne r0, r0, #0x4
    strne r0, [r4, #0xd0]
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_020481dc
    mov r1, #0x0
    mov r0, r4
    str r1, [r4, #0x210]
    bl func_020464f4
    mov r0, #0x10000
    ldr r1, [r4, #0x5c]
    rsb r0, r0, #0x0
    and r1, r1, r0
    mov r0, r4
    str r1, [r4, #0x5c]
    ldmia sp!, {r4, pc}
.L_02045718: .word data_020e1c38
.L_0204571c: .word 0xccd
.L_02045720: .word data_020e1740
.size func_020455bc, . - func_020455bc
