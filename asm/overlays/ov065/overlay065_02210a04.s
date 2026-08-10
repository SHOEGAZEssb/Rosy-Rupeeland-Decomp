.text
; Matching fallback for the portable implementation in src/overlays/ov065/overlay065_recovery.c.
.extern data_ov065_02210b5c
.extern VecFx32Object_Init
.extern VecFx32Object_InitCopy
.extern VecFx32Object_Destroy
.extern func_020befec
.extern func_020bf1f8
.extern func_ov065_0220fdac
.extern func_ov065_0221091c
.extern genrand_int32

.global func_ov065_02210a04
func_ov065_02210a04:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x38
    ldr r3, .L_02210b58
    mov r9, r1
    add r2, sp, #0x28
    mov r10, r0
    mov r1, #0x7
.L_02210a20:
    ldrh r0, [r3], #0x2
    subs r1, r1, #0x1
    strh r0, [r2], #0x2
    bne .L_02210a20
    mov r0, r9
    mov r1, #0x1e
    bl func_020befec
    mov r6, #0x0
    add r2, sp, #0x28
    b .L_02210a5c
.L_02210a48:
    mov r1, r6, lsl #0x1
    ldrsh r1, [r2, r1]
    cmp r1, r0
    bgt .L_02210a64
    add r6, r6, #0x1
.L_02210a5c:
    cmp r6, #0x7
    blt .L_02210a48
.L_02210a64:
    add r0, sp, #0x18
    cmp r6, #0x7
    add r1, r10, #0x124
    movge r6, #0x6
    bl VecFx32Object_InitCopy
    ldr r1, [sp, #0x24]
    add r0, sp, #0x8
    add r1, r1, #0x1e000
    str r1, [sp, #0x24]
    bl VecFx32Object_Init
    mov r7, #0x0
    add r5, sp, #0x28
    add r11, sp, #0x8
    mov r4, #0x50
    b .L_02210b30
.L_02210aa0:
    mov r8, r6
    b .L_02210b24
.L_02210aa8:
    mov r0, r8, lsl #0x1
    ldrsh r2, [r5, r0]
    cmp r9, r2
    blt .L_02210b20
    mov r0, r10
    mov r1, r11
    sub r9, r9, r2
    bl func_ov065_0221091c
    cmp r8, #0x0
    ble .L_02210adc
    bl genrand_int32
    tst r0, #0x7
    subeq r8, r8, #0x1
.L_02210adc:
    bl genrand_int32
    mov r1, #0x14
    bl func_020bf1f8
    add r0, r1, #0x43
    str r4, [sp, #0x0]
    str r0, [sp, #0x4]
    add r0, r10, #0x100
    ldrsh r2, [r0, #0x18]
    mov r0, #0x78
    mov r3, r8
    smlabb r0, r2, r0, r10
    add r0, r0, r7, lsl #0x2
    ldr r0, [r0, #0x28]
    add r1, sp, #0x18
    mov r2, r11
    bl func_ov065_0220fdac
    b .L_02210b2c
.L_02210b20:
    sub r8, r8, #0x1
.L_02210b24:
    cmp r8, #0x0
    bge .L_02210aa8
.L_02210b2c:
    add r7, r7, #0x1
.L_02210b30:
    cmp r7, #0x1e
    bge .L_02210b40
    cmp r9, #0x0
    bgt .L_02210aa0
.L_02210b40:
    add r0, sp, #0x8
    bl VecFx32Object_Destroy
    add r0, sp, #0x18
    bl VecFx32Object_Destroy
    add sp, sp, #0x38
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02210b58: .word data_ov065_02210b5c
.size func_ov065_02210a04, . - func_ov065_02210a04
