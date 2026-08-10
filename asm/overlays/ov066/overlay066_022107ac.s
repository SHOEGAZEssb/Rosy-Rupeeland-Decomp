.text
; Matching fallback for the portable implementation in src/overlays/ov066/overlay066_recovery.c.
.extern data_020f4e14
.extern data_020f4e18
.extern func_02071b94
.extern GraphicsSpriteGroupOwner_CreateGroup
.extern func_020be8c0
.extern func_020beae4
.extern func_020beb18
.extern func_020beb6c
.extern func_ov066_02210958

.global func_ov066_022107ac
func_ov066_022107ac:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0xc
    mov r7, r0
    mov r0, #0x0
    ldr r8, [sp, #0x3c]
    ldr r4, .L_0221094c
    str r0, [r7, #0x190]
    str r4, [r7, #0x1b4]
    rsb r0, r4, #0x1800
    str r0, [r7, #0x1b8]
    mov r6, r1
    mov r5, r2
    mov r4, r3
    cmp r8, #0x0
    mov r0, r8, lsl #0xc
    ble .L_02210800
    bl func_020beb18
    mov r1, r0
    mov r0, #0x3f000000
    bl func_020be8c0
    b .L_0221080c
.L_02210800:
    bl func_020beb18
    mov r1, #0x3f000000
    bl func_020beb6c
.L_0221080c:
    mov r10, r0
    ldr r0, [sp, #0x38]
    cmp r0, #0x0
    mov r0, r0, lsl #0xc
    ble .L_02210834
    bl func_020beb18
    mov r1, r0
    mov r0, #0x3f000000
    bl func_020be8c0
    b .L_02210840
.L_02210834:
    bl func_020beb18
    mov r1, #0x3f000000
    bl func_020beb6c
.L_02210840:
    mov r8, r0
    ldr r0, [sp, #0x34]
    cmp r0, #0x0
    mov r0, r0, lsl #0xc
    ble .L_02210868
    bl func_020beb18
    mov r1, r0
    mov r0, #0x3f000000
    bl func_020be8c0
    b .L_02210874
.L_02210868:
    bl func_020beb18
    mov r1, #0x3f000000
    bl func_020beb6c
.L_02210874:
    mov r9, r0
    ldr r0, [sp, #0x30]
    cmp r0, #0x0
    mov r0, r0, lsl #0xc
    ble .L_0221089c
    bl func_020beb18
    mov r1, r0
    mov r0, #0x3f000000
    bl func_020be8c0
    b .L_022108a8
.L_0221089c:
    bl func_020beb18
    mov r1, #0x3f000000
    bl func_020beb6c
.L_022108a8:
    bl func_020beae4
    mov r11, r0
    mov r0, r9
    bl func_020beae4
    mov r9, r0
    mov r0, r8
    bl func_020beae4
    mov r8, r0
    mov r0, r10
    bl func_020beae4
    str r0, [sp, #0x0]
    mov r1, r11
    mov r2, r9
    mov r3, r8
    add r0, r7, #0x194
    bl func_ov066_02210958
    mov r1, #0x0
    mov r0, r1
.L_022108f0:
    str r0, [r7, r1, lsl #0x2]
    add r1, r1, #0x1
    cmp r1, #0x64
    blt .L_022108f0
    ldr r0, .L_02210950
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteGroupOwner_CreateGroup
    str r0, [r7, #0x1a4]
    add r0, r7, #0x1a8
    str r0, [sp, #0x0]
    add r0, r7, #0x1ac
    str r0, [sp, #0x4]
    add r1, r7, #0x1b0
    ldr r0, .L_02210954
    str r1, [sp, #0x8]
    ldr r0, [r0, #0x0]
    mov r1, r6
    mov r2, r5
    mov r3, r4
    bl func_02071b94
    mov r0, r7
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0221094c: .word 0xb33
.L_02210950: .word data_020f4e14
.L_02210954: .word data_020f4e18
.size func_ov066_022107ac, . - func_ov066_022107ac
