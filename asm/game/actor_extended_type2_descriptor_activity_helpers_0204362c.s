; Matching retail form; see src/game/actor_extended_type2_descriptor_activity_helpers.c.
.text
.extern data_020e8380
.extern data_020e83a5
.extern func_02033f7c
.global func_0204362c
.type func_0204362c, @function
func_0204362c: ; 0x0204362c
    ldrh r2, [r0, #0x4e]
    mov r0, #0x30
    ldr r1, .L_02043644
    mul r0, r2, r0
    ldrsb r0, [r1, r0]
    bx lr
.L_02043644: .word data_020e83a5

.size func_0204362c, . - func_0204362c

.global func_02043648
.type func_02043648, @function
func_02043648: ; 0x02043648
    ldrh r3, [r0, #0x4e]
    ldr r2, .L_02043670
    mov r0, #0x30
    mla r0, r3, r0, r2
    ldrsh r0, [r0, #0x2e]
    mov r0, r0, lsl #0x1c
    cmp r1, r0, asr #0x1c
    movge r0, #0x1
    movlt r0, #0x0
    bx lr
.L_02043670: .word data_020e8380

.size func_02043648, . - func_02043648

.global func_02043674
.type func_02043674, @function
func_02043674: ; 0x02043674
    stmdb sp!, {r3, lr}
    ldr r3, [r0, #0x260]
    tst r3, #0x8000
    ldmneia sp!, {r3, pc}
    bl func_02033f7c
    ldmia sp!, {r3, pc}

.size func_02043674, . - func_02043674

.global func_0204368c
.type func_0204368c, @function
func_0204368c: ; 0x0204368c
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x10]
    tst r1, #0x1000000
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r1, [r4, #0x14]
    tst r1, #0x2
    bne .L_020436b8
    tst r1, #0x4
    beq .L_020436c0
.L_020436b8:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_020436c0:
    ldr r1, [r4, #0x260]
    tst r1, #0x2
    beq .L_020436e4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xa8]
    blx r1
    cmp r0, #0x0
    moveq r0, #0x1
    beq .L_020436e8
.L_020436e4:
    mov r0, #0x0
.L_020436e8:
    cmp r0, #0x0
    bne .L_02043728
    ldr r0, [r4, #0x260]
    tst r0, #0x2
    beq .L_02043718
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xa8]
    blx r1
    cmp r0, #0x0
    moveq r0, #0x1
    beq .L_0204371c
.L_02043718:
    mov r0, #0x0
.L_0204371c:
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
.L_02043728:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.size func_0204368c, . - func_0204368c
