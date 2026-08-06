    .text
    .extern func_ov001_021fb81c
    .extern func_02062928
    .extern func_02092e9c
    .extern func_020939d8
    .extern func_02093360
    .extern func_02075598
    .extern func_02076428
    .extern func_02062a60
    .extern func_02076148
    .extern func_02073ffc
    .extern func_02062ab0
    .extern func_02073e48
    .extern func_020628c8
    .extern func_02062918
    .extern func_02063064
    .extern func_02063074
    .extern func_02063084
    .extern func_02071ee0
    .extern func_02063190
    .extern gSystemState
    .extern data_020f4e18
    .global func_ov001_021fb87c
func_ov001_021fb87c: ; 0x021fb87c
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0xc
    movs r5, r1
    mov r6, r0
    mov r4, r2
    beq L_021fba90
    mov r1, #0x0
    bl func_ov001_021fb81c
    mov r0, r5
    bl func_02062928
    mov r1, r0
    ldr r0, [r6, #0x44]
    mov r2, #0x1
    bl func_02092e9c
    ldr r0, [r6, #0x44]
    bl func_020939d8
    ldr r0, [r6, #0x44]
    mov r1, #0x0
    bl func_02093360
    ldr r0, L_021fbaa0
    mov r7, #0x58
    ldrb r0, [r0, #0x5f]
    ldr r1, [r6, #0x24]
    cmp r0, #0x0
    ldr r0, [r6, #0x0]
    subne r7, r7, #0x2
    bl func_02075598
    str r7, [sp, #0x0]
    mov r0, #0x0
    str r0, [sp, #0x4]
    ldr r0, [r6, #0x0]
    mov r1, #0x70
    mov r2, #0x4c
    mov r3, #0xe0
    bl func_02076428
    mov r0, r5
    bl func_02062a60
    mov r1, r0
    mov r0, #0xe
    str r0, [sp, #0x0]
    mov r0, #0x6
    str r0, [sp, #0x4]
    mov r0, #0x0
    str r0, [sp, #0x8]
    ldr r0, [r6, #0x0]
    mov r2, #0x70
    mov r3, #0x4c
    bl func_02076148
    ldr r0, [r6, #0x4]
    add r1, r6, #0x8
    mov r2, #0x1
    bl func_02073ffc
    mov r7, r0
    mov r0, r5
    bl func_02062ab0
    mov r2, #0x1
    str r2, [sp, #0x0]
    mov r2, #0x0
    str r2, [sp, #0x4]
    mov r1, r0
    str r2, [sp, #0x8]
    mov r0, r7
    mov r2, #0x5c
    mov r3, #0x48
    bl func_02073e48
    ldr r0, [r6, #0x0]
    ldr r1, [r6, #0x28]
    bl func_02075598
    mov r0, #0x48
    str r0, [sp, #0x0]
    mov r0, #0x0
    str r0, [sp, #0x4]
    ldr r0, [r6, #0x0]
    mov r1, #0x5c
    mov r2, #0x38
    mov r3, #0xcc
    bl func_02076428
    mov r0, r5
    bl func_020628c8
    mov r1, r0
    mov r0, #0xe
    str r0, [sp, #0x0]
    mov r0, #0x6
    str r0, [sp, #0x4]
    mov r0, #0x0
    str r0, [sp, #0x8]
    ldr r0, [r6, #0x0]
    mov r2, #0x5c
    mov r3, #0x38
    bl func_02076148
    cmp r4, #0x0
    beq L_021fba98
    mov r0, r5
    mov r1, #0x0
    bl func_02062918
    bl func_02063064
    mov r7, r0
    mov r0, r5
    mov r1, #0x0
    bl func_02062918
    bl func_02063074
    mov r4, r0
    mov r0, r5
    mov r1, #0x0
    bl func_02062918
    bl func_02063084
    mov r2, r7
    mov r3, r4
    str r0, [sp, #0x0]
    add r0, r6, #0x14
    ldr r1, L_021fbaa4
    ldr r1, [r1, #0x0]
    bl func_02071ee0
    ldr r0, [r6, #0x4]
    add r1, r6, #0x14
    mov r2, #0x2
    bl func_02073ffc
    mov r4, r0
    mov r0, r5
    mov r1, #0x0
    bl func_02062918
    bl func_02063190
    mov r1, r0
    mov r0, r4
    mov r2, #0x1
    str r2, [sp, #0x0]
    mov r2, #0x0
    str r2, [sp, #0x4]
    str r2, [sp, #0x8]
    mov r2, #0x48
    mov r3, r2
    bl func_02073e48
    b L_021fba98
L_021fba90:
    mov r1, #0x1
    bl func_ov001_021fb81c
L_021fba98:
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, pc}
L_021fbaa0: .word gSystemState
L_021fbaa4: .word data_020f4e18
    .size func_ov001_021fb87c, .-func_ov001_021fb87c
