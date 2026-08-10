; Matching retail form; see src/game/actor_derived_runtime_interaction_callbacks.c.
.text
.extern func_0200500c
.extern func_02005058
.extern func_020050a4
.extern func_02006818
.extern func_02031758
.extern func_02031cac
.extern func_02032a94
.extern Actor_TryDispatchActivationMode2
.extern gSceneTouchInitialData
    .global func_0203b998
    .type func_0203b998, @function
func_0203b998: ; 0x0203b998
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0xc
    mov r5, r0
    mov r4, r1
    bl func_02031758
    ldr r0, .L_0203b9d8
    add r1, sp, #0x0
    str r0, [sp, #0x0]
    ldr r2, [r5, #0x4]
    mov r0, r4
    str r2, [sp, #0x4]
    ldr r2, [r5, #0x8]
    str r2, [sp, #0x8]
    bl func_02031cac
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, pc}
.L_0203b9d8: .word gSceneTouchInitialData
    .size func_0203b998, . - func_0203b998

    .global func_0203b9dc
    .type func_0203b9dc, @function
func_0203b9dc: ; 0x0203b9dc
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x10
    mov r4, r2
    mov r6, r0
    mov r5, r1
    bl func_02032a94
    cmp r4, #0x0
    bne .L_0203ba58
    mov r1, #0x0
    add r0, sp, #0x0
    mov r2, r1
    mov r3, r1
    bl func_0200500c
    add r1, sp, #0x0
    add r0, r6, #0x38
    bl func_020050a4
    add r0, sp, #0x0
    bl func_02005058
    ldr r1, [r6, #0x10]
    tst r1, #0x40
    beq .L_0203ba58
    ldr r0, [r6, #0x14]
    tst r0, #0x40000000
    beq .L_0203ba58
    ldr r0, [r5, #0x14]
    tst r0, #0x10
    bne .L_0203ba58
    bic r1, r1, #0x40
    add r0, r6, #0x198
    str r1, [r6, #0x10]
    bl func_02006818
.L_0203ba58:
    ldrb r0, [r5, #0x4d]
    cmp r0, #0x1
    bne .L_0203ba94
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xa8]
    blx r1
    cmp r0, #0x0
    cmpeq r4, #0x0
    bne .L_0203ba94
    ldr r0, [r6, #0x188]
    cmp r0, #0x0
    beq .L_0203ba94
    mov r0, r6
    bl Actor_TryDispatchActivationMode2
.L_0203ba94:
    mov r0, #0x1
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, pc}

    .size func_0203b9dc, . - func_0203b9dc

