.text
.extern func_020925a4
.extern func_020925f8
.extern func_02092638
.extern func_020925dc
.extern func_02092618
.extern func_02092688
.extern func_020755e0
.extern data_020f4e14
.extern gDebugFont

    .global func_ov044_0220c19c
func_ov044_0220c19c:
    stmdb sp!, {r4, lr}
    ldr r2, .L_0220c2cc
    mov r4, r0
    ldrh r1, [r2, #0x0]
    mov r0, #0x0
    bic r1, r1, #0x8000
    strh r1, [r2, #0x0]
    bl func_020925a4
    ldr r1, .L_0220c2d0
    ldrh r0, [r1, #0x0]
    and r0, r0, #0x43
    orr r0, r0, #0x3800
    strh r0, [r1, #0x0]
    ldrh r0, [r1, #0x4]
    and r0, r0, #0x43
    orr r0, r0, #0x1c00
    strh r0, [r1, #0x4]
    ldrh r0, [r1, #0x6]
    and r0, r0, #0x43
    orr r0, r0, #0xe10
    orr r0, r0, #0x1000
    strh r0, [r1, #0x6]
    bl func_020925f8
    mov r0, #0x0
    mov r1, #0x1
    mov r2, #0x2
    mov r3, #0x3
    bl func_02092638
    mov r0, #0x1d
    str r0, [r4, #0x4c]
    mov r0, #0x0
    bl func_020925dc
    ldr r1, .L_0220c2d4
    ldrh r0, [r1, #0x0]
    and r0, r0, #0x43
    orr r0, r0, #0x3800
    strh r0, [r1, #0x0]
    ldrh r0, [r1, #0x4]
    and r0, r0, #0x43
    orr r0, r0, #0x1c00
    strh r0, [r1, #0x4]
    ldrh r0, [r1, #0x6]
    and r0, r0, #0x43
    orr r0, r0, #0xe10
    orr r0, r0, #0x1000
    strh r0, [r1, #0x6]
    bl func_02092618
    mov r0, #0x0
    mov r1, #0x1
    mov r2, #0x2
    mov r3, #0x3
    bl func_02092688
    mov r0, #0x1c
    str r0, [r4, #0x48]
    bl func_020925f8
    ldr r0, .L_0220c2d8
    ldr r0, [r0, #0x0]
    bl func_020755e0
    mov r4, r0
    ldr r0, .L_0220c2dc
    ldr r0, [r0, #0x0]
    bl func_020755e0
    ldrh r1, [r4, #0xe]
    strh r1, [r0, #0x6]
    strh r1, [r4, #0x6]
    ldrh r1, [r4, #0x1e]
    strh r1, [r0, #0x8]
    strh r1, [r4, #0x8]
    ldr r1, .L_0220c2e0
    strh r1, [r0, #0xa]
    ldrh r1, [r0, #0xa]
    strh r1, [r4, #0xa]
    ldrh r1, [r4, #0x1e]
    strh r1, [r0, #0xc]
    strh r1, [r4, #0xc]
    ldmia sp!, {r4, pc}
.L_0220c2cc: .word 0x4000304
.L_0220c2d0: .word 0x4000008
.L_0220c2d4: .word 0x4001008
.L_0220c2d8: .word data_020f4e14
.L_0220c2dc: .word gDebugFont
.L_0220c2e0: .word 0x4210
.size func_ov044_0220c19c, . - func_ov044_0220c19c
