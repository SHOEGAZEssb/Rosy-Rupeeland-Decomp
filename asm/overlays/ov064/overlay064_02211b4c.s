.text
; Matching fallback for the portable implementation in src/overlays/ov064/overlay064_recovery.c.
.extern GameWork_SetFlag
.extern GameWork_TestFlag
.extern data_020ed548
.extern data_021052fc
.extern func_0200500c
.extern func_02005058
.extern func_020050a4
.extern func_0204f848
.extern func_020627a0
.extern func_0207a19c
.extern func_020bf1f8
.extern func_ov064_02211098
.extern gGameWork
.extern genrand_int32

.global func_ov064_02211b4c
func_ov064_02211b4c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x54
    mov r9, r0
    mov r8, r1
    bl genrand_int32
    mov r1, #0x64
    bl func_020bf1f8
    ldr r0, .L_02211cd8
    mov r7, r1
    ldr r0, [r0, #0x0]
    add r0, r0, #0x3000
    ldr r0, [r0, #0xbc]
    ldr r0, [r0, #0x0]
    bl func_0207a19c
    ldr r1, .L_02211cdc
    mov r4, r0
    ldr r0, [r1, #0x0]
    ldr r1, .L_02211ce0
    mov r6, #0x0
    bl GameWork_TestFlag
    cmp r0, #0x0
    bne .L_02211bbc
    ldr r0, .L_02211cdc
    ldr r1, .L_02211ce0
    ldr r0, [r0, #0x0]
    mov r5, r6
    bl GameWork_SetFlag
    b .L_02211bfc
.L_02211bbc:
    ldr r1, .L_02211ce4
    mov r0, #0x28
    mla r3, r4, r0, r1
    mov r5, r6
    mov r0, #0x14
    b .L_02211bf4
.L_02211bd4:
    ldrsb r2, [r9, #0x76]
    mla r1, r2, r0, r3
    add r1, r1, r5, lsl #0x2
    ldrh r1, [r1, #0x2]
    add r6, r6, r1
    cmp r6, r7
    bge .L_02211bfc
    add r5, r5, #0x1
.L_02211bf4:
    cmp r5, #0x4
    blt .L_02211bd4
.L_02211bfc:
    ldr r1, .L_02211ce4
    mov r0, #0x28
    mla r2, r4, r0, r1
    ldrsb r3, [r9, #0x76]
    mov r0, #0x14
    mov r1, r5, lsl #0x2
    mla r0, r3, r0, r2
    ldrh r1, [r1, r0]
    ldr r0, .L_02211ce8
    cmp r1, r0
    cmpne r1, #0x55
    beq .L_02211cd0
    mov r3, #0x0
    add r0, sp, #0x30
    mov r2, #0x1
    strh r3, [sp, #0x32]
    strh r3, [sp, #0x34]
    strh r3, [sp, #0x36]
    str r3, [sp, #0x3c]
    str r3, [sp, #0x40]
    str r0, [sp, #0x44]
    str r2, [sp, #0x48]
    str r0, [sp, #0x4c]
    str r3, [sp, #0x50]
    bl func_020627a0
    mov r1, #0x0
    add r0, sp, #0x10
    mov r2, r1
    mov r3, #0x20000
    bl func_0200500c
    add r0, sp, #0x20
    add r2, sp, #0x10
    mov r1, r8
    bl func_ov064_02211098
    add r0, sp, #0x10
    bl func_02005058
    add r0, sp, #0x20
    add r1, sp, #0x30
    mov r2, #0x168
    bl func_0204f848
    mov r1, #0x0
    mov r4, r0
    add r0, sp, #0x0
    mov r2, r1
    mov r3, #0x5000
    bl func_0200500c
    add r0, r4, #0x38
    add r1, sp, #0x0
    bl func_020050a4
    add r0, sp, #0x0
    bl func_02005058
    add r0, sp, #0x20
    bl func_02005058
.L_02211cd0:
    add sp, sp, #0x54
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_02211cd8: .word data_021052fc
.L_02211cdc: .word gGameWork
.L_02211ce0: .word 0x411
.L_02211ce4: .word data_020ed548
.L_02211ce8: .word 0xffff
.size func_ov064_02211b4c, . - func_ov064_02211b4c
