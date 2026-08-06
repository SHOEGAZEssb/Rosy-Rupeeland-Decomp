; Matching retail form; see src/overlays/ov000/overlay000_presentation_populate.c.
.text
.extern data_020d780c
.extern data_020f4e18
.extern data_021f3ecc
.extern gSystemState
.extern func_020628c8
.extern func_02062918
.extern func_02062928
.extern func_02062ae4
.extern func_02062e00
.extern func_02063064
.extern func_02063074
.extern func_02063084
.extern func_02063190
.extern func_02071ee0
.extern func_02073e48
.extern func_02073ffc
.extern func_02075598
.extern func_02076148
.extern func_02076428
.extern func_02079f3c
.extern func_02092e9c
.extern func_02093360
.extern func_020939d8
.extern func_ov000_021fb890
.global func_ov000_021fb8f0
func_ov000_021fb8f0: ; 0x021fb8f0
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0xc
    movs r5, r1
    mov r6, r0
    beq L_021fbc9c
    mov r1, #0x0
    bl func_ov000_021fb890
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
    ldr r0, L_021fbcac
    mov r7, #0x54
    ldrb r0, [r0, #0x5f]
    mov r4, #0x0
    cmp r0, #0x0
    mov r0, r5
    subne r7, r7, #0x2
    movne r4, #0x4
    bl func_02062e00
    ldrb r0, [r0, #0x2]
    ldr r1, [r6, #0x24]
    cmp r0, #0x3
    ldr r0, [r6, #0x0]
    bne L_021fba5c
    bl func_02075598
    str r7, [sp, #0x0]
    mov r0, #0x0
    str r0, [sp, #0x4]
    ldr r0, [r6, #0x0]
    mov r1, #0x70
    mov r2, #0x48
    mov r3, #0xc0
    bl func_02076428
    ldr r0, L_021fbcb0
    mov r1, #0x1b8
    bl func_02079f3c
    add r1, r0, #0x2
    mov r0, #0xe
    str r0, [sp, #0x0]
    mov r0, #0x4
    str r0, [sp, #0x4]
    mov r0, #0x0
    str r0, [sp, #0x8]
    ldr r0, [r6, #0x0]
    mov r2, #0x70
    mov r3, #0x48
    bl func_02076148
    ldr r0, [r6, #0x0]
    ldr r1, [r6, #0x20]
    bl func_02075598
    mov r0, #0x9a
    str r0, [sp, #0x0]
    mov r0, #0x0
    str r0, [sp, #0x4]
    ldr r0, [r6, #0x0]
    mov r1, #0x38
    mov r2, #0x8a
    mov r3, #0xd8
    bl func_02076428
    mov r0, #0x5
    str r0, [sp, #0x0]
    mov r0, #0x4
    str r0, [sp, #0x4]
    mov r0, #0x0
    str r0, [sp, #0x8]
    ldr r0, [r6, #0x0]
    add r1, r6, #0x48
    mov r2, #0x38
    mov r3, #0x8a
    bl func_02076148
    ldr r0, [r6, #0x4]
    add r1, r6, #0x8
    mov r2, #0x1
    bl func_02073ffc
    mov r1, #0x1
    str r1, [sp, #0x0]
    mov r2, #0x0
    str r2, [sp, #0x4]
    str r2, [sp, #0x8]
    mov r2, #0x5c
    mov r3, #0x44
    bl func_02073e48
    b L_021fbb94
L_021fba5c:
    bl func_02075598
    str r7, [sp, #0x0]
    mov r0, #0x0
    str r0, [sp, #0x4]
    ldr r0, [r6, #0x0]
    mov r1, #0x70
    mov r2, #0x48
    mov r3, #0xc0
    bl func_02076428
    ldr r0, L_021fbcb0
    ldr r1, L_021fbcb4
    bl func_02079f3c
    add r1, r0, #0x2
    mov r0, #0xe
    str r0, [sp, #0x0]
    mov r0, #0x4
    str r0, [sp, #0x4]
    mov r0, #0x0
    str r0, [sp, #0x8]
    ldr r0, [r6, #0x0]
    mov r2, #0x70
    mov r3, #0x48
    bl func_02076148
    ldr r0, [r6, #0x0]
    ldr r1, [r6, #0x20]
    bl func_02075598
    mov r0, #0x9a
    str r0, [sp, #0x0]
    mov r0, #0x0
    str r0, [sp, #0x4]
    ldr r0, [r6, #0x0]
    mov r1, #0x38
    mov r2, #0x8a
    mov r3, #0xd8
    bl func_02076428
    mov r0, #0xe
    str r0, [sp, #0x0]
    mov r0, #0x4
    str r0, [sp, #0x4]
    mov r0, #0x0
    str r0, [sp, #0x8]
    ldr r0, [r6, #0x0]
    add r1, r6, #0x48
    mov r2, #0x38
    mov r3, #0x8a
    bl func_02076148
    add r4, r4, r0
    mov r0, r5
    bl func_02062ae4
    mov r1, #0x34
    mul r2, r0, r1
    ldr r1, L_021fbcb8
    ldr r0, L_021fbcb0
    ldrh r1, [r1, r2]
    bl func_02079f3c
    add r1, r0, #0x2
    mov r0, #0xe
    str r0, [sp, #0x0]
    mov r0, #0x4
    str r0, [sp, #0x4]
    mov r0, #0x0
    str r0, [sp, #0x8]
    ldr r0, [r6, #0x0]
    add r2, r4, #0x38
    mov r3, #0x8a
    bl func_02076148
    ldr r0, [r6, #0x4]
    add r1, r6, #0x8
    mov r2, #0x1
    bl func_02073ffc
    mov r1, #0x1
    str r1, [sp, #0x0]
    mov r1, #0x0
    str r1, [sp, #0x4]
    mov r2, #0x5c
    mov r3, #0x44
    str r1, [sp, #0x8]
    bl func_02073e48
L_021fbb94:
    ldr r0, [r6, #0x0]
    ldr r1, [r6, #0x28]
    bl func_02075598
    mov r0, #0x44
    str r0, [sp, #0x0]
    mov r0, #0x0
    str r0, [sp, #0x4]
    ldr r0, [r6, #0x0]
    mov r1, #0x5c
    mov r2, #0x34
    mov r3, #0xe8
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
    mov r3, #0x34
    bl func_02076148
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
    ldr r1, L_021fbcbc
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
    mov r3, #0x44
    bl func_02073e48
    b L_021fbca4
L_021fbc9c:
    mov r1, #0x1
    bl func_ov000_021fb890
L_021fbca4:
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, pc}
L_021fbcac: .word gSystemState
L_021fbcb0: .word data_021f3ecc
L_021fbcb4: .word 0x1b7
L_021fbcb8: .word data_020d780c
L_021fbcbc: .word data_020f4e18
.size func_ov000_021fb8f0, . - func_ov000_021fb8f0

