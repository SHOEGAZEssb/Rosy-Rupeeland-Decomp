; Matching retail form; see src/game/actor_extended_type2_callback_pair_resets.c.
.text
.extern data_020df9e8
.extern func_0203fd00
    .global func_0203fb24
    .type func_0203fb24, @function
func_0203fb24: ; 0x0203fb24
    add r1, r0, #0x200
    mov r2, #0x78
    strh r2, [r1, #0x54]
    mov r1, #0x0
    str r1, [r0, #0x228]
    ldr r2, [r0, #0x260]
    ldr r1, .L_0203fb6c
    bic r2, r2, #0x20
    str r2, [r0, #0x260]
    ldr r3, [r1, #0x0]
    ldr r2, [r1, #0x4]
    str r3, [r0, #0x218]
    str r2, [r0, #0x21c]
    ldr r2, [r1, #0x170]
    ldr r1, [r1, #0x174]
    str r2, [r0, #0x220]
    str r1, [r0, #0x224]
    bx lr
.L_0203fb6c: .word data_020df9e8
    .size func_0203fb24, . - func_0203fb24

    .global func_0203fb70
    .type func_0203fb70, @function

func_0203fb70: ; 0x0203fb70
    add r1, r0, #0x200
    mov r2, #0xf0
    strh r2, [r1, #0x54]
    ldr r2, [r0, #0x260]
    mov r3, #0x0
    orr r2, r2, #0x4
    bic r2, r2, #0x20
    str r2, [r0, #0x260]
    str r3, [r0, #0x228]
    ldr r2, .L_0203fbc0
    strh r3, [r1, #0x5e]
    ldr r3, [r2, #0x78]
    ldr r1, [r2, #0x7c]
    str r3, [r0, #0x218]
    str r1, [r0, #0x21c]
    ldr r3, [r2, #0x70]
    ldr r1, [r2, #0x74]
    str r3, [r0, #0x220]
    str r1, [r0, #0x224]
    bx lr
.L_0203fbc0: .word data_020df9e8
    .size func_0203fb70, . - func_0203fb70

    .global func_0203fbc4
    .type func_0203fbc4, @function

func_0203fbc4: ; 0x0203fbc4
    add r1, r0, #0x200
    mov r2, #0x0
    strh r2, [r1, #0x54]
    str r2, [r0, #0x228]
    ldr r2, [r0, #0x260]
    ldr r1, .L_0203fc08
    bic r2, r2, #0x20
    str r2, [r0, #0x260]
    ldr r3, [r1, #0x18]
    ldr r2, [r1, #0x1c]
    str r3, [r0, #0x218]
    str r2, [r0, #0x21c]
    ldr r2, [r1, #0x240]
    ldr r1, [r1, #0x244]
    str r2, [r0, #0x220]
    str r1, [r0, #0x224]
    bx lr
.L_0203fc08: .word data_020df9e8
    .size func_0203fbc4, . - func_0203fbc4

    .global func_0203fc0c
    .type func_0203fc0c, @function

func_0203fc0c: ; 0x0203fc0c
    ldr r3, [r0, #0x54]
    ldr r1, .L_0203fc44
    ldrh r2, [r3, #0x24]
    bic r2, r2, #0x4
    strh r2, [r3, #0x24]
    ldr r2, [r1, #0x8]
    ldr r1, [r1, #0xc]
    str r2, [r0, #0x218]
    str r1, [r0, #0x21c]
    ldr r1, [r0, #0x10]
    tst r1, #0x8
    orrne r1, r1, #0x1000000
    strne r1, [r0, #0x10]
    bx lr
.L_0203fc44: .word data_020df9e8
    .size func_0203fc0c, . - func_0203fc0c

    .global func_0203fc48
    .type func_0203fc48, @function

func_0203fc48: ; 0x0203fc48
    stmdb sp!, {r4, lr}
    ldr r1, [r0, #0x0]
    mov r4, r0
    ldr r1, [r1, #0xfc]
    blx r1
    mov r0, r4
    bl func_0203fd00
    ldmia sp!, {r4, pc}
    .size func_0203fc48, . - func_0203fc48

