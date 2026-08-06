; Matching retail form; see src/game/actor_extended_type2_center_waypoint.c.
.text
.extern data_020df9e8
.extern func_020ada8c
.extern genrand_int32
.global func_02042034
.type func_02042034, @function
func_02042034: ; 0x02042034
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r0
    ldr r3, [r7, #0xd0]
    add r2, r7, #0x200
    orr r3, r3, #0x2
    str r3, [r7, #0xd0]
    ldrsh r3, [r2, #0x5a]
    mov r6, r1
    cmp r3, #0x0
    bne .L_020420dc
    bl genrand_int32
    ldrsh r2, [r6, #0x8]
    bic r4, r0, #0x80000000
    mov r0, r4
    mov r1, #0x78
    mov r5, r2, lsl #0x1
    bl func_020ada8c
    add r3, r0, #0x78
    add r2, r7, #0x200
    mov r4, r4, asr #0x8
    mov r0, r4
    mov r1, r5
    strh r3, [r2, #0x58]
    bl func_020ada8c
    ldrsh r2, [r6, #0x8]
    ldr r3, [r7, #0x230]
    mov r1, r5
    sub r0, r0, r2
    add r0, r3, r0, lsl #0xc
    str r0, [r7, #0x7c]
    mov r0, r4, asr #0x8
    bl func_020ada8c
    ldrsh r1, [r6, #0x8]
    ldr r2, [r7, #0x234]
    sub r0, r0, r1
    add r0, r2, r0, lsl #0xc
    str r0, [r7, #0x80]
    ldr r0, [r7, #0x230]
    str r0, [r7, #0x7c]
    ldr r0, [r7, #0x234]
    str r0, [r7, #0x80]
    b .L_02042154
.L_020420dc:
    ldrh r1, [r2, #0x58]
    cmp r3, r1
    blt .L_02042100
    ldr r0, .L_0204216c
    ldr r1, [r0, #0x200]
    ldr r0, [r0, #0x204]
    str r1, [r7, #0x220]
    str r0, [r7, #0x224]
    b .L_02042154
.L_02042100:
    ldr r2, [r7, #0x20]
    ldr r1, [r7, #0x80]
    ldr r3, [r7, #0x1c]
    sub r1, r2, r1
    mov r2, r1, asr #0xc
    mul r1, r2, r2
    ldr r2, [r7, #0x7c]
    sub r2, r3, r2
    mov r2, r2, asr #0xc
    mla r1, r2, r2, r1
    cmp r1, #0x40
    ldrle r0, .L_0204216c
    ldrle r1, [r0, #0x1f8]
    ldrle r0, [r0, #0x1fc]
    strle r1, [r7, #0x220]
    strle r0, [r7, #0x224]
    ble .L_02042154
    ldr r2, [r0, #0x0]
    add r1, r7, #0x78
    ldr r2, [r2, #0xd0]
    blx r2
.L_02042154:
    add r1, r7, #0x200
    ldrsh r2, [r1, #0x5a]
    mov r0, #0x0
    add r2, r2, #0x1
    strh r2, [r1, #0x5a]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0204216c: .word data_020df9e8
.size func_02042034, . - func_02042034
