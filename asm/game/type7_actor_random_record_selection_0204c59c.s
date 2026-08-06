; Matching retail form; see src/game/type7_actor_random_record_selection.c.
.extern GameWork_TestFlag
.extern genrand_int32
.extern func_020ada8c
.extern gGameWork
.extern data_020e16b0
.extern data_020ea9b0
.text
    .global func_0204c59c
func_0204c59c: ; 0x0204c59c
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x58
    mov r9, #0x0
    cmp r0, #0xd
    mov r10, r1
    subeq r7, r9, #0x1
    beq .L_0204c5e4
    cmp r0, #0xc
    moveq r7, r9
    beq .L_0204c5e4
    cmp r0, #0xb
    moveq r7, #0x1
    beq .L_0204c5e4
    cmp r0, #0xa
    moveq r7, #0x2
    beq .L_0204c5e4
    sub r0, r9, #0x1
    b .L_0204c738
.L_0204c5e4:
    ldr r0, .L_0204c740
    add r1, r10, r10, lsl #0x1
    ldr r0, [r0, #0x0]
    add r1, r1, #0xaf
    mov r6, #0x0
    add r4, r0, r1, lsl #0x1
    add r2, sp, #0x0
.L_0204c600:
    add r3, r4, r6, lsl #0x1
    add r1, r6, #0x1
    ldrsh r3, [r3, #0x4c]
    mov r5, r6, lsl #0x1
    mov r1, r1, lsl #0x10
    mov r6, r1, asr #0x10
    strh r3, [r2, r5]
    cmp r6, #0x3
    blt .L_0204c600
    mov r5, #0x0
    add r3, sp, #0x0
.L_0204c62c:
    add r4, r0, r5, lsl #0x2
    add r1, r5, #0x1
    mov r1, r1, lsl #0x10
    add r2, r3, r5, lsl #0x1
    ldr r4, [r4, #0x3d0]
    mov r5, r1, asr #0x10
    strh r4, [r2, #0x6]
    cmp r5, #0x3
    blt .L_0204c62c
    ldr r0, .L_0204c744
    ldr r5, .L_0204c748
    ldr r0, [r0, #0x2b4]
    mov r8, #0x0
    strh r0, [sp, #0xc]
    add r4, sp, #0x0
    add r11, sp, #0xe
.L_0204c66c:
    mov r0, #0x68
    smlabb r6, r8, r0, r5
    ldrb r0, [r6, #0x55]
    cmp r0, r10
    bne .L_0204c6ec
    ldr r0, .L_0204c740
    ldr r1, [r6, #0x64]
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    beq .L_0204c6ec
    mov r2, #0x0
    mov r3, r2
    ldrsh r1, [r6, #0x0]
    b .L_0204c6c0
.L_0204c6a8:
    mov r0, r3, lsl #0x1
    ldrsh r0, [r4, r0]
    cmp r1, r0
    moveq r2, #0x1
    beq .L_0204c6c8
    add r3, r3, #0x1
.L_0204c6c0:
    cmp r3, #0x7
    blt .L_0204c6a8
.L_0204c6c8:
    cmp r2, #0x0
    bne .L_0204c6ec
    mvn r0, #0x0
    cmp r7, r0
    ldrneh r0, [r6, #0x36]
    cmpne r7, r0
    moveq r0, r9, lsl #0x1
    streqh r8, [r11, r0]
    addeq r9, r9, #0x1
.L_0204c6ec:
    add r0, r8, #0x1
    mov r0, r0, lsl #0x10
    mov r8, r0, asr #0x10
    cmp r8, #0x24
    blt .L_0204c66c
    cmp r9, #0x0
    mvnle r0, #0x0
    ble .L_0204c738
    bl genrand_int32
    mov r1, r9
    bic r0, r0, #0x80000000
    bl func_020ada8c
    add r1, sp, #0xe
    mov r0, r0, lsl #0x1
    ldrsh r2, [r1, r0]
    mov r0, #0x68
    ldr r1, .L_0204c748
    smulbb r0, r2, r0
    ldrsh r0, [r1, r0]
.L_0204c738:
    add sp, sp, #0x58
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0204c740: .word gGameWork
.L_0204c744: .word data_020e16b0
.L_0204c748: .word data_020ea9b0
.size func_0204c59c, . - func_0204c59c

