.text
; Matching fallback for the portable implementation in src/overlays/ov080/overlay080_recovery.c.
.extern data_020eb850
.extern data_ov080_02213f44
.extern ActorExtendedType2_Init
.extern func_020bf1f8
.extern func_ov080_02212ae0
.extern gGameWork
.extern genrand_int32

.global func_ov080_02212af4
func_ov080_02212af4:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x30
    mov r4, r0
    bl ActorExtendedType2_Init
    ldr r0, .L_02212bb0
    mov r1, #0x0
    str r0, [r4, #0x0]
    strb r1, [r4, #0x298]
    strb r1, [r4, #0x299]
    add r0, r4, #0x200
    strh r1, [r0, #0xa2]
    ldr r1, [r4, #0x14]
    mov r0, r4
    orr r1, r1, #0x40
    str r1, [r4, #0x14]
    ldr r2, [r0, #0x0]
    add r1, sp, #0x0
    ldr r2, [r2, #0xc8]
    blx r2
    mov ip, #0x0
    ldrsb r5, [sp, #0x25]
    ldr r3, .L_02212bb4
    mov lr, ip
    mov r0, #0x32
.L_02212b54:
    mul r2, lr, r0
    ldrsh r1, [r3, r2]
    add lr, lr, #0x1
    cmp r5, r1
    addeq ip, r3, r2
    cmp lr, #0x43
    blt .L_02212b54
    str ip, [r4, #0x29c]
    bl genrand_int32
    mov r1, #0x78
    bl func_020bf1f8
    add r0, r4, #0x200
    strh r1, [r0, #0x9a]
    ldr r0, .L_02212bb8
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mov r2, #0x7d
    bl func_ov080_02212ae0
    add r1, r4, #0x200
    strh r0, [r1, #0xa0]
    mov r0, r4
    add sp, sp, #0x30
    ldmia sp!, {r3, r4, r5, pc}
.L_02212bb0: .word data_ov080_02213f44
.L_02212bb4: .word data_020eb850
.L_02212bb8: .word gGameWork
.size func_ov080_02212af4, . - func_ov080_02212af4
