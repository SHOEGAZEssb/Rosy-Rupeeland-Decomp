; Matching retail form; see src/game/dual_array_blend_presentation.c.
.text
.extern GameWork_ClearFlag
.extern GameWork_SetFlag
.extern GameWork_TestFlag
.extern Heap_Free
.extern __construct_array
.extern __destroy_arr
.extern data_020c36c4
.extern data_020d63d0
.extern data_020d63e0
.extern data_020d658c
.extern data_021055dc
.extern func_0201e250
.extern func_0201e28c
.extern func_020215a0
.extern func_020215a4
.extern func_020218c0
.extern func_02021934
.extern func_0202194c
.extern func_020219bc
.extern func_02021ad8
.extern func_0209189c
.extern func_020918f4
.extern func_02092418
.extern func_020948e4
.extern func_02094ad4
.extern func_02094bbc
.extern func_02094d28
.extern func_020afd0c
.extern gGameWork
.extern gSystemState
.extern genrand_int32

.global func_02022040
    .type func_02022040, @function
func_02022040: ; 0x02022040
    stmdb sp!, {r4, lr}
    ldr r2, [r0, #0x1c]
    cmp r2, #0x0
    ldmeqia sp!, {r4, pc}
    cmp r1, #0xc0
    ldmgeia sp!, {r4, pc}
    ldr r2, .L_02022238
    add r3, r1, #0x10
    ldr r4, [r2, #0x64]
    mov r2, r3, asr #0x5
    add r4, r1, r4, lsr #0x2
    mov ip, r4, lsl #0x1b
    add r2, r3, r2, lsr #0x1a
    mov r4, r2, asr #0x6
    ldr r2, .L_0202223c
    mov r3, ip, lsr #0x1a
    cmp r4, #0x3
    ldrsh r2, [r2, r3]
    bge .L_020220f8
    ldr r3, [r0, #0x18]
    ldr ip, .L_02022240
    cmp r3, #0x1
    mov r3, #0x9c
    mla r3, r4, r3, r0
    bne .L_020220d0
    ldr r4, [r3, #0x30]
    mov lr, ip, lsl #0x10
    mov r3, r4, asr #0xb
    add r3, r4, r3, lsr #0x14
    add r4, r2, #0x10
    and ip, ip, r3, asr #0xc
    and r4, lr, r4, lsl #0x10
    ldr r3, .L_02022244
    orr r4, ip, r4
    str r4, [r3, #0x0]
    b .L_020220f8
.L_020220d0:
    ldr r4, [r3, #0x30]
    mov lr, ip, lsl #0x10
    mov r3, r4, asr #0xb
    add r3, r4, r3, lsr #0x14
    add r4, r2, #0x10
    and ip, ip, r3, asr #0xc
    and r4, lr, r4, lsl #0x10
    ldr r3, .L_02022248
    orr r4, ip, r4
    str r4, [r3, #0x0]
.L_020220f8:
    sub ip, r1, #0x10
    mov r3, ip, asr #0x5
    add r3, ip, r3, lsr #0x1a
    mov ip, r3, asr #0x6
    cmp ip, #0x3
    bge .L_0202217c
    ldr r3, [r0, #0x18]
    cmp r3, #0x1
    mov r3, #0x9c
    mla r3, ip, r3, r0
    ldr ip, .L_02022240
    bne .L_02022154
    ldr lr, [r3, #0x204]
    mov r3, lr, asr #0xb
    add r3, lr, r3, lsr #0x14
    sub lr, r2, #0x10
    mov r2, ip, lsl #0x10
    and ip, ip, r3, asr #0xc
    and r3, r2, lr, lsl #0x10
    ldr r2, .L_0202224c
    orr r3, ip, r3
    str r3, [r2, #0x0]
    b .L_0202217c
.L_02022154:
    ldr lr, [r3, #0x204]
    mov r3, lr, asr #0xb
    add r3, lr, r3, lsr #0x14
    sub lr, r2, #0x10
    mov r2, ip, lsl #0x10
    and ip, ip, r3, asr #0xc
    and r3, r2, lr, lsl #0x10
    ldr r2, .L_02022250
    orr r3, ip, r3
    str r3, [r2, #0x0]
.L_0202217c:
    sub r3, r1, #0x10
    mov r1, r3, asr #0x4
    ldr r2, [r0, #0x18]
    add r0, r3, r1, lsr #0x1b
    cmp r2, #0x1
    mov r0, r0, asr #0x5
    bne .L_020221ec
    tst r0, #0x1
    ldr r1, .L_02022254
    beq .L_020221c8
    ldrh r0, [r1, #0x0]
    bic r0, r0, #0x3
    orr r0, r0, #0x1
    strh r0, [r1, #0x0]
    ldrh r0, [r1, #0x2]
    bic r0, r0, #0x3
    orr r0, r0, #0x2
    strh r0, [r1, #0x2]
    ldmia sp!, {r4, pc}
.L_020221c8:
    ldrh r0, [r1, #0x0]
    bic r0, r0, #0x3
    orr r0, r0, #0x2
    strh r0, [r1, #0x0]
    ldrh r0, [r1, #0x2]
    bic r0, r0, #0x3
    orr r0, r0, #0x1
    strh r0, [r1, #0x2]
    ldmia sp!, {r4, pc}
.L_020221ec:
    tst r0, #0x1
    ldr r1, .L_02022258
    beq .L_02022218
    ldrh r0, [r1, #0x0]
    bic r0, r0, #0x3
    strh r0, [r1, #0x0]
    ldrh r0, [r1, #0x2]
    bic r0, r0, #0x3
    orr r0, r0, #0x1
    strh r0, [r1, #0x2]
    ldmia sp!, {r4, pc}
.L_02022218:
    ldrh r0, [r1, #0x0]
    bic r0, r0, #0x3
    orr r0, r0, #0x1
    strh r0, [r1, #0x0]
    ldrh r0, [r1, #0x2]
    bic r0, r0, #0x3
    strh r0, [r1, #0x2]
    ldmia sp!, {r4, pc}
.L_02022238: .word gSystemState
.L_0202223c: .word data_020c36c4
.L_02022240: .word 0x1ff
.L_02022244: .word 0x4000010
.L_02022248: .word 0x4001018
.L_0202224c: .word 0x4000014
.L_02022250: .word 0x400101c
.L_02022254: .word 0x4000008
.L_02022258: .word 0x400100c
    .size func_02022040, .-func_02022040

