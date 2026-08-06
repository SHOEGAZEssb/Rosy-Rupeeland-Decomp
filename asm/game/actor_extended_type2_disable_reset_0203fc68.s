; Matching retail form; see src/game/actor_extended_type2_disable_reset.c.
.text
.extern data_020df9e8
.extern func_02033ed0
.extern func_02045184
.global func_0203fc68
.type func_0203fc68, @function
func_0203fc68: ; 0x0203fc68
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0xd0]
    add r0, r4, #0x200
    bic r1, r1, #0x200
    str r1, [r4, #0xd0]
    ldr r2, [r4, #0x260]
    mov r1, #0x0
    bic r2, r2, #0x800
    str r2, [r4, #0x260]
    strh r1, [r0, #0x4e]
    ldr r1, [r4, #0x54]
    cmp r1, #0x0
    ldrneh r0, [r1, #0x24]
    orrne r0, r0, #0x10
    strneh r0, [r1, #0x24]
    mov r0, r4
    bl func_02033ed0
    ldr r0, [r4, #0x274]
    cmp r0, #0x0
    beq .L_0203fcc4
    mov r1, r4
    bl func_02045184
.L_0203fcc4:
    ldr r0, .L_0203fcfc
    mov r1, #0xff
    ldr r2, [r0, #0x80]
    ldr r0, [r0, #0x84]
    str r2, [r4, #0x218]
    str r0, [r4, #0x21c]
    ldr r0, [r4, #0x260]
    bic r0, r0, #0x3
    str r0, [r4, #0x260]
    ldr r0, [r4, #0xd0]
    orr r0, r0, #0x100
    str r0, [r4, #0xd0]
    strh r1, [r4, #0xac]
    ldmia sp!, {r4, pc}
.L_0203fcfc: .word data_020df9e8
.size func_0203fc68, . - func_0203fc68

