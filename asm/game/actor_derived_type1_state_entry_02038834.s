; Matching retail form; see src/game/actor_derived_type1_state_entry.c.
.text
.extern DebugText_Printf
.extern Sound_Play
.extern data_021056e0
.extern func_0200500c
.extern func_02005058
.extern func_0200b2c0
.extern func_02010b64
.extern func_02032a64
.extern func_02033f44
.extern Actor_ReplaceAttachmentSlotResource
.extern Type1Actor_EnterFailureState
.extern gLupyContext
.extern gSoundContext

    .global func_02038834
    .type func_02038834, @function
func_02038834: ; 0x02038834
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x14
    mov r5, r0
    mov r4, r2
    bl func_02032a64
    ldr r1, [r5, #0x14]
    add r0, r5, #0x200
    bic r1, r1, #0x200
    str r1, [r5, #0x14]
    mov r2, #0x0
    ldr r1, .L_020389dc
    strh r2, [r0, #0x68]
    ldr r0, [r1, #0x0]
    bl func_02010b64
    cmp r0, #0x0
    ble .L_02038950
    ldr r0, [r5, #0xd0]
    mov r1, #0x0
    bic ip, r0, #0x200
    mov r2, r1
    mov r3, r1
    add r0, r5, #0x38
    str ip, [r5, #0xd0]
    bl func_0200b2c0
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r5, #0x88
    bl func_0200b2c0
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r5, #0x98
    bl func_0200b2c0
    cmp r4, #0x0
    beq .L_02038920
    ldr r0, .L_020389e0
    mov r2, #0x3000
    ldrb r0, [r0, #0x0]
    mov r1, #0x1800
    rsb r2, r2, #0x0
    tst r0, #0x1
    rsbne r1, r1, #0x0
    add r0, sp, #0x4
    mov r3, #0x0
    bl func_0200500c
    ldr r3, .L_020389e0
    mov r0, r5
    ldrb r4, [r3, #0x0]
    add r1, sp, #0x4
    mov r2, #0x1
    add r4, r4, #0x1
    strb r4, [r3, #0x0]
    ldr r3, [r0, #0x0]
    ldr r3, [r3, #0xb8]
    blx r3
    add r0, sp, #0x4
    bl func_02005058
    b .L_020389b4
.L_02038920:
    ldr r1, [r5, #0x230]
    mov r0, r5
    orr r1, r1, #0x400
    str r1, [r5, #0x230]
    mov r1, #0x4000
    str r1, [r5, #0x44]
    bl func_02033f44
    add r0, r0, #0x1000
    str r0, [r5, #0x24]
    mov r0, #0xd
    strh r0, [r5, #0xd6]
    b .L_020389b4
.L_02038950:
    mov r0, r5
    bl Type1Actor_EnterFailureState
    ldr r4, .L_020389e4
    mov r0, r5
    sub r2, r4, #0x1
    sub r3, r4, #0x9d
    mov r1, #0x6
    str r4, [sp, #0x0]
    bl Actor_ReplaceAttachmentSlotResource
    mov r1, #0xe
    mov r0, r5
    strh r1, [r5, #0xd6]
    mov r1, #0x4000
    str r1, [r5, #0x44]
    bl func_02033f44
    add r0, r0, #0x1000
    str r0, [r5, #0x24]
    ldr r1, [r5, #0xd0]
    ldr r0, .L_020389e8
    orr r1, r1, #0x2000
    str r1, [r5, #0xd0]
    ldr r0, [r0, #0x0]
    mov r1, #0x0
    mov r2, #0x2d
    bl Sound_Play
.L_020389b4:
    ldr r2, [r5, #0x54]
    mov r0, r5
    ldrh r1, [r2, #0x24]
    bic r1, r1, #0x4
    strh r1, [r2, #0x24]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x5c]
    blx r1
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, pc}
.L_020389dc: .word gLupyContext
.L_020389e0: .word data_021056e0
.L_020389e4: .word 0x109e
.L_020389e8: .word gSoundContext
    .size func_02038834, . - func_02038834
